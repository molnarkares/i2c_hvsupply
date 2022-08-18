/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#include <xc.h>
#include "mcc.h"
#include "tmr1.h"
#include "tmr5.h"
#include "i2c.h"
#include "cmd.h"
#include "mrtc.h"
#include "vadjust.h"
#include "hven.h"
#include "pulsecount.h"
#include "config.h"
#include "sleep.h"
#include <stdint.h>



/*
                         Main application
 */
void main(void)
{
    INTERRUPT_GlobalInterruptDisable();
    SYSTEM_Initialize();
    TRIG_SetPushPull();
    RC0_ResetPullup();
    RC1_ResetPullup();
    TRIG_SetLow(); //after powerup it is the default
    voutInit();
    pwmDuty(PWM_MAX);
    RTCInit();
    cmdInit();
    (void)getPulseCount();

    INTERRUPT_PeripheralInterruptEnable();
    // Observe Global Interrupt is NOT enabled.

    while (1)
    {

        if(PIR1bits.SSP1IF == 1)
        {
            I2C_ISR();
        }
        else if((PIE4bits.TMR5IE == 1)&& (PIR4bits.TMR5IF == 1))
        {
            TMR5_ISR();
        }
        else if( (PIE1bits.TMR1IE == 1) && (PIR1bits.TMR1IF == 1))
        {
            TMR1_ISR();
        }
        rampUp();
#ifdef SAVEPARAMS          
        if(writeRequested) {
            writeRequested = saveNvParams(&nvparam);
        }else 
#endif        
        {
            gotoSleep();
        }
    }
}

