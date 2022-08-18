/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */
#include <string.h>
#include <xc.h>
#include "mcc.h"
#include "cmd.h"
#include "mrtc.h"
#include "vadjust.h"
#include "config.h"
#include "pulsecount.h"
#include "reset.h"
#include "sleep.h"
#include "hven.h"


cmd_struct cmd;

static cmd_struct cmdShadow;
static nvparam_t nvparam;
static uint32_t progpwd;
static bool adjustvalAccess;
static bool progAccess;
static bool pwmAccess;
static bool writeRequested;
static volatile bl_status_t __at(0x320) bl_requested;

static struct {
    uint32_t pwd;
    uint16_t dutyc;
}pwmStruct;

static struct {
    uint32_t pwd;
    lut_element lut[LUT_SIZE];
} adjustval = {0};

static void checkParamChanges(void);
static void cmdSetVoltage(uint16_t volt);


#ifdef __DEBUG
struct {
    I2C_DRIVER_STATUS driverstatus;
    uint8_t data;
    uint8_t status;
    uint8_t addr;
} statusHistory[8];

int historyIdx;
#endif

void cmdInit() {
    loadNvPrams(&nvparam);
    cmd.pulseCtr = 0;
#ifdef SAVEPARAMS    
    cmd.timeout = nvparam.nv_timeout;
    cmd.voltage = nvparam.nv_voltage;
    cmd.sw_version = nvparam.sw_version;
    cmd.hw_version = nvparam.hw_version;
#else
    cmd.timeout = 0;
    cmd.voltage = 0;
    
    
    cmd.sw_version = SW_VERSION;
    cmd.hw_version = HW_VERSION;
#endif    
    cmd.serialno = nvparam.serialno;
    memcpy((uint8_t*)&cmdShadow, (uint8_t *)&cmd, sizeof(cmd_struct));

    TMR3_WriteTimer(0);
    setTrigTimeout(cmd.timeout);
    cmdSetVoltage(cmd.voltage);
    
    progpwd = 0UL;
    adjustvalAccess = false;
    progAccess = false;
    pwmAccess = false;
    bl_requested.status = 0;
    bl_requested.statusInv = 0;
    writeRequested = false;
    enableSleep(SLEEP_ALL);
#ifdef __DEBUG    
    for(int idx = 0; idx < 8; idx++){
        statusHistory[idx].driverstatus = -1;
        statusHistory[idx].data = 0xaa;
        statusHistory[idx].status = 0x55;
        statusHistory[idx].addr = 0xff;
    }
    historyIdx = 0;
#endif    
}

static void cmdSetVoltage(uint16_t volt) {
    voutSet(volt,nvparam.lut);    
}

void I2C_StatusCallback(I2C_DRIVER_STATUS i2c_bus_state, const uint8_t wrData)
{

    static uint8_t* CMD_Write_Buffer;
    static uint8_t* CMD_Read_Buffer;
    static uint8_t bufSize = 0;

    static uint8_t periphAddress = 0;
    static enum
	{
	    SLAVE_NORMAL_DATA,
	    SLAVE_DATA_ADDRESS,
	}slaveWriteType = SLAVE_DATA_ADDRESS;
    static bool dataAccessed = false;
    static bool pulseCountRead = false;
    static bool iWasAddressed=false;

#ifdef __DEBUG    
    statusHistory[historyIdx].driverstatus = i2c_bus_state;
    statusHistory[historyIdx].status = SSP1STAT;
#endif    
    switch (i2c_bus_state)
    {
        case I2C_PERIPHERAL_START_DETECTED:
            iWasAddressed = false;
            break;
        
        case I2C_PERIPHERAL_WRITE_ADDRESS:
            disableSleep(SLEEP_COM);
            slaveWriteType  = SLAVE_DATA_ADDRESS;
            iWasAddressed = true;
            break;


        case I2C_PERIPHERAL_WRITE_DATA:
            switch(slaveWriteType)
            {
                case SLAVE_DATA_ADDRESS:
                    if(wrData < VADJ_ADDR) {
                        periphAddress   = wrData;
                        CMD_Write_Buffer = (uint8_t*)&cmdShadow;
                        CMD_Read_Buffer = (uint8_t*)&cmd;
                        bufSize = sizeof(cmd_struct);
                    }else if (wrData < (VADJ_ADDR+sizeof(adjustval))) {
                        periphAddress   = wrData - VADJ_ADDR;
                        CMD_Write_Buffer = (uint8_t*)&adjustval;
                        CMD_Read_Buffer = (uint8_t*)&adjustval;
                        bufSize = sizeof(adjustval);
                        adjustvalAccess = true;
                    }else if((wrData >= PROG_ADDR) && 
                       (wrData < (PROG_ADDR+sizeof(uint32_t))))
                    {
                        periphAddress   = wrData - PROG_ADDR;
                        CMD_Write_Buffer = (uint8_t*)&progpwd;
                        CMD_Read_Buffer = (uint8_t*)&progpwd;
                        bufSize = sizeof(uint32_t);
                        progAccess = true;
                    }else if((wrData >= PWM_ADDR) && 
                       (wrData < (PWM_ADDR+sizeof(pwmStruct)))) {
                        periphAddress   = wrData - PWM_ADDR;
                        CMD_Write_Buffer = (uint8_t*)&pwmStruct;
                        CMD_Read_Buffer = (uint8_t*)&pwmStruct;
                        bufSize = sizeof(pwmStruct);
                        pwmAccess = true;
                    }else
                    {
                        periphAddress   = 0;
                        CMD_Write_Buffer = (uint8_t*)&cmdShadow;
                        CMD_Read_Buffer = (uint8_t*)&cmd;
                        bufSize = sizeof(cmd_struct);
                    }
                    dataAccessed = false;
                    pulseCountRead = false;
                    break;

                case SLAVE_NORMAL_DATA:
                default:
                    if(periphAddress < bufSize) {
                        CMD_Write_Buffer[periphAddress++] = wrData;    
                    }
                    dataAccessed = true;
                    break;
            }

            slaveWriteType  = SLAVE_NORMAL_DATA;
            break;
        case I2C_PERIPHERAL_READ_ADDRESS:
            if((pulseCountRead == false) && (periphAddress == 0) && (cmd.timeout == 0)) {
                cmd.pulseCtr = getPulseCount();
                pulseCountRead = true;
            }
            adjustvalAccess = false;
            progAccess = false;
            pwmAccess = false;
            if(periphAddress < bufSize) {
#ifdef __DEBUG    
                statusHistory[historyIdx].data = CMD_Read_Buffer[periphAddress];
                statusHistory[historyIdx].addr = periphAddress;
#endif    
                SSP1BUF = CMD_Read_Buffer[periphAddress];
            }else {
                SSP1BUF = 0;
            }
            break;
        case I2C_PERIPHERAL_READ_NEXT:
            if(++periphAddress < bufSize) {
#ifdef __DEBUG    
                statusHistory[historyIdx].data = CMD_Read_Buffer[periphAddress];
                statusHistory[historyIdx].addr = periphAddress;
#endif    
                SSP1BUF = CMD_Read_Buffer[periphAddress];
            }else {
                SSP1BUF = 0;
            }
            break;
        case I2C_PERIPHERAL_STOP_DETECTED:
            if(iWasAddressed && dataAccessed) {
                checkParamChanges();
                dataAccessed = false;
            }
            bufSize = 0;
            periphAddress = 0;
            slaveWriteType = SLAVE_DATA_ADDRESS;
            pulseCountRead = false;
            iWasAddressed = false;
            enableSleep(SLEEP_COM);           
            break;
        default:;
    }
#ifdef __DEBUG    
    if(historyIdx < 8){
        historyIdx++;
    }
#endif            
} 

static void checkParamChanges(void) {
    
    if(progAccess) {
        if(progpwd == PROG_PASSWORD) {
            bl_requested.status = BL_REQUESTED;
            bl_requested.statusInv = (uint8_t)~BL_REQUESTED;
            swReset();
        } 
        progpwd = 0UL;
        progAccess = false;
        
    }else if(pwmAccess) {
        if(pwmStruct.pwd == PWM_PASSWORD) {
            pwmDuty(pwmStruct.dutyc);
            voutEnable();
        } 
        pwmStruct.pwd = 0UL;
        pwmStruct.dutyc = 0;
        pwmAccess = false;
        
    }else if(adjustvalAccess) {
            if(adjustval.pwd == VADJ_PASSWORD) {
                memcpy(nvparam.lut,adjustval.lut,sizeof(nvparam.lut));
                writeRequested = true;
            } 
            adjustvalAccess = false;
    }else{
        if(cmd.timeout != cmdShadow.timeout) {
            cmd.timeout = cmdShadow.timeout;
            setTrigTimeout(cmd.timeout);
#ifdef SAVEPARAMS            
            nvparam.nv_timeout = cmd.timeout;
            writeRequested = true;
#endif
        }
        if(cmd.voltage != cmdShadow.voltage) {
            cmd.voltage = cmdShadow.voltage;
            cmdSetVoltage(cmd.voltage);
#ifdef SAVEPARAMS 
            nvparam.nv_voltage = cmd.voltage;
            writeRequested = true;
#endif
        }
        if(cmd.serialno == 0UL){
            if(cmdShadow.serialno!=0UL) {
                cmd.serialno = cmdShadow.serialno;
                nvparam.serialno =  cmdShadow.serialno;
                writeRequested = true;
            }
        }
    }
#ifndef SAVEPARAMS
    if(writeRequested){
        while(saveNvParams(&nvparam));
        writeRequested = false;
    }
    
#endif    
}
