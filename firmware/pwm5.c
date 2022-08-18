/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/**
  Section: Included Files
*/

#include <xc.h>
#include "pwm5.h"

/**
  Section: PWM5 APIs
*/

void PWM5_Initialize(void)
{
    // set the PWM5 to the options selected in the User Interface

     //PHIE disabled; DCIE disabled; OFIE disabled; PRIE disabled; 
    PWM5INTE = 0x00;

     //PHIF cleared; OFIF cleared; DCIF cleared; PRIF cleared; 
    PWM5INTF = 0x00;

     //PS No_Prescalar; CS LFINTOSC; 
    PWM5CLKCON = 0x02;

     //LDA do_not_load; 
    PWM5LDCON = 0x00;

     //OFO match_incrementing; 
    PWM5OFCON = 0x00;

     //PWM5PHH 0; 
    PWM5PHH = 0x00;

     //PWM5PHL 0; 
    PWM5PHL = 0x00;

     //PWM5DCH 1; 
    PWM5DCH = 0x02;

     //PWM5DCL 53; 
    PWM5DCL = 0;

     //PWM5PRH 1; 
    PWM5PRH = 0x02;

     //PWM5PRL 53; 
    PWM5PRL = 0x0;

     //PWM5OFH 0; 
    PWM5OFH = 0x00;

     //PWM5OFL 1; 
    PWM5OFL = 0x01;

     //PWM5TMRH 0; 
    PWM5TMRH = 0x00;

     //PWM5TMRL 0; 
    PWM5TMRL = 0x00;
    
     //MODE standard_PWM; POL active_hi; EN enabled; 
    PWM5CON = 0x80;
}    

void PWM5_LoadBufferSet(void)
{
    PWM5LDCONbits.LDA = 1;		
}

void PWM5_DutyCycleSet(uint16_t dutyCycleCount)
{
    PWM5DCH = (dutyCycleCount>>8);	//writing 8 MSBs to PWMDCH register
    PWM5DCL = (uint8_t)(dutyCycleCount);	//writing 8 LSBs to PWMDCL register		
}

/**
 End of File
*/


