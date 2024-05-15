-- =====================================================================
-- @File Name: DataPath.vhdl
-- @Author: Omar Hassan (engomar625@gmail.com)
-- 
-- @Description: 
--			- Connecting all of the componants to each other
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
		clk, reset				: IN STD_LOGIC;
		PCSrouce				: IN STD_LOGIC;
		BypassMemory, Jump		: IN STD_LOGIC;
		RegisteryWriteEnable	: IN STD_LOGIC; 
		RegisteryDistination	: IN STD_LOGIC;
		ALUSource				: IN STD_LOGIC;
        ALUControl				: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ReadData, Instruction	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);

		-- Ouputs
		Zero_Flag				: OUT STD_LOGIC;
		PC						: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALUOutput				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		WriteData				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)	
	);
END DataPath; 
-- ==========================================



-- =========== Architectures Section =========== 
ARCHITECTURE Arch_DataPath OF DataPath IS	   
			  
	SIGNAL PC_Signal, ALUOutput_Signal, WriteData_Signal : STD_LOGIC_VECTOR (31 DOWNTO 0):= X"00000000";
	SIGNAL WriteRegister: STD_LOGIC_VECTOR (4 DOWNTO 0):= "00000";
	SIGNAL PCJump, PCNext, PCNextBr, PCPlusOne, PCBranch: STD_LOGIC_VECTOR (31 DOWNTO 0):= X"00000000";
	SIGNAL SignImme: STD_LOGIC_VECTOR (31 DOWNTO 0):= X"00000000";
	SIGNAL SrcA, Srcb, result: STD_LOGIC_VECTOR (31 DOWNTO 0):= X"00000000";
BEGIN	  
	
	-- next PC logic
	PCJump <= (PCPlusOne(31 DOWNTO 26) & Instruction(25 DOWNTO 0));
	SignExtender: SignExtender PORT MAP(
		Instruction(15 DOWNTO 0),
		SignImme
	);

	PCPlusOne_Adder: Adder PORT MAP(
		PC_Signal,
		X"00000001",
		PCPlusOne
	);
	PCBranch_Adder: Adder PORT MAP(
		PCPlusOne,
		SignImme,
		PCBranch
	);
	PCNextBr_MUX: Multiplexer GENERIC MAP(32) PORT MAP(
		PCSrouce, 
		PCPlusOne, 
		PCBranch, 
		PCNextBr
	);
	PCJump_MUX: Multiplexer GENERIC MAP(32) PORT MAP(
		Jump,
		PCNextBr,
		PCJump,
		PCNext
	);
	ProgramCounter: ProgramCounter PORT MAP(
		clk, 
		reset,
		PCNext,
		PC_Signal
	);

	-- register file logic
	WriteRegister_MUX: Multiplexer GENERIC MAP(5) PORT MAP(
		RegisteryDistination, 
		Instruction(20 DOWNTO 16), 
		Instruction(15 DOWNTO 11), 
		WriteRegister
	);
	Result_MUX: Multiplexer GENERIC MAP(32) PORT MAP(
		BypassMemory, 
		ALUOutput_Signal, 
		ReadData, 
		result
	);
	RegisterFiles: RegisterFiles PORT MAP(
		clk, 
		RegisteryWriteEnable, 
		Instruction(25 DOWNTO 21),
		Instruction(20 DOWNTO 16),
		WriteRegister,
		result,
		SrcA,
		WriteData_Signal
	);

	-- ALU logic
	SrcB_Mux: Multiplexer GENERIC MAP(32) PORT MAP(
		ALUSource, 
		WriteData_Signal, 
		SignImme, 
		Srcb
	);
	ALU: ALU PORT MAP(
		SrcA, 
		Srcb, 
		ALUControl, 
		ALUOutput_Signal, 
		Zero_Flag
	);

	ALUOutput <= ALUOutput_Signal;
	PC <= PC_Signal;
	WriteData <= WriteData_Signal;

END Arch_DataPath;
-- =============================================