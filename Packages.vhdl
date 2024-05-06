-- =====================================================================
-- @File Name: Packages.vhdl
-- @Author: Omar Hassan (engomar625@gmail.com)
-- 
-- @Description: 
--		- This file contains all components in this workspcae.
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



-- =========== ShiftLeft2 =============
component ShiftLeft2 IS
    PORT(
        input : in std_logic_vector(31 downto 0);
        output: out std_logic_vector(31 downto 0)
    );
END component;
-- ====================================


-- =========== SignExtender ==========
component SignExtender IS
    PORT(
        input  : IN   std_logic_vector(15 DOWNTO 0); 
		output : OUT  std_logic_vector(31 DOWNTO 0)
    );
END component;
-- ====================================


-- =========== Multiplexer ============
component Multiplexer IS
	PORT(
		Selector: IN std_logic;
		IN0,IN1: IN std_logic_vector(31 DOWNTO 0);
		OUTput: OUT std_logic_vector(31 DOWNTO 0)
	);
END component;
-- ====================================


-- ============== Adder ===============
component Adder IS
    PORT(
        IN0, IN1: IN  std_logic_vector(31 DOWNTO 0);
        OUTput:   OUT std_logic_vector(31 DOWNTO 0)
    );
END component;
-- ====================================


-- =========== DataMemory ============
component DataMemory IS
    PORT (
        clk,WriteEnable: IN std_logic;
        Address,WriteData: IN std_logic_vector(31 DOWNTO 0);
        ReadData: OUT std_logic_vector(31 DOWNTO 0)
    );
END component;
-- ====================================


-- =========== InstructionMemory =============
component InstructionMemory IS
    PORT (
       Address       : IN  std_logic_vector(31 DOWNTO 0);
       INstruction   : OUT std_logic_vector(31 DOWNTO 0)
	);
END component;
-- =========================================


-- =================== ALU ==================
component ALU IS 
	PORT(
		ALU_Input_One : IN  std_logic_vector(31 DOWNTO 0); 
		ALU_Input_Two : IN  std_logic_vector(31 DOWNTO 0); 
		ALU_Control   : IN  std_logic_vector(3 DOWNTO 0);
		ALU_Output    : OUT std_logic_vector(31 DOWNTO 0);
		Zero_Flag     : OUT std_logic
	);
END component;
-- =========================================


-- =========== RegISterFiles ===============
component RegISterFiles IS
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
END component;
-- =========================================


-- ============ ProgramCounter ==============
component ProgramCounter IS
	PORT(
        clk,reset : in  std_logic;
		input     : in  std_logic_vector(31 downto 0);
        output    : out std_logic_vector(31 downto 0)
	);
END component; 
-- ==========================================