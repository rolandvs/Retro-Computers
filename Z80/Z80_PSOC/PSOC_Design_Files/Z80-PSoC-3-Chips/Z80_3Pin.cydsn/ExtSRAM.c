/* ========================================
 *
 * Copyright LAND BOARDS, LLC, 2019
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF LAND BOARDS, LLC.
 *
 * ========================================
*/

////////////////////////////////////////////////////////////////////////////
// External SRAM is controlled by ExtSRAMCtl register
//  d0 = SRAM_R1_W0
//  d1 = DRV_RAM
//      0 = Don't drive the SRAM address/controls
//      1 = Drive the SRAM address/controls
//  d2 = SRAMCSn
//      0 = Chip Select enabled
//      1 = Chip Select disabled (default at power up)
//  d3 = CPU_RESETn
//      0 = Reset the Z80 (default at power up)
//      1 = Remove reset from the Z80
////////////////////////////////////////////////////////////////////////////

#include <project.h>
#include "ExtSRAMCtl.h"
#include "AdrLowOut.h"
#include "AdrMidOut.h"
#include "AdrHighOut.h"
#include "Z80_Data_In.h"
#include "Z80_Data_Out.h"
#include "ExtSRAM.h"

#define SRAMRW_MASK     0x01
#define SRAM_WRITE      0x00
#define SRAM_READ       0x01
#define DRVRAM_MASK     0x02
#define DRV_RAM_NO      0x00
#define DRV_RAM_YES     0x02
#define SRAMCS_MASK     0x04
#define SRAM_ACT        0x00
#define SRAM_UNACT      0x04
#define CPU_RST_MASK    0x08
#define CPU_RST_ON      0x00
#define CPU_RST_OFF     0x08

#define DRVRAM_BIT      0x01    // 1 = Drive SRAM bus from PSoC
#define SRAMCS_BIT      0x02    // 1 = Drive SRAMCS
#define SRAMRD_BIT      0x04    // 1 = SRAM read
#define SRAMWR_BIT      0x08    // 1 = SRAM write
#define CPURESET_BIT    0x10    // 1 = Z80 held in reset

////////////////////////////////////////////////////////////////////////////
// SetExtSRAMAddr(addr) - Set the address registers for the SRAM

void SetExtSRAMAddr(uint32 addr)
{
    AdrLowOut_Control = addr & 0xff;        // bottom 8-bits of the address A0..A7
    AdrMidOut_Control = (addr>>8) & 0x7;
    AdrHighOut_Control = (addr>>11) & 0xFF;
}

////////////////////////////////////////////////////////////////////////////
// ReadExtSRAM(addr) - Read the external SRAM at address = addr
//  Z80 is held in CPU_RESET during this action

uint8 ReadExtSRAM(uint32 addr)
{
    uint8 rdVal;
    SetExtSRAMAddr(addr);
    ExtSRAMCtl_Control = (CPURESET_BIT | DRVRAM_BIT | SRAMRD_BIT);               // Set R/W* to Read
    ExtSRAMCtl_Control = (CPURESET_BIT | DRVRAM_BIT | SRAMRD_BIT | SRAMCS_BIT);  // Assert SRAMCS
    rdVal = Z80_Data_Out_Status;
    ExtSRAMCtl_Control = (CPURESET_BIT | DRVRAM_BIT);                            // Remove SRAMCS
    return(rdVal);
}

////////////////////////////////////////////////////////////////////////////
// WriteExtSRAM(addr,data) - Write to the external SRAM at address = addr
//  Z80 is held in CPU_RESET during this action

void WriteExtSRAM(uint32 addr, uint8 data)
{
    SetExtSRAMAddr(addr);
    ExtSRAMCtl_Control = (CPURESET_BIT | DRVRAM_BIT | SRAMWR_BIT);               // Set R/W* to Write
    Z80_Data_In_Control = data;                                                // Provide value to SRAM data bus
    ExtSRAMCtl_Control = (CPURESET_BIT | DRVRAM_BIT | SRAMWR_BIT | SRAMCS_BIT);  // Assert SRAMCSn
    ExtSRAMCtl_Control = (CPURESET_BIT | DRVRAM_BIT);                            // De-assert SRAMCSn, Set to read
}

////////////////////////////////////////////////////////////////////////////
// TestSRAM() - Test the 512KB External SRAM
//  Z80 is held in CPU_RESET during this action
// Returns 
//  0 if POST passed
//  1 if POST Failed single location test
//  2 if POST failed test of first 256 locations
//  3 if POST failed address ramp test

#define POST_PASSED                         0
#define POST_FAILED_SINGLE_LOCATION_TEST    1
#define POST_FAILED_ADDRESS_RAMP            2
#define POST_FAILED_TEST_ALL_RAM            3

uint32 TestSRAM(void)
{
    uint32 sramAddr;
    uint8 sramData;
    uint8 sramReadData;
    ExtSRAMCtl_Control = (CPURESET_BIT | DRVRAM_BIT);              // Z80 in reset, SRAM deselected, DRV_RAM asserted
    // Do a single write/read of the first location as a quick test
    WriteExtSRAM(0x0,0x55);             // Write 0x55 to the SRAM
    if (ReadExtSRAM(0x0) != 0x55)       // Read the SRAM
        return(POST_FAILED_SINGLE_LOCATION_TEST);   // Post failed
    // Write/read a data ramp to exercise address lines (step in address bits)
    sramData = 1;
    for (sramAddr = 1; sramAddr < 0x80000; sramAddr <<= 1)
    {
        WriteExtSRAM(sramAddr,sramData);
        sramData++;
    }
    // Bounce a one across the address lines to test all 512KB
    sramData = 1;
    for (sramAddr = 1; sramAddr < 0x80000; sramAddr <<= 1)
    {
        sramReadData = ReadExtSRAM(sramAddr);
        if (sramReadData != sramData)
            return(POST_FAILED_ADDRESS_RAMP);
        sramData++;
    }
    // Fill all of the SRAM with data = bottom of 8 bits of address
    sramData = 0;
    for (sramAddr = 0; sramAddr < 0x80000; sramAddr++)
    {
        WriteExtSRAM(sramAddr,sramData);
        sramData++;
    }
    // Verify the SRAM has data=address
    sramData = 0;
    for (sramAddr = 0; sramAddr < 0x80000; sramAddr++)
    {
        sramReadData = ReadExtSRAM(sramAddr);
        if (sramReadData != sramData)
            return(POST_FAILED_TEST_ALL_RAM);
        sramData++;
    }
    ExtSRAMCtl_Control = (CPURESET_BIT);              // Leave Z80 in reset
    return(POST_PASSED);
}

/* [] END OF FILE */
