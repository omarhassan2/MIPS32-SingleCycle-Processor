-- =====================================================================
-- @File Name: SignExtender.vhd
-- @Author:hassanAlzyat(hassanalzyatcse2022@gmail.com)
--
-- @Description: 
--		- Sign extender it converts a 16 bits to 32 bit. 
--		- And conserve the sign by using two complement
-- 
-- @Revision History: 4-5-2024
-- ===================================================================== 



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; 
-- ========================================= 



-- =========== Entities Section =============
ENTITY SignExtender IS 
	PORT(
		Input  : IN   STD_LOGIC_VECTOR(15 DOWNTO 0); 
		Output : OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END SignExtender ;	
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_SignExtender OF SignExtender IS
BEGIN 		 
	-- 4X4=16 > 0
	Output <= 
		x"0000" & Input WHEN Input(15)='0' ELSE
		x"FFFF" & Input;
END Arch_SignExtender ;
-- =============================================











