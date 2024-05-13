-- =====================================================================
-- File Name: TopLevel.vhdl
-- Author(s): Karim Elghamry (kimos20139@gmail.com)  
--            Omar Hassan (oh458886@gmail.com)
-- Description: Combine Processor, Instruction Memory and Data Memory
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
		WriteData, ALU_Output, PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable : OUT STD_LOGIC
	);
END TopLevel; 
-- ==============================================



-- =========== Architectures Section ============
ARCHITECTURE Arch_TopLevel OF TopLevel IS
    SIGNAL PC_Signal, Instruction, ALU_Output_Signal: STD_LOGIC_VECTOR (31 downto 0):= X"00000000";		
	SIGNAL WriteData_Signal, ReadData: STD_LOGIC_VECTOR (31 downto 0):= X"00000000";		
	SIGNAL MemoryReadWriteEnable_Signal : STD_LOGIC:= '0' ;
BEGIN 
    Processor: MIPS PORT MAP (
        ALU_Output_Signal,
        WriteData_Signal,
        PC_Signal,
        Instruction,
        ReadData,
        MemoryReadWriteEnable_Signal,
        clk, 
        reset
    );

    InstructionMemory: InstructionMemory PORT MAP (
        PC_Signal,
        Instruction
    );

    DataMemory: DataMemory PORT MAP (
        clk, 
        MemoryReadWriteEnable_Signal,
        ALU_Output_Signal,
        WriteData_Signal,
        ReadData
    );	 
	PC <= PC_Signal;
	ALU_Output <= ALU_Output_Signal;
	WriteData <= WriteData_Signal; 
	MemoryReadWriteEnable <= MemoryReadWriteEnable_Signal;
END Arch_TopLevel;
-- ==============================================