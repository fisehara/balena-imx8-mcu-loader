/*
 * Copyright 2017 NXP
 * Copyright 2020 Marco Giorgi <giorgi.marco.96@disroot.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#ifndef __IMX8MM_H__
#define __IMX8MM_H__		1

/* Number of M4 cores */
#define M4_CORES_NUM    (1)

/* Number of mapped memory area:
 * - SRC
 * - OCRAM
 * - TCML
 */
#define MEM_AREAS	(3)

#define SRC_IDX		(0)
#define OCRAM_IDX	(1)
#define TCML_IDX	(2)

#if defined(IMX8MM)

#define SRC_ADDR    0x30390000U
#define OCRAM_ADDR  0x180000U
/* offset from the start address of the memory reserved for M4 cortex */
#define M4RCR_OFFS  0x0CU
/* position of the platform reset bit on SRC_SCR register*/
#define M4PR_BIT    (2)
/* position of the core reset bit on SRC_SCR register*/
#define M4CR_BIT    (1)
/* position of the core non-self-clearing reset bit on SCR_SCR register*/
#define M4CR_NON_SCLR_BIT (0)


#else

#error platform unknown

#endif

#define TCML_ADDR   0x7E0000U

#define SRC_MAP_SIZE    (M4RCR_OFFS + 4U)
#define TCML_MAP_SIZE   (128U * 1024U)			//128KiB
#define OCRAM_MAP_SIZE  (2U * 4U)

#if !defined(__KERNEL__)
typedef struct {
    /* physical start address of the mapped memory */
    uint32_t paddr;
    /* virtual start address of the mapped memory */
    uint32_t * vaddr;
    /* size of the mapped memory */
    uint32_t size;
} mem;

typedef struct {
    mem areas[MEM_AREAS];
} m4_data;

#endif /* !defined(__KERNEL__) */


#endif
