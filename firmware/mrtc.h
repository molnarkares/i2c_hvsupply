/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#ifndef RTC_H
#define	RTC_H

#ifdef	__cplusplus
extern "C" {
#endif

void RTCInit(void);    
void RTCInterruptEnable(void);
void RTCInterruptDisable(void);
void setTrigTimeout(uint16_t timeout);
uint24_t getPulseCount(void);
void RTCExpired(void);

#ifdef	__cplusplus
}
#endif

#endif	/* RTC_H */

