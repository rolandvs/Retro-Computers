----------------------------------------------------------------------------------
-- Company: Land Boards LLC
--	Original Author: Tom Almy
-- Edits: Doug Gilliland
-- 
-- Create Date:   2021-05-16
-- Design Name: 	PDP8
-- Module Name:   pdp8 - Behavioral 
-- Project Name: 
-- Target Devices: Altera/Intel EP4CE15
-- Tool versions: Quartus II
-- Description: PDP-8 Project using 4 K words of internal memory. 
-- Implemented Firmware as loadable SRAM file
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Tom Almy's book
--		https://www.amazon.com/PDP-8-Class-Project-Resoling-Machine-ebook/dp/B07KY5RCJ7/
--
-- Additional Comments: Build for RETRO-EP4CE15, using EP4CE15 FPGA
--		http://land-boards.com/blwiki/index.php?title=RETRO-EP4CE15
-- Front Panel
--		http://land-boards.com/blwiki/index.php?title=PDP-8_Front_Panel#PDP-8_Front_Panel_Assembly_Sheet
--		Runs sieve, echo demos.
-- Uses bin2mif.py utility to convert the DEC bin file to Altera MIF file
--	Software at:	https://github.com/douggilliland/Linux-68k/tree/master/pdp8
-- VHDL at: 		https://github.com/douggilliland/Retro-Computers/tree/master/PDP-8/PDP8_Book(Almy)
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pdp8 is
	Port (
		clk			: in STD_LOGIC;
		
		-- Front Panel inputs
		sw			 	: in STD_LOGIC_VECTOR(11 downto 0);
		runSwitch	: in std_logic;		-- Run switch
		lnkSwitch	: in std_logic;		-- Link switch
		btnCpuReset	: in std_logic;		-- Reset button
		dispPB		: in std_logic;		-- 12 LEDs display select button (btnc)
		stepPB		: in std_logic;		-- Step Program Counter button (btnu)
		ldACPB		: in std_logic;		-- load Accumulator button (btnr)
		depPB			: in std_logic;		-- deposit button (btnd)
		ldPCPB		: in std_logic;		-- load PC button (btnl)
		
		-- Front Panel Outputs
		runLED		: out  STD_LOGIC;		-- RUN
		dispPCLED	: out  STD_LOGIC;		-- PC is currently displayed on the 12 LEDs
		dispMALED	: out  STD_LOGIC;		-- MQ value?
		dispMDLED	: out  STD_LOGIC;		-- Indicates that the memory data is currently displayed on the 12 LEDs
		dispACLED	: out  STD_LOGIC;		-- Indicates that the Accumulator is currently displayed on the 12 LEDs
		linkLED		: out  STD_LOGIC;		-- Link bit value
		dispLEDs		: out  STD_LOGIC_VECTOR (11 downto 0);
		
		-- Serial
		RsRx			: in  STD_LOGIC;
		RsTx			: out  STD_LOGIC;
		
		-- XGA
		o_vid_hSync	: out  STD_LOGIC;
		o_vid_vSync	: out  STD_LOGIC;
		o_vid_red	: out  STD_LOGIC_VECTOR (1 downto 0);
		o_vid_grn	: out  STD_LOGIC_VECTOR (1 downto 0);
		o_vid_blu	: out  STD_LOGIC_VECTOR (1 downto 0);
		
		-- PS/2 Kbd
		io_ps2Clk	: inout std_logic;
		io_ps2Data	: inout std_logic
		);
end pdp8;

architecture Behavioral of pdp8 is

	COMPONENT IOT_Distributor
	PORT(
		ready_3		: IN std_logic;
		clearacc_3	: IN std_logic;
		datain_3		: IN std_logic_vector(7 downto 0);
		ready_4		: IN std_logic;
		clearacc_4	: IN std_logic;
		datain_4		: IN std_logic_vector(7 downto 0);
		bit1_cp2		: IN std_logic;
		dataout		: IN std_logic_vector(7 downto 0);
		bit2_cp3		: IN std_logic;
		io_address	: IN std_logic_vector(2 downto 0);          
		clear_3		: OUT std_logic;
		dataout_3	: OUT std_logic_vector(7 downto 0);
		load_3		: OUT std_logic;
		clear_4		: OUT std_logic;
		dataout_4	: OUT std_logic_vector(7 downto 0);
		load_4		: OUT std_logic;
		skip_flag	: OUT std_logic;
		clearacc		: OUT std_logic;
		datain		: OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Panel
	PORT(
		clk			: IN std_logic;
		dispout		: IN std_logic_vector(11 downto 0);
		linkout		: IN std_logic;
		halt			: IN std_logic;
		sw				: in std_logic_vector(15 downto 0);
		btnc			: in std_logic;
		btnu			: in std_logic;
		btnd			: in std_logic;
		btnl			: in std_logic;
		btnr			: in std_logic;
		btnCpuReset : in std_logic;
		-- 
		swreg			: OUT std_logic_vector(11 downto 0);
		dispsel		: OUT std_logic_vector(1 downto 0);
		run			: OUT std_logic;
		loadpc		: OUT std_logic;
		loadac		: OUT std_logic;
		step			: OUT std_logic;
		deposit		: OUT std_logic;
		reset			: out std_logic;
		led			: OUT std_logic_vector(15 downto 0);
		seg			: OUT std_logic_vector(7 downto 0);
		an				: OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT Memory
	PORT(
		clk				: IN std_logic;
		reset 			: IN std_logic;
		address 			: IN std_logic_vector(11 downto 0);
		write_data		: IN std_logic_vector(11 downto 0);
		write_enable	: IN std_logic;
		read_enable		: IN std_logic;          
		read_data		: OUT std_logic_vector(11 downto 0);
		mem_finished	: OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT CPU
	PORT(
		clk				: IN std_logic;
		reset				: IN std_logic;
		read_data		: IN std_logic_vector(11 downto 0);
		mem_finished	: IN std_logic;
		swreg				: IN std_logic_vector(11 downto 0);
		dispsel			: IN std_logic_vector(1 downto 0);
		run				: IN std_logic;
		loadpc			: IN std_logic;
		loadac			: IN std_logic;
		step				: IN std_logic;
		deposit			: IN std_logic;
		skip_flag		: IN std_logic;
		clearacc			: IN std_logic;
		datain			: IN std_logic_vector(7 downto 0);          
		address			: OUT std_logic_vector(11 downto 0);
		write_data		: OUT std_logic_vector(11 downto 0);
		write_enable	: OUT std_logic;
		read_enable		: OUT std_logic;
		dispout			: OUT std_logic_vector(11 downto 0);
		linkout			: OUT std_logic;
		halt				: OUT std_logic;
		bit1_cp2			: OUT std_logic;
		bit2_cp3			: OUT std_logic;
		io_address		: OUT std_logic_vector(2 downto 0);
		dataout			: OUT std_logic_vector(7 downto 0)
	);
	END COMPONENT;

	COMPONENT UART
	PORT(
		clk			: IN std_logic;
		rx				: IN std_logic;
		clear_3		: IN std_logic;
		load_3		: IN std_logic;
		dataout_3	: IN std_logic_vector(7 downto 0);
		clear_4		: IN std_logic;
		load_4		: IN std_logic;
		dataout_4	: IN std_logic_vector(7 downto 0);          
		tx				: OUT std_logic;
		ready_3		: OUT std_logic;
		clearacc_3	: OUT std_logic;
		datain_3		: OUT std_logic_vector(7 downto 0);
		ready_4		: OUT std_logic;
		clearacc_4	: OUT std_logic;
		datain_4		: OUT std_logic_vector(7 downto 0)
	);
	END COMPONENT;
	
	-- Display is copied from Multicomp project
	COMPONENT SBCTextDisplayRGB
	port (
		n_reset		: in std_logic;
		clk    		: in  std_logic;
		n_wr			: in  std_logic;
		n_rd			: in  std_logic;
		regSel		: in  std_logic;
		dataIn		: in  std_logic_vector(7 downto 0);
		dataOut		: out std_logic_vector(7 downto 0);
		n_int			: out std_logic;

		-- RGB video signals
		videoR0		: out std_logic;
		videoR1		: out std_logic;
		videoG0		: out std_logic;
		videoG1		: out std_logic;
		videoB0		: out std_logic;
		videoB1		: out std_logic;
		hSync  		: buffer  std_logic;
		vSync  		: buffer  std_logic;

		-- Keyboard signals
		ps2Clk	: inout std_logic;
		ps2Data	: inout std_logic;

		-- FN keys passed out as general signals (momentary and toggled versions)
		FNkeys			: out std_logic_vector(12 downto 0);
		FNtoggledKeys	: out std_logic_vector(12 downto 0)

	);
	END COMPONENT;

	-- Systemwide
	signal reset : std_logic;

	-- Panel to CPU
	signal swX			: std_logic_vector(15 downto 0);	-- SW 15 is Run/Stop
																		-- SW 14, 13 unused
																		-- SW 12 loads link with load AC button (eventually)
																		-- SW 11 to SW 0 is Switch Register
	signal swreg		: std_logic_vector (11 downto 0);
	signal dispsel		: std_logic_vector (1 downto 0);
	signal run			: std_logic := '1';
	signal loadpc		: std_logic := '0';
	signal loadac		: std_logic := '0'; -- added
	signal step			: std_logic := '0';
	signal deposit		: std_logic := '0';
	-- CPU to Panel
	signal dispout		: std_logic_vector(11 downto 0);
	signal linkout		: std_logic;
	signal halt			: std_logic;
	-- CPU to IOT_Distributor
	signal bit1_cp2	: std_logic;
	signal bit2_cp3	: std_logic;
	signal io_address	: std_logic_vector(2 downto 0); -- abbreviated since we don't need all IO addresses
	signal dataout		: std_logic_vector (7 downto 0);
	-- IOT_Distributor to CPU
	signal skip_flag	: std_logic; 
	signal clearacc	: std_logic;
	signal datain		: std_logic_vector(7 downto 0);
	-- IOT_Distributor to UART
	signal clear_3		: std_logic; 
	signal load_3		: std_logic;
	signal dataout_3	: std_logic_vector(7 downto 0);
	signal clear_4		: std_logic; 
	signal load_4		: std_logic;
	signal dataout_4	: std_logic_vector(7 downto 0);
	-- UART to IOT_Distributor
	signal ready_3		: std_logic; 
	signal clearacc_3	: std_logic;
	signal datain_3	: std_logic_vector(7 downto 0);
	signal ready_4		: std_logic; 
	signal clearacc_4	: std_logic;
	signal datain_4	: std_logic_vector(7 downto 0);
	-- Signals in bus Memory
	signal address			: std_logic_vector (11 downto 0);
	signal write_data		: std_logic_vector (11 downto 0);
	signal read_data		: std_logic_vector (11 downto 0);
	signal write_enable	: std_logic;
	signal read_enable	: std_logic; -- added handshake signal to start read cycle
	signal mem_finished	: std_logic; -- added handshake signal
	signal seg 				: std_logic_vector (7 downto 0); 
	signal an 				: std_logic_vector (7 downto 0);

	signal w_fKey1				: std_logic;	--	F1 key switches between VDU and Serial port
														--		Default is VDU
	signal w_fKey2				: std_logic;	--	F2 key switches serial port baud rate between 300 and 115,200
														--		Default is 115,200 baud
	signal w_funKeys			: std_logic_vector(12 downto 0);

	signal w_VDUDataOut		: std_logic_vector(7 downto 0);
	signal led					: std_logic_vector(15 downto 0);

--attribute syn_keep: boolean;
--attribute syn_keep of address			: signal is true;
--attribute syn_keep of datain			: signal is true;
--attribute syn_keep of dataout			: signal is true;
--attribute syn_keep of write_data		: signal is true;
--attribute syn_keep of read_data		: signal is true;
--attribute syn_keep of datain_3			: signal is true;
--attribute syn_keep of dataout_4		: signal is true;
--attribute syn_keep of write_enable	: signal is true;
--attribute syn_keep of read_enable		: signal is true;
--attribute syn_keep of mem_finished	: signal is true;
--attribute syn_keep of run				: signal is true;

-- System reset
begin
	-- Combine the 12 switches, Link switch and Run switch
	swX <= runSwitch&"00"&lnkSwitch&sw;
	-- Pick out the status LEDs from led()
	runLED		<= led(15);
	dispPCLED	<= led(3);
	dispMALED	<= led(2);
	dispMDLED	<= led(1);
	dispACLED	<= led(0);
	dispLEDs		<= dispout;		-- The 12 LEDs
	linkLED		<= linkout;
	
	Inst_IOT_Distributor: IOT_Distributor PORT MAP(
		ready_3		=> ready_3,
		clear_3		=> clear_3,
		clearacc_3	=> clearacc_3,
		dataout_3	=> dataout_3,
		datain_3		=> datain_3,
		load_3		=> load_3,
		ready_4		=> ready_4,
		clear_4		=> clear_4,
		clearacc_4	=> clearacc_4,
		dataout_4	=> dataout_4,
		datain_4		=> datain_4,
		load_4		=> load_4,
		skip_flag	=> skip_flag,
		bit1_cp2		=> bit1_cp2,
		clearacc		=> clearacc,
		dataout		=> dataout,
		datain		=> datain,
		bit2_cp3		=> bit2_cp3,
		io_address	=> io_address
	);

	Inst_Panel: Panel PORT MAP(
		clk			=> clk,
		dispout		=> dispout,
		linkout		=> linkout,
		halt			=> halt,
		sw 			=> swX,
		btnc			=> dispPB,
		btnu			=> stepPB,
		btnd			=> depPB,
		btnl			=> ldPCPB,
		btnr			=> ldACPB,
		btnCpuReset => btnCpuReset,
		--
		swreg			=> swreg,
		dispsel		=> dispsel,
		run			=> run,
		loadpc		=> loadpc,
		loadac		=> loadac,
		step			=> step,
		deposit		=> deposit,
		reset			=> reset,
		led			=> led,
		seg			=> seg,
		an				=> an
	);

	Inst_Memory: Memory PORT MAP(
		clk				=> clk,
		reset				=> reset,
		address			=> address,
		write_data		=> write_data,
		read_data		=> read_data,
		write_enable	=> write_enable,
		read_enable		=> read_enable,
		mem_finished	=> mem_finished
	);

	Inst_CPU: CPU PORT MAP(
		clk				=> clk,
		reset				=> reset,
		address			=> address,
		write_data		=> write_data,
		read_data		=> read_data,
		write_enable	=> write_enable,
		read_enable		=> read_enable,
		mem_finished	=> mem_finished,
		swreg				=> swreg,
		dispsel			=> dispsel,
		run				=> run,
		loadpc			=> loadpc,
		loadac			=> loadac,
		step				=> step,
		deposit			=> deposit,
		dispout			=> dispout,
		linkout			=> linkout,
		halt				=> halt,
		bit1_cp2			=> bit1_cp2,
		bit2_cp3			=> bit2_cp3,
		io_address		=> io_address,
		dataout			=> dataout,
		skip_flag		=> skip_flag,
		clearacc			=> clearacc,
		datain			=> datain
	);

	Inst_UART: UART PORT MAP(
		clk			=> clk,
		rx				=> rsrx,
		tx				=> rstx,
		clear_3		=> clear_3,
		load_3		=> load_3,
		dataout_3	=> dataout_3,
		ready_3		=> ready_3,
		clearacc_3	=> clearacc_3,
		datain_3		=> datain_3,
		clear_4		=> clear_4,
		load_4		=> load_4,
		dataout_4	=> dataout_4,
		ready_4		=> ready_4,
		clearacc_4	=> clearacc_4,
		datain_4		=> datain_4
	);
	
	Inst5_VDU: SBCTextDisplayRGB port map (
		n_reset	=> not reset,
		clk 		=> clk,
		n_wr		=> not load_4,
		n_rd		=> '1',
		regSel	=> '1',
		dataIn	=> dataout_4,
		dataOut	=> w_VDUDataOut,
--		n_int => n_int1,

		-- RGB video signals
		hSync		=> o_vid_hSync,
		vSync		=> o_vid_vSync,
		videoR1	=> o_vid_red(1),
		videoR0	=> o_vid_red(0),
		videoG1	=> o_vid_grn(1),
		videoG0	=> o_vid_grn(0),
		videoB1	=> o_vid_blu(1),
		videoB0	=> o_vid_blu(0),

		ps2Clk	=> io_ps2Clk,
		ps2Data	=> io_ps2Data,
		FNkeys	=> w_funKeys
	);
	
end Behavioral;
