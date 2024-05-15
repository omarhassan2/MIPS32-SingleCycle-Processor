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
     -- We can write the Instruction here.... 

    "001000" & "00000" & "00001" & "0000000000001100",	-- addi R1 = R0 + 12
	
	"001000" & "00000" & "00101" & "0000000000001000",	-- addi R5 = R0 + 8
	
	"000000" & "00001" & "00101" & "00111" & "00000" & "100000",	-- add R7 = R1 + R5
	
    "101011" & "00000" & "00111" & "0000000000000000",	-- sw R7 0(R0)
	
    "100011" & "00000" & "01000" & "0000000000000000",	-- lw R8 0(R0) 	 
	
	"000010" & "00000000000000000000001001",	-- jump 9
	
	X"00000000",
	X"00000000",
	X"00000000",
	
	"001000" & "00000" & "01010" & "0000000000000010",	-- addi R10 = R0 + 2 
	
	"000010" & "00000000000000000000001110",	-- jump 14	
	
	X"00000000",
	X"00000000",
	X"00000000",
	X"00000000",
	
	"001000" & "00000" & "01011" & "0000000000000010",	-- addi R11 = R0 + 2 		  
	
	"000000" & "01010" & "01011" & "01100" & "00000" & "100010",	-- sub R12 = R10 - R11	  
	
	"000100" & "01010" & "01011" & "0000000000000011",	  -- BEQ   
	
	X"00000000",
	X"00000000",   
	X"00000000", 
	
	"001000" & "00000" & "10000" & "0000000000010000",	-- addi R16 = R0 + 16 
	
    OTHERS => (OTHERS => '0')	   
    );
BEGIN 

	Instruction <= Instructions(TO_INTEGER(UNSIGNED(Address)));

END Arch_InstructionMemory;
-- =========================================