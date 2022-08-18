/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */
#include "mcc.h"
#include "cmd.h"
#include "mrtc.h"
#include "pulsecount.h"
#include <xc.h>
#include "tmr1.h"
#include "tmr5.h"

static inline void reloadTimeout(void);

#define MRTC_MS(x) ((x*4096)/1000)


static union {
    uint16_t to16[2];
    uint32_t to32;
}to_vals;


void RTCInit() {
    PIE1bits.TMR1IE = 0;
    PIE4bits.TMR5IE = 0;    
}

   
void RTCExpired(void){
    reloadTimeout();
    cmd.pulseCtr = getPulseCount();
    TRIG_SetHigh();
}

void setTrigTimeout(uint16_t timeout) {
	TMR1_StopTimer();
	TMR5_StopTimer();
    if(timeout != 0){
		if (timeout > 16) {
			PIE4bits.TMR5IE = 1;
            PIE1bits.TMR1IE = 0;
		}
		else {
            PIE4bits.TMR5IE = 0;
			PIE1bits.TMR1IE = 1;
		}

    	uint32_t to32 = ((uint32_t)timeout)<<12;
        to32++;
        to_vals.to32 = -to32;
        reloadTimeout();
		TMR5_StartTimer();
        TMR1_StartTimer();
    }else {
        RTCInit();
    }
    
}

static inline void reloadTimeout(void) {
    TMR5 = to_vals.to16[1];
    TMR1 = to_vals.to16[0];
}
