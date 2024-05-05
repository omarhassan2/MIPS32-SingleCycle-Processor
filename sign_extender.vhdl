-- =====================================================================
-- @File Name: signExtENDer.vhd
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
ENTITY signExtender IS 
	PORT(
		extender_INput  : IN   std_logic_vector(15 DOWNTO 0); 
		extender_Output : OUT  std_logic_vector(31 DOWNTO 0)
	);
END signExtender ;	
-- ==========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE Arch_Extender OF signExtender IS
BEGIN 		 
	-- 4X4=16 > 0
	extender_Output <= 
		x"0000" & extender_INput WHEN extender_INput(15)='0'ELSE
		x"FFFF" & extender_INput;
END Arch_Extender ;
-- =============================================











