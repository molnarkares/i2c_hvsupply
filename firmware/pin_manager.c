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

#include <xc.h>
#include "pin_manager.h"
#include "stdbool.h"


void PIN_MANAGER_Initialize(void)
{
    /**
    LATx registers
    */   
    LATA = 0x00;    
    LATC = 0x00;    

    /**
    TRISx registers
    */    
    TRISA = 0x33;
    TRISC = 0x23;

    /**
    ANSELx registers
    */   
    ANSELC = 0x00;
    ANSELA = 0x13;

    /**
    WPUx registers
    */ 
    WPUA = 0x0B;
    WPUC = 0x20;
    OPTION_REGbits.nWPUEN = 0;

    /**
    ODx registers
    */   
    ODCONA = 0x00;
    ODCONC = 0x00;
 
    PPSLOCK = 0x55;
    PPSLOCK = 0xAA;
    PPSLOCKbits.PPSLOCKED = 0x00; // unlock PPS

    RC1PPSbits.RC1PPS = 0x13;   //RC1->MSSP:SDA;
    T3CKIPPSbits.T3CKIPPS = 0x15;   //RC5->TMR3:T3CKI;
    T5CKIPPSbits.T5CKIPPS = 0x02;   //RA2->TMR5:T5CKI;
    RC4PPSbits.RC4PPS = 0x10;   //RC4->PWM5:PWM5OUT;
    RC3PPSbits.RC3PPS = 0x00;   //RC3->PWM3:PWM3OUT;
    SSPDATPPSbits.SSPDATPPS = 0x11;   //RC1->MSSP:SDA;
    RC0PPSbits.RC0PPS = 0x12;   //RC0->MSSP:SCL;
    RA2PPSbits.RA2PPS = 0x01;   //RA2->CLC1:CLC1OUT;
    SSPCLKPPSbits.SSPCLKPPS = 0x10;   //RC0->MSSP:SCL;

    PPSLOCK = 0x55;
    PPSLOCK = 0xAA;
    PPSLOCKbits.PPSLOCKED = 0x01; // lock PPS
}       

/**
 End of File
*/