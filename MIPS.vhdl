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
ENTITY MIPS IS
	PORT(
		ALU_Output, WriteData, PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Instruction, ReadData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable : OUT STD_LOGIC;
        clk, reset : IN STD_LOGIC
	);
END MIPS; 
-- ==============================================



-- =========== Architectures Section ============
ARCHITECTURE Arch_MIPS OF MIPS IS

    SIGNAL RegisteryWriteEnable, RegisteryDistination, ALUSource, Branch, BypassMemory, Jump : STD_LOGIC;
    SIGNAL ALUControl       :  STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Zero_Flag        :  STD_LOGIC;
    SIGNAL PCSource         :  STD_LOGIC;

        BEGIN 

            Control: ControlUnit PORT MAP (
                RegisteryWriteEnable,
                RegisteryDistination,
                ALUSource,
                Branch, 
                MemoryReadWriteEnable,
                BypassMemory,
                Jump, 
                ALUControl,
                Instruction(31 DOWNTO 26),
                Instruction(5 DOWNTO 0)
            );

            Data: DataPath PORT MAP(
                clk,
                reset,
                PCSource,
                BypassMemory,
                Jump,
                RegisteryWriteEnable,
                RegisteryDistination,
                ALUSource,
                Branch,
                ReadData,
                Instruction,
                Zero_Flag,
                PC,
                ALU_Output,
                WriteData
            );
            
            PCSource <= Zero_Flag AND Branch

END Arch_MIPS;
-- ==============================================