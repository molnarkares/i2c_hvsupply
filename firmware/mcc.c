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

// Configuration bits: selected in the GUI

// CONFIG1
#pragma config FOSC = INTOSC    // Oscillator Selection Bits->INTOSC oscillator: I/O function on CLKIN pin
#pragma config WDTE = SWDTEN    // Watchdog Timer Enable->WDT controlled by the SWDTEN bit in the WDTCON register
#pragma config PWRTE = OFF    // Power-up Timer Enable->PWRT disabled
#pragma config MCLRE = ON    // MCLR Pin Function Select->MCLR/VPP pin function is MCLR
#pragma config CP = OFF    // Flash Program Memory Code Protection->Program memory code protection is disabled
#pragma config BOREN = OFF    // Brown-out Reset Enable->Brown-out Reset disabled
#pragma config CLKOUTEN = OFF    // Clock Out Enable->CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin
#pragma config IESO = OFF    // Internal/External Switchover Mode->Internal/External Switchover Mode is disabled
#pragma config FCMEN = OFF    // Fail-Safe Clock Monitor Enable->Fail-Safe Clock Monitor is disabled

// CONFIG2
#pragma config WRT = OFF    // Flash Memory Self-Write Protection->Write protection off
#pragma config PPS1WAY = OFF    // Peripheral Pin Select one-way control->The PPSLOCK bit can be set and cleared repeatedly by software
#pragma config ZCD = OFF    // Zero-cross detect disable->Zero-cross detect circuit is disabled at POR
#pragma config PLLEN = OFF    // Phase Lock Loop enable->4x PLL is enabled when software sets the SPLLEN bit
#pragma config STVREN = ON    // Stack Overflow/Underflow Reset Enable->Stack Overflow or Underflow will cause a Reset
#pragma config BORV = LO    // Brown-out Reset Voltage Selection->Brown-out Reset Voltage (Vbor), low trip point selected.
#pragma config LPBOR = OFF    // Low-Power Brown Out Reset->Low-Power BOR is enabled
#pragma config LVP = ON    // Low-Voltage Programming Enable->Low-voltage programming enabled

#include "mcc.h"

void SYSTEM_Initialize(void)
{

    PIN_MANAGER_Initialize();
    OSCILLATOR_Initialize();
    WDT_Initialize();
    I2C_Initialize();
    //TMR4_Initialize();
    CLC2_Initialize();
    TMR2_Initialize();
    CLC1_Initialize();
    TMR3_Initialize();
    TMR5_Initialize();
    PWM5_Initialize();
//    PWM3_Initialize();
    TMR1_Initialize();
}

void OSCILLATOR_Initialize(void)
{
    // SCS INTOSC; SPLLEN disabled; IRCF 16MHz_HF; 
    OSCCON = 0x7A;
    // SOSCR disabled; 
    OSCSTAT = 0x00;
    // TUN 0; 
    OSCTUNE = 0x00;
}

void WDT_Initialize(void)
{
    // WDTPS 1:65536; SWDTEN OFF; 
    WDTCON = 0x16;
}

/**
 End of File
*/
