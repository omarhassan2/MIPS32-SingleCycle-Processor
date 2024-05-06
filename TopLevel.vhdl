-- =====================================================================
-- File Name: MIPS.vhdl
-- Author(s): Karim Elghamry (kimos20139@gmail.com)
-- Description: Combine DataPath and ControlUnit
-- Revision History:
--   5/6/2024: Initial
-- =====================================================================



-- ============= Libraries Section ==============
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Packages.ALL;
-- ==============================================



-- ============= Entities Section ===============
ENTITY TopLevel IS
	PORT(
        clk, reset : IN STD_LOGIC
		WriteData, DataAddress : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable : BUFFER STD_LOGIC;
	);
END TopLevel; 
-- ==============================================



-- =========== Architectures Section ============
ARCHITECTURE Arch_MIPS OF MIPS IS


        BEGIN 
            Processor: MIPS PORT MAP ();

END Arch_MIPS;
-- ==============================================