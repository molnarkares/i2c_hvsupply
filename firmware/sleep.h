/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */
#ifndef SLEEP_H
#define	SLEEP_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

#define SLEEP_COM  (1<<0)   //Sleep control during communication
#define SLEEP_HVEN  (1<<1)  //Sleep control of HV supply
#define SLEEP_ALL   (SLEEP_HVEN | SLEEP_COM)

#define enableSleep(pn) do{ cansleep &= ~(pn); }while(0)
#define disableSleep(pn) do{ cansleep |= (pn); }while(0)

extern uint8_t cansleep;

void gotoSleep(void);

#ifdef	__cplusplus
}
#endif

#endif	/* SLEEP_H */

