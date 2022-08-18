/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#ifndef CMD_H
#define	CMD_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <stdint.h>

//#define SAVEPARAMS
    
typedef struct {
    uint24_t pulseCtr; 
    uint16_t timeout;
    uint16_t voltage;
    uint16_t hw_version;
    uint16_t sw_version;
    uint32_t serialno;
    uint8_t dummy;
}cmd_struct;

#define TIMEOUT_VAL_ALLPULSE    0
#define TIMEOUT_VAL_NOPULSE     0xffff

#define VOLTAGE_MIN (400)
#define VOLTAGE_MAX (600)

#define VADJ_PASSWORD 0x54780a2c
#define VADJ_ADDR   0x90
#define PROG_PASSWORD 0x54780a2c
#define PROG_ADDR   0xE0    

#define PWM_PASSWORD 0x54780a3c
#define PWM_ADDR   0xF0    

#ifdef SAVEPARAMS
#define SAVETAG 0x01
#else
#define SAVETAG 0
#endif

#define CFG_VERSION (0x13|SAVETAG)
#define LUT_SIZE    11

typedef struct {
    uint16_t voltage;
    uint16_t dutycycle;
}lut_element;

typedef struct {
    uint8_t  cfg_version;
#ifdef SAVEPARAMS
    uint16_t hw_version;
    uint16_t sw_version;
    uint16_t nv_timeout;
    uint16_t nv_voltage;
#endif    
    uint32_t serialno;
    lut_element lut[LUT_SIZE];
    uint8_t crc;
}nvparam_t;


extern cmd_struct cmd;

void cmdInit(void);

typedef struct {
    uint8_t status;
    uint8_t statusInv;
}bl_status_t; 
#define BL_REQUESTED 0x5A


#ifdef	__cplusplus
}
#endif

#endif	/* CMD_H */

