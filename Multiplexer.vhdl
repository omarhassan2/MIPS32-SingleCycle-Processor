-- =====================================================================
-- File Name: Multiplexer.vhd
-- Author: Mohamed Gehad (ENGMGehad@gmail.com)
-- Description: This is a multiplexer module with two inputs (in0 and in1), 
-- a select signal (sl), and one output (output).
-- It selects between in0 and in1 based on the value of the select signal.
-- Revision History: 4-5-2024
-- =====================================================================




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


Entity Multiplexer  is
	Generic(N: integer:= 32);
	port(
		in0,in1: in std_logic_vector(N-1 downto 0);
		sl: in std_logic;
		output: out std_logic_vector(N-1 downto 0));
end Multiplexer ; 

architecture arch of Multiplexer is
	begin 
		output<= in0 when (sl='0') else in1;
end arch;

