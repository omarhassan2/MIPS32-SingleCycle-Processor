-- =====================================================================
-- File Name: TestBench.vhdl
-- Author(s): Karim Elghamry (kimos20139@gmail.com)
--            Omar Hassan (oh458886@gmail.com)
-- Description: 
--              Initialize the MIPS with reset and clock.
-- Revision History:
--   5/6/2024: Initial
-- =====================================================================



-- ============= Libraries Section ==============
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;	  
USE WORK.Packages.ALL;
-- ==============================================



ENTITY TestBech IS
END;


ARCHITECTURE Arch_TestBech OF TestBech IS
    SIGNAL clk, reset, MemoryReadWriteEnable: STD_LOGIC:= '0';
	SIGNAL PC, WriteData, DataAddress: STD_LOGIC_VECTOR(31 DOWNTO 0):= X"00000000";
BEGIN
    -- instantiate device to be tested
    TopLevel: TopLevel PORT MAP(
        clk, 
        reset, 
        WriteData, 
        DataAddress,
		PC,
        MemoryReadWriteEnable
    );

    -- Generate clock with 10 ns period
    PROCESS BEGIN
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
    END PROCESS;

    -- Generate reset for first clock cycle
    PROCESS BEGIN
        reset <= '1';
        WAIT FOR 5 ns;
        reset <= '0';
        WAIT;
    END PROCESS;

END Arch_TestBech;