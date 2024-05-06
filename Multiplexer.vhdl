-- =====================================================================
-- @File Name: Multiplexer.vhdl
-- @Author: Mohamed Gehad (ENGMGehad@gmail.com)
--
-- @Description: 
--		- ThIS IS a multiplexer module with :
--				- Two INputs (IN0 and IN1). 
-- 				- Select SIGNAL (sl).
--				- One OUTput (OUTput).
-- 		- It selects between IN0 and IN1 based on the value OF the select SIGNAL.
--
-- @RevISion HIStory: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY Multiplexer  IS
	PORT(
		Selector: IN std_logic;
		IN0,IN1: IN std_logic_vector(31 DOWNTO 0);
		OUTput: OUT std_logic_vector(31 DOWNTO 0)
	);
END Multiplexer; 
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_Multiplexer OF Multiplexer IS
	BEGIN 
		OUTput<= IN0 WHEN (Selector = '0') ELSE IN1;
END Arch_Multiplexer;
-- =============================================