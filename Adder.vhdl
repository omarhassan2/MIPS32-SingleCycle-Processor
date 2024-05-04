-- =====================================================================
-- File Name: Adder.vhd
-- Author: Mohamed Gehad (ENGMGehad@gmail.com)
-- Description: Adder is a module that performs addition on two input vectors.
--              It operates on fixed-size vectors and produces the sum as output.
--              The module is parameterized with the vector size (N).
-- Revision History: 4-5-2024
-- =====================================================================




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


Entity Adder is
	Generic(N: integer:= 32);
	port(
		in0, in1: in std_logic_vector(N-1 downto 0);
		output: out std_logic_vector(N-1 downto 0)
    );
end Adder;

architecture arch of Adder is
begin
	output <= in0 + in1;
end arch;