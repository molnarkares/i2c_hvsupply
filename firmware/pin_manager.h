/**
    Copyright (c) 2013 - 2015 released Microchip Technology Inc.  All rights reserved.

    Microchip licenses to you the right to use, modify, copy and distribute
    Software only when embedded on a Microchip microcontroller or digital signal
    controller that is integrated into your product or third party product
    (pursuant to the sublicense terms in the accompanying license agreement).

    You should refer to the license agreement accompanying this Software for
    additional information regarding your rights and obligations.

    SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
    EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
    MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
    IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
    CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
    OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
    INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
    CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
    SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
    (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

*/


#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set T aliases
#define T_TRIS               TRISAbits.TRISA2
#define T_LAT                LATAbits.LATA2
#define T_PORT               PORTAbits.RA2
#define T_WPU                WPUAbits.WPUA2
#define T_OD                ODCONAbits.ODA2
#define T_ANS                ANSELAbits.ANSA2
#define T_SetHigh()            do { LATAbits.LATA2 = 1; } while(0)
#define T_SetLow()             do { LATAbits.LATA2 = 0; } while(0)
#define T_Toggle()             do { LATAbits.LATA2 = ~LATAbits.LATA2; } while(0)
#define T_GetValue()           PORTAbits.RA2
#define T_SetDigitalInput()    do { TRISAbits.TRISA2 = 1; } while(0)
#define T_SetDigitalOutput()   do { TRISAbits.TRISA2 = 0; } while(0)
#define T_SetPullup()      do { WPUAbits.WPUA2 = 1; } while(0)
#define T_ResetPullup()    do { WPUAbits.WPUA2 = 0; } while(0)
#define T_SetPushPull()    do { ODCONAbits.ODA2 = 1; } while(0)
#define T_SetOpenDrain()   do { ODCONAbits.ODA2 = 0; } while(0)
#define T_SetAnalogMode()  do { ANSELAbits.ANSA2 = 1; } while(0)
#define T_SetDigitalMode() do { ANSELAbits.ANSA2 = 0; } while(0)

// get/set RC0 procedures
#define RC0_SetHigh()    do { LATCbits.LATC0 = 1; } while(0)
#define RC0_SetLow()   do { LATCbits.LATC0 = 0; } while(0)
#define RC0_Toggle()   do { LATCbits.LATC0 = ~LATCbits.LATC0; } while(0)
#define RC0_GetValue()         PORTCbits.RC0
#define RC0_SetDigitalInput()   do { TRISCbits.TRISC0 = 1; } while(0)
#define RC0_SetDigitalOutput()  do { TRISCbits.TRISC0 = 0; } while(0)
#define RC0_SetPullup()     do { WPUCbits.WPUC0 = 1; } while(0)
#define RC0_ResetPullup()   do { WPUCbits.WPUC0 = 0; } while(0)
#define RC0_SetAnalogMode() do { ANSELCbits.ANSC0 = 1; } while(0)
#define RC0_SetDigitalMode()do { ANSELCbits.ANSC0 = 0; } while(0)

// get/set RC1 procedures
#define RC1_SetHigh()    do { LATCbits.LATC1 = 1; } while(0)
#define RC1_SetLow()   do { LATCbits.LATC1 = 0; } while(0)
#define RC1_Toggle()   do { LATCbits.LATC1 = ~LATCbits.LATC1; } while(0)
#define RC1_GetValue()         PORTCbits.RC1
#define RC1_SetDigitalInput()   do { TRISCbits.TRISC1 = 1; } while(0)
#define RC1_SetDigitalOutput()  do { TRISCbits.TRISC1 = 0; } while(0)
#define RC1_SetPullup()     do { WPUCbits.WPUC1 = 1; } while(0)
#define RC1_ResetPullup()   do { WPUCbits.WPUC1 = 0; } while(0)
#define RC1_SetAnalogMode() do { ANSELCbits.ANSC1 = 1; } while(0)
#define RC1_SetDigitalMode()do { ANSELCbits.ANSC1 = 0; } while(0)

// get/set TRIG aliases
#define TRIG_TRIS               TRISCbits.TRISC2
#define TRIG_LAT                LATCbits.LATC2
#define TRIG_PORT               PORTCbits.RC2
#define TRIG_WPU                WPUCbits.WPUC2
#define TRIG_OD                ODCONCbits.ODC2
#define TRIG_ANS                ANSELCbits.ANSC2
#define TRIG_SetHigh()            do { LATCbits.LATC2 = 1; } while(0)
#define TRIG_SetLow()             do { LATCbits.LATC2 = 0; } while(0)
#define TRIG_Toggle()             do { LATCbits.LATC2 = ~LATCbits.LATC2; } while(0)
#define TRIG_GetValue()           PORTCbits.RC2
#define TRIG_SetDigitalInput()    do { TRISCbits.TRISC2 = 1; } while(0)
#define TRIG_SetDigitalOutput()   do { TRISCbits.TRISC2 = 0; } while(0)
#define TRIG_SetPullup()      do { WPUCbits.WPUC2 = 1; } while(0)
#define TRIG_ResetPullup()    do { WPUCbits.WPUC2 = 0; } while(0)
#define TRIG_SetPushPull()    do { ODCONCbits.ODC2 = 0; } while(0)
#define TRIG_SetOpenDrain()   do { ODCONCbits.ODC2 = 1; } while(0)
#define TRIG_SetAnalogMode()  do { ANSELCbits.ANSC2 = 1; } while(0)
#define TRIG_SetDigitalMode() do { ANSELCbits.ANSC2 = 0; } while(0)

// get/set BOOST_EN aliases
#define BOOST_EN_TRIS               TRISCbits.TRISC3
#define BOOST_EN_LAT                LATCbits.LATC3
#define BOOST_EN_PORT               PORTCbits.RC3
#define BOOST_EN_WPU                WPUCbits.WPUC3
#define BOOST_EN_OD                ODCONCbits.ODC3
#define BOOST_EN_ANS                ANSELCbits.ANSC3
#define BOOST_EN_SetHigh()            do { LATCbits.LATC3 = 1; } while(0)
#define BOOST_EN_SetLow()             do { LATCbits.LATC3 = 0; } while(0)
#define BOOST_EN_Toggle()             do { LATCbits.LATC3 = ~LATCbits.LATC3; } while(0)
#define BOOST_EN_GetValue()           PORTCbits.RC3
#define BOOST_EN_SetDigitalInput()    do { TRISCbits.TRISC3 = 1; } while(0)
#define BOOST_EN_SetDigitalOutput()   do { TRISCbits.TRISC3 = 0; } while(0)
#define BOOST_EN_SetPullup()      do { WPUCbits.WPUC3 = 1; } while(0)
#define BOOST_EN_ResetPullup()    do { WPUCbits.WPUC3 = 0; } while(0)
#define BOOST_EN_SetPushPull()    do { ODCONCbits.ODC3 = 1; } while(0)
#define BOOST_EN_SetOpenDrain()   do { ODCONCbits.ODC3 = 0; } while(0)
#define BOOST_EN_SetAnalogMode()  do { ANSELCbits.ANSC3 = 1; } while(0)
#define BOOST_EN_SetDigitalMode() do { ANSELCbits.ANSC3 = 0; } while(0)

// get/set RC4 procedures
#define RC4_SetHigh()    do { LATCbits.LATC4 = 1; } while(0)
#define RC4_SetLow()   do { LATCbits.LATC4 = 0; } while(0)
#define RC4_Toggle()   do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define RC4_GetValue()         PORTCbits.RC4
#define RC4_SetDigitalInput()   do { TRISCbits.TRISC4 = 1; } while(0)
#define RC4_SetDigitalOutput()  do { TRISCbits.TRISC4 = 0; } while(0)
#define RC4_SetPullup()     do { WPUCbits.WPUC4 = 1; } while(0)
#define RC4_ResetPullup()   do { WPUCbits.WPUC4 = 0; } while(0)

// get/set RC5 procedures
#define RC5_SetHigh()    do { LATCbits.LATC5 = 1; } while(0)
#define RC5_SetLow()   do { LATCbits.LATC5 = 0; } while(0)
#define RC5_Toggle()   do { LATCbits.LATC5 = ~LATCbits.LATC5; } while(0)
#define RC5_GetValue()         PORTCbits.RC5
#define RC5_SetDigitalInput()   do { TRISCbits.TRISC5 = 1; } while(0)
#define RC5_SetDigitalOutput()  do { TRISCbits.TRISC5 = 0; } while(0)
#define RC5_SetPullup()     do { WPUCbits.WPUC5 = 1; } while(0)
#define RC5_ResetPullup()   do { WPUCbits.WPUC5 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/