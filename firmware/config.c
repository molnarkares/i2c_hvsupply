/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */
#include <string.h>
#include "memory.h"
#include "cmd.h"
#include "config.h"
#include "crc8.h"
#include "vadjust.h"




static const nvparam_t defparams = {
    CFG_VERSION,
#ifdef SAVEPARAMS    
    HW_VERSION,
    SW_VERSION,
    0,
    0,
#endif
    SERIALNO,
    {{VADJUST_MIN,(PWM_MAX*7)/10},
     {VADJUST_MAX,(PWM_MAX*12)/100},
     {VADJUST_MAX,0},
     {VADJUST_MAX,0},
     {VADJUST_MAX,0},
     {VADJUST_MAX,0},
     {VADJUST_MAX,0},
     {VADJUST_MAX,0},
     {VADJUST_MAX,0},          
     {VADJUST_MAX,0}, 
     {VADJUST_MAX,0}},
    0
};

static inline bool checkNvParams(nvparam_t* nvp);
static inline void loadDefaultNvPrams(nvparam_t *nvp);

bool saveNvParams(nvparam_t * nvp) {
    bool ret = true;
    static enum {
        calculateCrc,
        writetoFlash1,
        writetoFlash2
    }saveMachine = calculateCrc;

    static uint16_t wrBuf[2*WRITE_FLASH_BLOCKSIZE] = {0};

    switch(saveMachine) {
        case calculateCrc:
        {
            uint8_t cnt;
            nvp->crc = crc8((uint8_t*)nvp,sizeof(nvparam_t)-sizeof(uint8_t));
            memcpy(wrBuf,nvp,sizeof(nvparam_t));
            saveMachine = writetoFlash1;
        }
        break;
        case writetoFlash1:
            ret = FLASH_WriteBlock(NVPARAMS_START_ADDR,
                    &wrBuf[0]);
            if(!ret){
                saveMachine = writetoFlash2;
                ret = true;
            }
            break;
        case writetoFlash2:
            ret = FLASH_WriteBlock(NVPARAMS_START_ADDR+WRITE_FLASH_BLOCKSIZE,
                &wrBuf[WRITE_FLASH_BLOCKSIZE]);
            if(!ret){
                saveMachine = calculateCrc;
                ret = false;
            }
            break;
    }
    return ret;
}

void loadNvPrams(nvparam_t * nvp) {
    uint8_t *dst = (uint8_t*) nvp;
    uint16_t src = NVPARAMS_START_ADDR;
    for(uint8_t size = sizeof(nvparam_t);size>0;size--) {
        *dst++ = (uint8_t)FLASH_ReadWord(src++);        
    }
    if(!checkNvParams(nvp)) {
        loadDefaultNvPrams(nvp);
    }
}

static inline bool checkNvParams(nvparam_t* nvp) {
    if(nvp->cfg_version == CFG_VERSION) {
        uint8_t this_crc = crc8((uint8_t*)nvp,sizeof(nvparam_t)-sizeof(uint8_t));
        return(this_crc == nvp->crc);
    }else {
        return false;
    }
}


static inline void loadDefaultNvPrams(nvparam_t *nvp) {
    memcpy((uint8_t *)nvp, (uint8_t*)&defparams, sizeof(nvparam_t));
}
