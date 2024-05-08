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
    signal WriteData, DataAddress: STD_LOGIC_VECTOR(31 downto 0);
    signal clk, reset, MemoryReadWriteEnable: STD_LOGIC;
begin

    -- instantiate device to be tested
    TopLevel: TopLevel port map (
        clk, 
        reset, 
        WriteData, 
        DataAddress, 
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
        wait for 22 ns;
        reset <= '0';
        wait;
    end process;

    -- check that 7 gets written to address 84 at end of program
    process (clk) begin
        if ((clk'event and clk = '0') and MemoryReadWriteEnable = '1') then
            if ((conv_integer(DataAddress) = 84) and (conv_integer(WriteData) = 7)) then
                report "Simulation succeeded";
            elsif (DataAddress /= 80) then
                report "Simulation failed";
            end if;
        end if;
    end process;
end;