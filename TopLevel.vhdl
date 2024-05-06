-- =====================================================================
-- File Name: TopLevel.vhdl
-- Author(s): Karim Elghamry (kimos20139@gmail.com)  
--            Omar Hassan (oh458886@gmail.com)
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
        clk, reset : IN STD_LOGIC;
		WriteData, ALU_Output : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable : BUFFER STD_LOGIC
	);
END TopLevel; 
-- ==============================================



-- =========== Architectures Section ============
ARCHITECTURE Arch_TopLevel OF TopLevel IS
    signal PC, Instruction,
    ReadData: STD_LOGIC_VECTOR (31 downto 0);
BEGIN 
    Processor: MIPS PORT MAP (
        ALU_Output,
        WriteData,
        PC,
        Instruction,
        ReadData,
        MemoryReadWriteEnable,
        clk, 
        reset
    );

    InstructionMemory: InstructionMemory PORT MAP (
        PC,
        Instruction
    );

    DataMemory: DataMemory PORT MAP (
        clk, 
        MemoryReadWriteEnable,
        ALU_Output,
        WriteData,
        ReadData
    );

END Arch_TopLevel;
-- ==============================================