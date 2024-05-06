-- =====================================================================
-- @File Name: DataPath.vhdl
-- @Author: Omar Hassan (engomar625@gmail.com)
-- 
-- @Description: 
--		
--
-- @Revision History: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE WORK.Packages.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY DataPath IS
	PORT(
		-- Inputs
		clk, reset: IN STD_LOGIC;
		PCSrouce: IN STD_LOGIC;
		BypassMemory, Jump: IN STD_LOGIC;
		RegisteryWriteEnable, RegisteryDistination: IN STD_LOGIC;
		ALUSource, Branch : IN STD_LOGIC;
        ALUControl : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ReadData, Instruction: IN STD_LOGIC_VECTOR(31 DOWNTO 0);

		-- Ouputs
		Zero_Flag	: BUFFER STD_LOGIC;
		PC			: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALU_Output	: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
		WriteData	: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)	
	);
END DataPath; 
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_DataPath OF DataPath IS
	signal WriteRegister: STD_LOGIC_VECTOR (4 downto 0);
	signal pcjump, pcnext, pcnextbr, pcplus4, pcbranch: STD_LOGIC_VECTOR (31 downto 0);
	signal SignImme, SignImmeShift2: STD_LOGIC_VECTOR (31 downto 0);
	signal SrcA, Srcb, result: STD_LOGIC_VECTOR (31 downto 0);
begin
	-- next PC logic
	pcjump <= (pcplus4(31 downto 28) & Instruction(25 downto 0) & "00");
	SignExtender: SignExtender port map(
		Instruction(15 downto 0),
		SignImme
	);
	SignImmeShift2_ShiftLeft2: ShiftLeft2 port map(
		SignImme,
		SignImmeShift2
	);
	pcplus4_Adder: Adder port map(
		PC,
		X"00000004",
		pcplus4
	);
	pcbranch_Adder: Adder port map(
		pcplus4,
		SignImmeShift2,
		pcbranch
	);
	pcnextbr_MUX: Multiplexer generic map(32) port map(
		PCSrouce, 
		pcplus4, 
		pcbranch, 
		pcnextbr
	);
	pcjump_MUX: Multiplexer generic map(32) port map(
		Jump,
		pcnextbr,
		pcjump,
		pcnext
	);
	ProgramCounter: ProgramCounter port map(
		clk, 
		reset,
		pcnext,
		PC
	);

	-- register file logic
	WriteRegister_MUX: Multiplexer generic map(5) port map(
		RegisteryDistination, 
		Instruction(20 downto 16), 
		Instruction(15 downto 11), 
		WriteRegister
	);
	Result_MUX: Multiplexer generic map(32) port map(
		BypassMemory, 
		ALU_Output, 
		ReadData, 
		result
	);
	RegisterFiles: RegisterFiles port map(
		clk, 
		RegisteryWriteEnable, 
		Instruction(25 downto 21),
		Instruction(20 downto 16),
		WriteRegister,
		result,
		SrcA,
		WriteData
	);

	-- ALU logic
	SrcB_Mux: Multiplexer generic map(32) port map(
		ALUSource, 
		WriteData, 
		SignImme, 
		Srcb
	);
	ALU: ALU port map(
		SrcA, 
		Srcb, 
		ALUControl, 
		ALU_Output, 
		Zero_Flag
	);
		
END Arch_DataPath;
-- =============================================