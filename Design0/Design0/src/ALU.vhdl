-- =====================================================================
-- @File Name: ALU.vhd
-- @Author: Hassan alzyat(hassanalzyatcse2022@gmail.com)
-- 
-- @Description: 
-- 		- The ALU (Arithmetic Logic Unit) is a crucial component of the MIPS processor. 
-- 		- It performs arithmetic, logical, and comparison operations on binary data using fixed-size registers. 
--		- The ALU executes operations such as :
--				- Addition.
--				- Subtraction. 
--				- Bitwise logical operations.
-- 		- It also sets zero flag status flags to indicate the outcome of the operation. 
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
ENTITY ALU IS 
	PORT(
		ALU_Input_One : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); 
		ALU_Input_Two : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); 
		ALU_Control   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		ALUOutput     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		Zero_Flag     : OUT STD_LOGIC
	);
END ENTITY ;
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_ALU OF ALU IS
	SIGNAL  ALUOutput_Signal : STD_LOGIC_VECTOR(31 DOWNTO 0):=X"00000000";
BEGIN 		
		
	PROCESS(ALU_Input_One,ALU_Input_Two,ALU_Control)	 
		BEGIN		
			CASE  ALU_Control IS 
				-- Bitwise AND
				WHEN "0000"=>	 
					ALUOutput_Signal <= (ALU_Input_One AND  ALU_Input_Two);	 
				
				-- Bitwise OR	
				WHEN "0001"=>	 
					ALUOutput_Signal <= (ALU_Input_One OR  ALU_Input_Two);

				-- Bitwise NOR
				WHEN "1100"=>	 
					ALUOutput_Signal <=  (ALU_Input_One NOR ALU_Input_Two);

				-- Add
				WHEN "0010"=>	 
					ALUOutput_Signal <=  (ALU_Input_One + ALU_Input_Two);

				-- Sub
				WHEN "0110"=>	 
					ALUOutput_Signal <=  (ALU_Input_One - ALU_Input_Two);
					
				-- Comparator
				WHEN "0111"=>	  
					IF(ALU_Input_One < ALU_Input_Two) THEN 
						ALUOutput_Signal <= x"00000001";
					ELSE 
						ALUOutput_Signal <= x"00000000";
					END IF;
					
				WHEN OTHERS=>	 
					ALUOutput_Signal <= x"00000000";  	 
			END CASE;  
			
			
	END PROCESS;
			 ALUOutput <= ALUOutput_Signal; 
			Zero_Flag  <= '1' WHEN ALUOutput_Signal = x"00000000" ELSE '0';
									   
END Arch_ALU;
-- =============================================