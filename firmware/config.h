/*
* Copyright (c) 2021-2022 Karoly Molnar <molnarkares@gmail.com>
*
* MIT license. See LICENSE for details.
 */

#ifndef CONFIG_H
#define	CONFIG_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "cmd.h"
    
#define HEF_START_ADDR  0xf80
#define NVPARAMS_START_ADDR (HEF_START_ADDR)
#define I2C_PERIPHERAL_ADDRESS 0x6e 

bool saveNvParams(nvparam_t * nvp);
void loadNvPrams(nvparam_t * nvp);

#ifdef SAVEPARAMS
#define SW_VERSION_TAG  0x0000
#else
#define SW_VERSION_TAG  0x8000
#endif

#define HW_VERSION  0x0b10  // READ ONLY
#define SW_VERSION  (0x0213|SW_VERSION_TAG)  // READ ONLY
#define SERIALNO    0       //WRITE ONCE



#ifdef	__cplusplus
}
#endif

#endif	/* CONFIG_H */

