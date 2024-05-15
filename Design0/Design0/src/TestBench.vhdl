-- =====================================================================
-- File Name: TestBench.vhdl
-- Author(s): Karim Elghamry (kimos20139@gmail.com)
--            Omar Hassan (oh458886@gmail.com)
-- Description: 
--
-- Revision History:
--   5/6/2024: Initial
-- =====================================================================



-- ============= Libraries Section ==============
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;	  
USE WORK.Packages.ALL;
-- ==============================================



entity testbench is
end;


architecture test of testbench is
    signal clk, reset, MemoryReadWriteEnable: STD_LOGIC:= '0';
	signal PC, WriteData, DataAddress: STD_LOGIC_VECTOR(31 downto 0):= X"00000000";
begin

    -- instantiate device to be tested
    TopLevel: TopLevel port map (
        clk, 
        reset, 
        WriteData, 
        DataAddress,
		PC,
        MemoryReadWriteEnable
    );

    -- Generate clock with 10 ns period
    process begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;

    -- Generate reset for first two clock cycles
    process begin
        reset <= '1';
        wait for 5 ns;
        reset <= '0';
        wait;
    end process;

end;