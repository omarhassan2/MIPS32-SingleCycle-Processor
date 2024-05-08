-- =====================================================================
-- @File Name: INstractionMemory.vhd
-- @Author: Shehap Shukri ghzal (sh.s.ghazal2003.com)
-- 
-- @Description :
--      - INstruction memory stores machINe INstructions for CPU execution IN a computer system
--      - INstruction memory IS vital for program execution efficiency and system responsiveness
--      - INstruction memory design focUSEs on speed optimization techniques like cachINg and prefetchINg
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
ENTITY InstructionMemory IS
    PORT (
       Address       : IN  std_logic_vector(31 DOWNTO 0);
       INstruction   : OUT std_logic_vector(31 DOWNTO 0)
	);
END InstructionMemory;
-- =========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE Arch_InstructionMemory OF InstructionMemory IS
    type memory IS array (0 to 2) OF std_logic_vector(31 DOWNTO 0);
    SIGNAL ROM: memory := (
     -- We can write the Instruction here.... 
     -- but i  will be initialize the value with zeros ....
    
    "001000" & "00000" & "00001" & "0000000000000101", -- addi R1 = R0 + 5

    "101011" & "00000" & "00001" & "0000000000000000", -- sw R1 0(R0)

    "100011" & "00000" & "00010" & "0000000000000000", -- lw R2 0(R0)

    OTHERS => (OTHERS => '0')	   
    );
BEGIN 
	INstruction <= ROM(to_integer(unsigned(Address)));

END Arch_InstructionMemory;
-- =========================================