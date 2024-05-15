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
		ALU_Input_One : IN  std_logic_vector(31 DOWNTO 0); 
		ALU_Input_Two : IN  std_logic_vector(31 DOWNTO 0); 
		ALU_Control   : IN  std_logic_vector(3 DOWNTO 0);
		ALU_Output    : OUT std_logic_vector(31 DOWNTO 0);
		Zero_Flag     : OUT std_logic
	);
END ENTITY ;
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_ALU OF ALU IS
	SIGNAL  ALU_Output_SIGNAL : std_logic_vector(31 DOWNTO 0):=X"00000000";
BEGIN 		
		
	PROCESS(ALU_Input_One,ALU_Input_Two,ALU_Control)	 
		BEGIN		
			CASE  ALU_Control IS 
				-- Bitwise AND
				WHEN "0000"=>	 
					ALU_Output_SIGNAL <= (ALU_Input_One and  ALU_Input_Two);	 
				
				-- Bitwise OR	
				WHEN "0001"=>	 
					ALU_Output_SIGNAL <= (ALU_Input_One or  ALU_Input_Two);

				-- Bitwise NOR
				WHEN "1100"=>	 
				ALU_Output_SIGNAL <=  (ALU_Input_One NOR ALU_Input_Two);

				-- Add
				WHEN "0010"=>	 
					ALU_Output_SIGNAL <=  (ALU_Input_One + ALU_Input_Two);

				-- Sub
				WHEN "0110"=>	 
					ALU_Output_SIGNAL <=  (ALU_Input_One - ALU_Input_Two);
					
				-- Comparator
				WHEN "0111"=>	  
					IF(ALU_Input_One < ALU_Input_Two) THEN 
						ALU_Output_SIGNAL <= x"00000001";
					ELSE 
						ALU_Output_SIGNAL <= x"00000000";
					END IF;
					
				WHEN OTHERS=>	 
					ALU_Output_SIGNAL <= x"00000000";  	 
			END CASE;  
			
			
	END PROCESS;
			 ALU_Output <= ALU_Output_SIGNAL; 
			Zero_Flag  <= '1' WHEN ALU_Output_SIGNAL = x"00000000" ELSE '0';
									   
END Arch_ALU;
-- =============================================