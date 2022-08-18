/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */
#ifndef CRC8_H
#define	CRC8_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <stdint.h>
#define CRC8_SIZE
uint8_t crc8(uint8_t message[], uint8_t length);

#ifdef	__cplusplus
}
#endif

#endif	/* CRC8_H */

