-- =====================================================================
-- @File Name: ProgramCounter.vhdl
-- @Author: Omar Hassan (engomar625@gmail.com)
--  
-- @Description: 
--		- Program Counter point to instruction memory.
--      - Specaily to the next executed instruction. 
--
-- @Revision History: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY ProgramCounter IS
	PORT(
        clk,reset : IN std_logic;
		input  : IN  std_logic_vector(31 DOWNTO 0);
        output : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END ProgramCounter; 
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_ProgramCounter OF ProgramCounter IS
BEGIN 
	PROCESS (clk) 
    BEGIN
        IF(reset = '1') THEN
            output <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            output <= input;
        END IF;
    END PROCESS;
END Arch_ProgramCounter;
-- =============================================