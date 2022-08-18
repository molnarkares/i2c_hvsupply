/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#ifndef DELAY_H
#define	DELAY_H

#ifdef	__cplusplus
extern "C" {
#endif
    


#define delayUs(x) asm("nop")

#ifdef	__cplusplus
}
#endif

#endif	/* DELAY_H */

