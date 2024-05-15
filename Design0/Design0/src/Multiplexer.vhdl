-- =====================================================================
-- @File Name: Multiplexer.vhdl
-- @Author: Mohamed Gehad (ENGMGehad@gmail.com)
--
-- @Description: 
--		- This is a multiplexer module with :
--				- Two inputs (IN0 and IN1). 
-- 				- Select signal (sl).
--				- One output (OUTput).
-- 		- It selects between IN0 and IN1 based on the value of the select signal.
--
-- @Revision History: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY Multiplexer  IS
	GENERIC (Bits: INTEGER:= 32);
	PORT(
		Selector	: IN STD_LOGIC;
		IN0,IN1		: IN STD_LOGIC_VECTOR(Bits - 1 DOWNTO 0);
		Output		: OUT STD_LOGIC_VECTOR(Bits - 1 DOWNTO 0)
	);
END Multiplexer; 
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_Multiplexer OF Multiplexer IS
	BEGIN 
		Output<= IN0 WHEN (Selector = '0') ELSE IN1;
END Arch_Multiplexer;
-- =============================================