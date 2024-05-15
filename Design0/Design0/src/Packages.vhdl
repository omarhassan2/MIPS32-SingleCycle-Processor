-- =====================================================================
-- @File Name: Packages.vhdl
-- @Author: Omar Hassan (engomar625@gmail.com)
-- 
-- @Description: 
--		- This file contains all COMPONENTs IN this workspcae.
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
	

-- =========== SignExtender ==========
COMPONENT SignExtender IS
    PORT(
        Input  : IN   STD_LOGIC_VECTOR(15 DOWNTO 0); 
		Output : OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- =========== Multiplexer ============
COMPONENT Multiplexer IS
    GENERIC (Bits: INTEGER);
    PORT(
        Selector    : IN STD_LOGIC;
        IN0,IN1     : IN STD_LOGIC_VECTOR(Bits - 1 DOWNTO 0);
        Output      : OUT STD_LOGIC_VECTOR(Bits - 1 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- ============== Adder ===============
COMPONENT Adder IS
    PORT(
        IN0, IN1    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        Output      :   OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- =========== DataMemory ============
COMPONENT DataMemory IS
    PORT (
        clk,WriteEnable     : IN STD_LOGIC;
        Address,WriteData   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        ReadData            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END COMPONENT;
-- ====================================


-- =========== InstructionMemory =============
COMPONENT InstructionMemory IS
    PORT (
       Address       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
       INstruction   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
-- =========================================


-- =================== ALU ==================
COMPONENT ALU IS 
	PORT(
		ALU_Input_One : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); 
		ALU_Input_Two : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); 
		ALU_Control   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		ALUOutput     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		Zero_Flag     : OUT STD_LOGIC
	);
END COMPONENT;
-- =========================================


-- =========== RegisterFiles ===============
COMPONENT RegisterFiles IS
    PORT (
        clk             : IN STD_LOGIC;
        WriteEnable     : IN STD_LOGIC;                      -- WE3 (Enable)
        ReadRegisterOne : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- A1
        ReadRegisterTwo : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- A2
        WriteRegister   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- A3
        WriteData       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); -- WriteData
        ReadDataOne     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- RD1
        ReadDataTwo     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  -- RD2
    );
END COMPONENT;
-- =========================================


-- ============ ProgramCounter ==============
COMPONENT ProgramCounter IS
	PORT(
        clk, reset   : IN STD_LOGIC;
		Input        : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        Output       : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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
		clk, reset              : IN STD_LOGIC;
		PCSrouce                : IN STD_LOGIC;
		BypassMemory, Jump      : IN STD_LOGIC;
		RegisteryWriteEnable    : IN STD_LOGIC;
        RegisteryDistination    : IN STD_LOGIC;
		ALUSource               : IN STD_LOGIC;
        ALUControl              : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ReadData, Instruction   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

		-- Ouputs
		Zero_Flag	            : OUT STD_LOGIC;
		PC			            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALUOutput	            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		WriteData	            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)	
	);
END COMPONENT; 
-- ==========================================


-- ================== MIPS ==================
COMPONENT MIPS IS
    PORT(
        ALUOutput, WriteData, PC    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Instruction, ReadData       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable       : OUT STD_LOGIC;
        clk, reset                  : IN STD_LOGIC
    );
END COMPONENT; 
-- ==========================================


-- ================== TopLevel ==================
COMPONENT TopLevel IS
    PORT(
        clk, reset                  : IN STD_LOGIC;
        WriteData, ALUOutput, PC    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        MemoryReadWriteEnable       : OUT STD_LOGIC
    );
END COMPONENT; 
-- ==========================================


END packages;

