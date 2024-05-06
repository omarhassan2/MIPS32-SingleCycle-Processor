-- =====================================================================
-- @File Name: SignExtender.vhd
-- @Author:hassanAlzyat(hassanalzyatcse2022@gmail.com)
--
-- @Description: 
--		- Sign extENDer it converts a 16 bits to 32 bit. 
--		- And conserve the sign by usINg two complement
-- 
-- @RevISion HIStory: 4-5-2024
-- ===================================================================== 



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; 
-- ========================================= 



-- =========== Entities Section =============
ENTITY SignExtender IS 
	PORT(
		input  : IN   std_logic_vector(15 DOWNTO 0); 
		output : OUT  std_logic_vector(31 DOWNTO 0)
	);
END SignExtender ;	
-- ==========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE Arch_Extender OF SignExtender IS
BEGIN 		 
	-- 4X4=16 > 0
	output <= 
		x"0000" & input WHEN input(15)='0'ELSE
		x"FFFF" & input;
END Arch_Extender ;
-- =============================================











