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

#include <project.h>
#include <Z80_PSoC_3Chips.h>

volatile uint8 PIO_Mask_Port_A;
volatile uint8 PIO_Vector_Address_Port_A;       // Mode 2 interrupt vector
volatile uint8 PIO_Interrupt_Vector_Port_A;
volatile uint8 PIO_Interrupt_Ctrl_Word_A;
//volatile uint8 PIO_Output_Register_Port_A;
volatile uint8 PIO_Input_Register_Port_A;

volatile uint8 PIO_Mask_Port_B;
volatile uint8 PIO_Vector_Address_Port_B;
volatile uint8 PIO_Interrupt_Vector_Port_B;
volatile uint8 PIO_Interrupt_Ctrl_Word_B;
//volatile uint8 PIO_Output_Register_Port_B;
volatile uint8 PIO_Input_Register_Port_B;

volatile uint8 PIO_State_A;
volatile uint8 PIO_Mode_A;
volatile uint8 PIO_State_B;
volatile uint8 PIO_Mode_B;

//////////////////////////////////////////////////////////////////////////////////////////////
// void init_PIO(void) - Initialize the PIO and the MCP23017
// From the PIO datasheet
//  The Z8O-PIO automatically enters a reset state when power is applied. The reset state
//  performs the following functions:
//      1 Both port mask registers are reset to inhibit All port data bits.
//      2. Port data bus lines are set to a high-impedance state and the Ready „handshake“
//      signals are inactive (Low) Mode 1 is automatically selected.
//      3. The vector address registers are not reset.
//      4. Both port interrupt enable flip-flops are reset.
//      5. Both port output registers are reset.
//  In addition to the automatic power-on reset, the PIO can be reset by applying an /M1 signal
//  without the presence of a /RD or /IORQ signal. If no /RD or /IORQ is detected during /M1,
//  the PlO will enter the reset state immediately after the /M1 signal goes inactive. The
//  purpose of this reset is to allow a single external gate to generate a reset without a power
//  down sequence. This approach was required due to the 40-pin packaging limitation.
//  Once the PlO has entered the internal reset state, it is held there until the PIO receives a
//  control word from the CPU.

void init_PIO(void)
{
    PIO_State_A = PIO_INIT;
    PIO_Mode_A = PIO_UNINIT;
    PIO_State_B = PIO_INIT;
    PIO_Mode_B = PIO_UNINIT;
    // Initialize the MCP23017
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_INS);     // IO: Port A is inputs
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_INS);     // IO: Port B is inputs
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IPOLA_REGADR,MCP23017_IPOL_INVERT);        // IP: Invert input pins on Port A
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IPOLB_REGADR,MCP23017_IPOL_INVERT);        // IP: Invert input pins on Port B
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_GPINTENA_REGADR,MCP23017_GPINTEN_ENABLE);  // GPINT: Enable interrupts
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_GPINTENB_REGADR,MCP23017_GPINTEN_ENABLE);  // GPINT: Enable interrupts
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_DEFVALA_REGADR,MCP23017_DEFVALA_DEFVAL);   // Default value for pin (interrupt)
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_DEFVALB_REGADR,MCP23017_DEFVALA_DEFVAL);   // Default value for pin (interrupt)
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_INTCONA_REGADR,MCP23017_INTCON_PREVPIN);   // Int for change from default value
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_INTCONB_REGADR,MCP23017_INTCON_PREVPIN);   // Int for change from default value
    // BANK: Register addresses are in the same bank (addresses are sequential)
	// MIRROR: Int pins not connected (they are externally connected together on the board)
	// SEQOP: Enable sequential operation (although the driver doesn't use it)
	// HAEN: (Not used on MCP23017)
	// ODR: Open Drain output (over-rides INTPOL)
	// INTPOL: Over-ridden by ODR
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IOCONA_REGADR,MCP23017_IOCON_DEFVAL);      // BANK: Register addresses are sequential
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IOCONB_REGADR,MCP23017_IOCON_DEFVAL);      // Int for change from previous pin
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_GPPUA_REGADR,MCP23017_GPPU_ENABLE);        // Pull-up to inputs
	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_GPPUB_REGADR,MCP23017_GPPU_ENABLE);        // Pull-up to inputs
	readRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_INTCAPA_REGADR);                            // Clears interrupt
	readRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_INTCAPB_REGADR);                            // Clears interrupt
}

void PioReadDataA(void)
{
    if (PIO_State_A == PIO_MODE_1)
    {
        // Z80_Data_In_Write(readRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_GPIOA_REGADR));
        Z80_Data_In_Write(PIO_Input_Register_Port_A);
    }
    else
    {
        Z80_Data_In_Write(0x55);
    }
    ackIO();
}

void PioWriteDataA(void)
{
    writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_OLATA_REGADR,Z80_Data_Out_Read());
    ackIO();
}

// PIO_State_A {PIO_INIT, PIO_INTR, PIO_MODE_3A, PIO_INTR_MASK};
// PIO_Mode_A (PIO_UNINIT, PIO_MODE_0, PIO_MODE_1, PIO_MODE_2, PIO_MODE_3};

void PioWriteCtrlA(void)
{
    volatile uint8 dataFromZ80 = Z80_Data_Out_Read();
    if ((PIO_Mode_A == PIO_UNINIT) && ((dataFromZ80 & PIO_MODE_WORD_BITS) == PIO_MODE_WORD_VAL))
    {
        if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_0)      // Outputs
        {
        	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_OUTS);     // IO: Port A is outputs
            PIO_Mode_A = PIO_MODE_0;
        }
        else if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_1) // Inputs
        {
        	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRA_REGADR,MCP23017_IODIR_ALL_INS);     // IO: Port A is inputs
            PIO_Mode_A = PIO_MODE_1;
        }
        else if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_2) // Bidirectional
        {
            PIO_Mode_A = PIO_MODE_2;
        }
        else if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_3) // Controlled direction
        {
            PIO_State_A = PIO_MODE_3A;
        }
    }
    else if (PIO_State_A == PIO_MODE_3A)
    {
        writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRA_REGADR,dataFromZ80);     // IO: Port A pins are in/out determined by the control value
        PIO_Mode_A = PIO_MODE_3;
    }
    else if (PIO_State_A == PIO_INTR_MASK)
    {
        PIO_Mask_Port_A = dataFromZ80;
        PIO_State_A = PIO_INIT;
    }
    else if ((dataFromZ80 & 0x1) == 0x0) 
    {
        PIO_Interrupt_Vector_Port_A = dataFromZ80;
    }
    else if ((dataFromZ80 & 0x0F) == 0x07) 
    {
        PIO_Interrupt_Ctrl_Word_A = dataFromZ80;
        if ((dataFromZ80 & 0x10) == 0x10) 
        {
            PIO_State_A = PIO_INTR_MASK;
        }
    }
    ackIO();
}

void PioReadDataB(void)
{
    if (PIO_State_A == PIO_MODE_1)
    {
        //Z80_Data_In_Write(readRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_GPIOB_REGADR));
        Z80_Data_In_Write(PIO_Input_Register_Port_B);
    }
    else
    {
        Z80_Data_In_Write(0xAA);
    }
    ackIO();
}

void PioWriteDataB(void)
{
    writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_OLATB_REGADR,Z80_Data_Out_Read());
    ackIO();
}

void PioWriteCtrlB(void)
{
    volatile uint8 dataFromZ80 = Z80_Data_Out_Read();
    if ((PIO_Mode_B == PIO_UNINIT) && ((dataFromZ80 & PIO_MODE_WORD_BITS) == PIO_MODE_WORD_VAL))
    {
        if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_0)      // Outputs
        {
        	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_OUTS);     // IO: Port A is outputs
            PIO_Mode_B = PIO_MODE_0;
        }
        else if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_1) // Inputs
        {
        	writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRB_REGADR,MCP23017_IODIR_ALL_INS);     // IO: Port A is inputs
            PIO_Mode_B = PIO_MODE_1;
        }
        else if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_2) // Bidirectional
        {
            PIO_Mode_B = PIO_MODE_2;
        }
        else if ((dataFromZ80 & PIO_OP_MODE_MASK) == PIO_OP_MODE_3) // Controlled direction
        {
            PIO_State_B = PIO_MODE_3A;
        }
    }
    else if (PIO_State_B == PIO_MODE_3A)
    {
        writeRegister_MCP23017(MCP23017_PIO_ADDR,MCP23017_IODIRB_REGADR,dataFromZ80);     // IO: Port A pins are in/out determined by the control value
        PIO_Mode_B = PIO_MODE_3;
    }
    else if (PIO_State_B == PIO_INTR_MASK)
    {
        PIO_Mask_Port_B = dataFromZ80;
        PIO_State_B = PIO_INIT;
    }
    else if ((dataFromZ80 & 0x1) == 0x0) 
    {
        PIO_Interrupt_Vector_Port_B = dataFromZ80;
    }
    else if ((dataFromZ80 & 0x0F) == 0x07) 
    {
        PIO_Interrupt_Ctrl_Word_B = dataFromZ80;
        if ((dataFromZ80 & 0x10) == 0x10) 
        {
            PIO_State_B = PIO_INTR_MASK;
        }
    }
    ackIO();
}

/* [] END OF FILE */
