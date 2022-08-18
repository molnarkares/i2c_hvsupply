/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#include "xc.h"
#include <stdbool.h>
#include "sleep.h"


#define clockHS() do{OSCCON = 0x7A;}while(0)
#define clockLS() do{\
    while(!OSCSTATbits.LFIOFR) {\
        asm("nop");\
    }\
    OSCCON = 0x02;\
}while(0)
  

uint8_t cansleep = 0;

void gotoSleep() {
    // We must disable sleep while I2C communication is ongoing
    // otherwise we get strange com errors on lower speed (100kHz)
    
    if(cansleep == 0) {
        clockLS();
        SLEEP();
        clockHS();
    }
}
