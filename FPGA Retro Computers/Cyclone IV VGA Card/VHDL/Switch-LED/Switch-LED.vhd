library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use  IEEE.STD_LOGIC_ARITH.all;
-- use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Switch-LED is
	Port (
	SWITCH : in STD_LOGIC;
--	CLK_IN: in STD_LOGIC;
	LED1 : out STD_LOGIC);
end Switch-LED;

architecture Behavioral of Switch-LED is

begin

	LED1 <= not SWITCH;
	
end behavioral;
