/* ========================================
 *
 * Copyright LAND BOARDS, LLC, 2019
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF Land Boards, LLC.
 *
 * ========================================
*/

#if !defined(Z80MEMMAPPERS_H)
#define Z80MEMMAPPERS_H

#include <project.h>

#define BANK_SIZE_32K   0x10
#define BANK_SIZE_16K   0x18
#define BANK_SIZE_8K    0x1c
#define BANK_SIZE_4K    0x1E
#define BANK_SIZE_2K    0x1F

extern volatile uint8 mmu4select;

void init_mem_map_1(void);
void swap_out_ROM_space(void);
void init_mem_map_4(void);
void wrMMU4SelectReg(void);
void wrMMU4Bank(void);

/* [] END OF FILE */

#endif
