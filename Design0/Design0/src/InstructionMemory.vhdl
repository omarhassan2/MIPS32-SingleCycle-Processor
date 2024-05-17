-- =====================================================================
-- @File Name: INstractionMemory.vhd
-- @Author: Shehap Shukri ghzal (sh.s.ghazal2003.com)
-- 
-- @Description :
--      - Instruction memory stores machine instructions for CPU execution in a computer system.
-- @Revision History: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY InstructionMemory IS
    PORT (
       Address       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
       Instruction   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END InstructionMemory;
-- =========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_InstructionMemory OF InstructionMemory IS
    TYPE memory IS ARRAY (0 TO 63) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL Instructions: memory := ( 
		-- Initilize
		"100011" & "00000" & "00001" & "0000000000000000",				-- 0: lw R1 0(R0) 	 
			
		"001100" & "00001" & "00100" & "0000000000000001",				-- 1: subi R4 = R1 - 1

		"001100" & "00001" & "00010" & "0000000000000001",				-- 2: subi R2 = R1 - 1	

		-- Multiplier
		"000000" & "00011" & "00001" & "00011" & "00000" & "100000",	-- 3:  add R3 = R1 + R3

		"001100" & "00010" & "00010" & "0000000000000001",				-- 4: subi R2 = R2 - 1

		"000100" & "00010" & "00000" & "0000000000000001",	  			-- 5: BEQ  R2 - R0 == 0, 1

		"000010" & "00000000000000000000000011",						-- 6: jump 3	 

		-- Factorial
		"001000" & "00011" & "00001" & "0000000000000000",				-- 7: addi R1 = R3 + 0

		"001000" & "00000" & "00011" & "0000000000000000",				-- 8: addi R3 = R0 + 0

		"001100" & "00100" & "00100" & "0000000000000001",				-- 9: subi R4 = R4 - 1  

		"001000" & "00100" & "00010" & "0000000000000000",				-- 10: addi R2 = R4 + 0

		"000100" & "00100" & "00000" & "0000000000000001",	  			-- 11: BEQ  R0 - R4 == 0, 1 
		
		"000010" & "00000000000000000000000011",						-- 12: jump 3	

		-- Save To Data Memory
		"101011" & "00000" & "00001" & "0000000000000001",				-- 13: sw R1 1(R0)

		"001000" & "00000" & "00001" & "0000000000000000",	 			-- 14 addi R1 = R0 + 0

    OTHERS => (OTHERS => '0')	   
    );
BEGIN 

	Instruction <= Instructions(TO_INTEGER(UNSIGNED(Address)));

END Arch_InstructionMemory;
-- =========================================
