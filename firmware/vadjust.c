/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#include "mcc.h"
#include "cmd.h"
#include "mrtc.h"
#include "vadjust.h"
#include "hven.h"

void voutInit(void) {
    voutDisable();
}

static uint16_t interp( lut_element* lut, uint16_t setvoltage );

void voutSet(uint16_t vset, lut_element* lut) {
    
    uint16_t dutyset;
    if((vset < VADJUST_MIN) || (vset > VADJUST_MAX)){
        voutDisable();
        pwmDuty(PWM_MAX);
        vset = 0;
    }else {
        if(vset < lut[0].voltage) {
            vset = lut[0].voltage;
        }else if (vset > lut[LUT_SIZE-1].voltage) {
            vset = lut[LUT_SIZE-1].voltage;
        }

        dutyset = interp(lut, vset);
        pwmDuty(dutyset);
        voutEnable();
    }    
}

void pwmDuty(uint16_t dc) {
    if(dc > PWM_MAX) {
        dc = PWM_MAX;
    }
    PWM5_DutyCycleSet(dc);   
    PWM5_LoadBufferSet();
    
}


static uint16_t interp( lut_element* lut, uint16_t setvoltage )
{
    uint8_t i;

    for( i = 0; i < LUT_SIZE-1; i++ )
    {
        if ((lut[i].voltage <= setvoltage) && (lut[i+1].voltage >= setvoltage ))
        {
            int16_t diffx = (int16_t)setvoltage - (int16_t)lut[i].voltage;
            int16_t diffn = (int16_t)lut[i+1].voltage - (int16_t)lut[i].voltage;
            int16_t sum1 = (int16_t)lut[i].dutycycle;
            int16_t sum2 = (int16_t)lut[i+1].dutycycle - (int16_t)lut[i].dutycycle;
            int32_t sum21 = (int32_t)sum2 * diffx;
            int32_t sum22 = sum21/diffn;
            sum22 += (int32_t)sum1;
            
                    
            return ((uint16_t)sum22);
        }
    }

    return 0; // Not in Range
}
