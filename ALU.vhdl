-- =====================================================================
-- @File Name: ALU.vhd
-- @Author: Hassan alzyat(hassanalzyatcse2022@gmail.com)
-- 
-- @Description: 
-- 		- The ALU (Arithmetic Logic Unit) IS a crucial component OF the MIPS PROCESSor. 
-- 		- It performs arithmetic, logical, and comparISon operations on bINary data usINg fixed-size regISters. 
--		- The ALU executes operations such as :
--				- Addition.
--				- Subtraction. 
--				- BitwISe logical operations.
-- 		- It also sets zero flag  status flags to INdicate the OUTcome OF the operation. 
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
ENTITY ALU IS 
	PORT(
		Alu_INput_One : IN  std_logic_vector(31 DOWNTO 0); 
		Alu_INput_Two : IN  std_logic_vector(31 DOWNTO 0); 
		Alu_Control   : IN  std_logic_vector(3 DOWNTO 0);
		Alu_OUTput    : OUT std_logic_vector(31 DOWNTO 0);
		zero_Flag     : OUT std_logic
	);
END ENTITY ;
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_ALU OF ALU IS
	SIGNAL  Alu_OUTput_SIGNAL : std_logic_vector(31 DOWNTO 0);
BEGIN 		 
	PROCESS(Alu_INput_One,Alu_INput_Two,Alu_Control)	 
		BEGIN		
			CASE  Alu_Control IS 
				-- Bitwise AND
				WHEN "0000"=>	 
					Alu_OUTput_SIGNAL <=  (Alu_INput_One and  Alu_INput_Two);	 
				
				-- Bitwise OR	
				WHEN "0001"=>	 
					Alu_OUTput_SIGNAL <=  (Alu_INput_One or  Alu_INput_Two);

				-- Add
				WHEN "0010"=>	 
					Alu_OUTput_SIGNAL <=  (Alu_INput_One +  Alu_INput_Two);

				-- Sub
				WHEN "0110"=>	 
					Alu_OUTput_SIGNAL <=  (Alu_INput_One -  Alu_INput_Two);
					
					
				WHEN "0111"=>	  
					IF(Alu_INput_One < Alu_INput_Two) THEN 
						Alu_OUTput_SIGNAL<=x"00000001"	;
					ELSE 
						Alu_OUTput_SIGNAL<=x"00000000"	;
					END IF;


				WHEN "1100"=>	 
					Alu_OUTput_SIGNAL <=  (Alu_INput_One NOR Alu_INput_Two);

					
				WHEN OTHERS=>	 
					Alu_OUTput_SIGNAL <= x"00000000";  
			END CASE;
	END PROCESS;		   
		Alu_OUTput <= Alu_OUTput_SIGNAL;
		zero_Flag <= '1' WHEN Alu_OUTput_SIGNAL = x"00000000"ELSE '0';							   
END Arch_ALU;
-- =============================================