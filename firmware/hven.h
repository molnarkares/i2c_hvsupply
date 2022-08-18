/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#ifndef HVEN_H
#define	HVEN_H

#ifdef	__cplusplus
extern "C" {
#endif
void voutEnable(void);

void voutDisable(void);
#ifdef RAMPUP
void rampUp();
#else
#define rampUp() /* nop */
#endif

#ifdef	__cplusplus
}
#endif

#endif	/* HVEN_H */

