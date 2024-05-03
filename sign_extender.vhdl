

-- =====================================================================
-- File Name: signExtender.vhd
-- Author(s):hassanAlzyat(hassanalzyatcse2022@gmail.com)
-- Description: sign extender it converts a 16 bits to 32 bit and conserve the sign by using two complement
-- Revision History:
--   - <date>: <description of changes> (optional, for major updates)
-- ===================================================================== 
library ieee;
use ieee.std_logic_1164.all;  


entity signExtender is 
	port(
			extender_Input  : in   std_logic_vector(15 downto 0); 
			extender_Output : out  std_logic_vector(31 downto 0)
	);
	
end entity ;	

architecture Behave_Of_Extender of signExtender is

begin 		 
	-- 4X4=16 >0
                extender_Output <= x"0000"& extender_Input when extender_Input(15)='0'else
			           x"FFFF"& extender_Input	;
	
	end architecture ;
	











