-- =====================================================================
-- @File Name: Packages.vhdl
-- @Author: Omar Hassan (engomar625@gmail.com)
-- 
-- @Description: 
--		- This file contains all COMPONENTs in this workspcae.
--      - Use this line of code to use it : ' USE WORK.Packages.ALL; '
--
-- @Revision History: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- =========================================


PACKAGE packages IS	 
	
-- =========== ShiftLeft2 =============
COMPONENT ShiftLeft2 IS
    PORT(
        input : in std_logic_vector(31 downto 0);
        output: OUT std_logic_vector(31 downto 0)
    );
END COMPONENT;
-- ====================================


-- =========== SignExtender ==========
COMPONENT SignExtender IS
    PORT(
        input  : IN   std_logic_vector(15 DOWNTO 0); 
		output : OUT  std_logic_vector(31 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- =========== Multiplexer ============
COMPONENT Multiplexer IS
    GENERIC (Bits: integer);
    PORT(
        Selector: IN std_logic;
        IN0,IN1: IN std_logic_vector(Bits - 1 DOWNTO 0);
        OUTput: OUT std_logic_vector(Bits - 1 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- ============== Adder ===============
COMPONENT Adder IS
    PORT(
        IN0, IN1: IN  std_logic_vector(31 DOWNTO 0);
        OUTput:   OUT std_logic_vector(31 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- =========== DataMemory ============
COMPONENT DataMemory IS
    PORT (
        clk,WriteEnable: IN std_logic;
        Address,WriteData: IN std_logic_vector(31 DOWNTO 0);
        ReadData: OUT std_logic_vector(31 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- =========== InstructionMemory =============
COMPONENT InstructionMemory IS
    PORT (
       Address       : IN  std_logic_vector(31 DOWNTO 0);
       INstruction   : OUT std_logic_vector(31 DOWNTO 0)
	);
END COMPONENT;
-- =========================================


-- =================== ALU ==================
COMPONENT ALU IS 
	PORT(
		ALU_Input_One : IN  std_logic_vector(31 DOWNTO 0); 
		ALU_Input_Two : IN  std_logic_vector(31 DOWNTO 0); 
		ALU_Control   : IN  std_logic_vector(3 DOWNTO 0);
		ALU_Output    : OUT std_logic_vector(31 DOWNTO 0);
		Zero_Flag     : OUT std_logic
	);
END COMPONENT;
-- =========================================


-- =========== RegISterFiles ===============
COMPONENT RegISterFiles IS
    PORT (
        CLK: IN STD_LOGIC;
        WriteEnable : IN STD_LOGIC; -- WE3 (Enable)
        ReadRegISterOne : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- A1
        ReadRegISterTwo : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- A2
        WriteRegISter   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- A3
        WriteData       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); -- WriteData
        ReadDataOne     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- RD1
        ReadDataTwo     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  -- RD2
    );
END COMPONENT;
-- =========================================


-- ============ ProgramCounter ==============
COMPONENT ProgramCounter IS
	PORT(
        clk,reset : IN std_logic;
		input  : IN  std_logic_vector(31 DOWNTO 0);
        output : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END COMPONENT; 
-- ==========================================


-- ============ ControlUnit ==============
COMPONENT ControlUnit IS
    PORT(
        RegisteryWriteEnable, RegisteryDistination, 
        ALUSource, Branch, MemoryReadWriteEnable, 
        BypassMemory, Jump   : OUT STD_LOGIC;
        ALUControl           : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OPCode, Funct        : IN STD_LOGIC_VECTOR(5 DOWNTO 0)
    );
END COMPONENT; 
-- ==========================================


-- ============ Data Path ==============
COMPONENT DataPath IS
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
END COMPONENT; 
-- ==========================================


-- ================== MIPS ==================
COMPONENT MIPS IS
    PORT(
        ALU_Output, WriteData, PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Instruction, ReadData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable : OUT STD_LOGIC;
        clk, reset : IN STD_LOGIC
    );
END COMPONENT; 
-- ==========================================


-- ================== Arch_TopLevel ==================
COMPONENT Arch_TopLevel IS
    PORT(
        clk, reset : IN STD_LOGIC;
        WriteData, ALU_Output : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable : BUFFER STD_LOGIC
    );
END COMPONENT; 
-- ==========================================


END packages;

