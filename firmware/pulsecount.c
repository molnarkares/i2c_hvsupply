/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */
#include <stdint.h>
#include "tmr3.h"
#include "tmr2.h"
#include "pulsecount.h"

uint24_t getPulseCount(void) {
    
    uint24_t cnt;

    TMR3_StopTimer();
    TMR2_StopTimer();
    if(TMR2_HasOverflowOccured()) {
        cnt = UINT24_MAX;
    }else {
        cnt = ((uint24_t)TMR2_ReadTimer())<<16;
        cnt |= (uint24_t)TMR3_ReadTimer();
    }

    TMR2_WriteTimer(0);
    TMR3_WriteTimer(0);
    TMR3_StartTimer();
    TMR2_StartTimer();
    
    return cnt;
}
