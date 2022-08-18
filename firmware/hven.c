/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#include <xc.h>
#include "hven.h"
#include "sleep.h"
#include "mcc.h"


#ifdef RAMPUP

#define RAMPLOOP_CTR 5
#define RAMPUP_CNT (RAMPLOOP_CTR * 1000)
#if RAMPUP_CNT > 0x7ffe
#error RAMPUP_CNT does not fit to signed uint8!
#endif
static int16_t rampCnt = -2;

#endif

void voutEnable() {
#ifdef RAMPUP    
    if(rampCnt < -1){
        rampCnt = RAMPUP_CNT;
        disableSleep(SLEEP_HVEN);
    }
#else
    BOOST_EN_SetHigh();
#endif        
}

void voutDisable() {
    enableSleep(SLEEP_HVEN);
#ifdef RAMPUP    
    rampCnt = -2;
#endif    
    BOOST_EN_SetLow();
}

#ifdef RAMPUP
void rampUp() {    
    if (rampCnt >= 0){
        if ((rampCnt % RAMPLOOP_CTR) == 0){
            TRIG_SetHigh();
            BOOST_EN_SetHigh();
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");
            asm("NOP");

            TRIG_SetLow();
            BOOST_EN_SetLow();
        }else{
            TRIG_SetLow();
            BOOST_EN_SetLow();
        }
        rampCnt--;
    }else{
        enableSleep(SLEEP_HVEN);
    }
}
#endif
