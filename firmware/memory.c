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
#include "memory.h"

/**
  Section: Flash Module APIs
*/

uint16_t FLASH_ReadWord(uint16_t flashAddr)
{
    uint8_t GIEBitValue = INTCONbits.GIE;   // Save interrupt enable

    INTCONbits.GIE = 0;     // Disable interrupts
    PMADRL = (flashAddr & 0x00FF);
    PMADRH = ((flashAddr & 0xFF00) >> 8);

    PMCON1bits.CFGS = 0;    // Deselect Configuration space
    PMCON1bits.RD = 1;      // Initiate Read
    NOP();
    NOP();
    INTCONbits.GIE = GIEBitValue;	// Restore interrupt enable

    return (((uint16_t)PMDATH << 8) | PMDATL);
}

typedef enum {
    S1_Erase,
    S2_Prog
}writestatus_t;

bool FLASH_WriteBlock(uint16_t writeAddr, uint16_t *flashWordArray)
{
    static writestatus_t writeMachine = S1_Erase;
    uint8_t i;

    // Block erase sequence
    if(writeMachine == S1_Erase) {
       FLASH_EraseBlock(writeAddr);
       writeMachine = S2_Prog;
       return true;
    }else {

        // Block write sequence
        PMCON1bits.CFGS = 0;    // Deselect Configuration space
        PMCON1bits.WREN = 1;    // Enable wrties
        PMCON1bits.LWLO = 1;    // Only load write latches

        for (i=0; i<WRITE_FLASH_BLOCKSIZE; i++)
        {
            // Load lower 8 bits of write address
            PMADRL = (writeAddr & 0xFF);
            // Load upper 6 bits of write address
            PMADRH = ((writeAddr & 0xFF00) >> 8);

        // Load data in current address
            PMDATL = (uint8_t)flashWordArray[i];
            PMDATH = ((flashWordArray[i] & 0xFF00) >> 8);

            if(i == (WRITE_FLASH_BLOCKSIZE-1))
            {
                // Start Flash program memory write
                PMCON1bits.LWLO = 0;
            }

            PMCON2 = 0x55;
            PMCON2 = 0xAA;
            PMCON1bits.WR = 1;
            NOP();
            NOP();

        writeAddr++;
        }

        PMCON1bits.WREN = 0;       // Disable writes
        //INTCONbits.GIE = GIEBitValue;   // Restore interrupt enable
        writeMachine = S1_Erase;
    }
    return false;
}

void FLASH_EraseBlock(uint16_t startAddr)
{
    //uint8_t GIEBitValue = INTCONbits.GIE;   // Save interrupt enable


    //INTCONbits.GIE = 0; // Disable interrupts
    // Load lower 8 bits of erase address boundary
    PMADRL = (startAddr & 0xFF);
    // Load upper 6 bits of erase address boundary
    PMADRH = ((startAddr & 0xFF00) >> 8);

    // Block erase sequence
    PMCON1bits.CFGS = 0;    // Deselect Configuration space
    PMCON1bits.FREE = 1;    // Specify an erase operation
    PMCON1bits.WREN = 1;    // Allows erase cycles

    // Start of required sequence to initiate erase
    PMCON2 = 0x55;
    PMCON2 = 0xAA;
    PMCON1bits.WR = 1;      // Set WR bit to begin erase
    NOP();
    NOP();

    PMCON1bits.WREN = 0;       // Disable writes
    //INTCONbits.GIE = GIEBitValue;	// Restore interrupt enable
}
/**
 End of File
*/
