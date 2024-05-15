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
		ALUSource: IN STD_LOGIC;
        ALUControl : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ReadData, Instruction: IN STD_LOGIC_VECTOR(31 DOWNTO 0);

		-- Ouputs
		Zero_Flag	: OUT STD_LOGIC;
		PC			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALU_Output	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		WriteData	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)	
	);
END DataPath; 
-- ==========================================



-- =========== Architectures Section =========== 
ARCHITECTURE Arch_DataPath OF DataPath IS	   
			  
	signal PC_Signal,ALU_Output_Signal,WriteData_Signal : STD_LOGIC_VECTOR (31 downto 0):= X"00000000";
	signal WriteRegister: STD_LOGIC_VECTOR (4 downto 0):="00000";
	signal pcjump, pcnext, pcnextbr, pcplus1, pcbranch: STD_LOGIC_VECTOR (31 downto 0):= X"00000000";
	signal SignImme: STD_LOGIC_VECTOR (31 downto 0):= X"00000000";
	signal SrcA, Srcb, result: STD_LOGIC_VECTOR (31 downto 0):= X"00000000";
begin	  
	
	-- next PC logic
	pcjump <= (pcplus1(31 downto 26) & Instruction(25 downto 0));
	SignExtender: SignExtender port map(
		Instruction(15 downto 0),
		SignImme
	);

	pcplus1_Adder: Adder port map(
		PC_Signal,
		X"00000001",
		pcplus1
	);
	pcbranch_Adder: Adder port map(
		pcplus1,
		SignImme,
		pcbranch
	);
	pcnextbr_MUX: Multiplexer generic map(32) port map(
		PCSrouce, 
		pcplus1, 
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
		PC_Signal
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
		ALU_Output_Signal, 
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
		WriteData_Signal
	);

	-- ALU logic
	SrcB_Mux: Multiplexer generic map(32) port map(
		ALUSource, 
		WriteData_Signal, 
		SignImme, 
		Srcb
	);
	ALU: ALU port map(
		SrcA, 
		Srcb, 
		ALUControl, 
		ALU_Output_Signal, 
		Zero_Flag
	);
	ALU_Output <= ALU_Output_Signal;
	PC <= PC_Signal;
	WriteData <= WriteData_Signal;
END Arch_DataPath;
-- =============================================