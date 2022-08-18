/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */
#ifndef VADJUST_H
#define	VADJUST_H

#include "cmd.h"


#ifdef	__cplusplus
extern "C" {
#endif

#define VADJUST_MAX 600
#define VADJUST_MIN 400
#define PWM_MAX 0x200

void voutInit(void);
void voutSet(uint16_t vset, lut_element* lut);
void pwmDuty(uint16_t dc);
#ifdef	__cplusplus
}
#endif

#endif	/* VADJUST_H */

