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
    GENERIC(N: INteger:= 32);
	PORT(
		sl: IN std_logic;
		IN0,IN1: IN std_logic_vector(N-1 DOWNTO 0);
		OUTput: OUT std_logic_vector(N-1 DOWNTO 0)
	);
END component;
-- ====================================


-- ============== Adder ===============
component Adder IS
    GENERIC(N: INteger:= 32);
    PORT(
        IN0, IN1: IN  std_logic_vector(N-1 DOWNTO 0);
        OUTput:   OUT std_logic_vector(N-1 DOWNTO 0)
    );
END component;
-- ====================================


-- =========== DataMemory ============
component DataMemory IS
    GENERIC(N: INteger:= 32);
    PORT (
        clk,MemRead,MemWrite: IN std_logic;
        Address,WriteData: IN std_logic_vector(N-1 DOWNTO 0);
        ReadData: OUT std_logic_vector(N-1 DOWNTO 0)
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
		Alu_INput_One : IN  std_logic_vector(31 DOWNTO 0); 
		Alu_INput_Two : IN  std_logic_vector(31 DOWNTO 0); 
		Alu_Control   : IN  std_logic_vector(3 DOWNTO 0);
		Alu_OUTput    : OUT std_logic_vector(31 DOWNTO 0);
		zero_Flag     : OUT std_logic
	);
END component;
-- =========================================


-- =========== RegISterFiles ===============
component RegISterFiles IS
    GENERIC (
        NumberOFBit : INTEGER := 32;
        NumberOFAddressBit : INTEGER := 5
    );
    PORT (
        RegWrite : IN STD_LOGIC;
        ReadRegISterOne : IN  STD_LOGIC_VECTOR(NumberOFAddressBit - 1 DOWNTO 0);
        ReadRegISterTwo : IN  STD_LOGIC_VECTOR(NumberOFAddressBit - 1 DOWNTO 0);
        WriteRegISter   : IN  STD_LOGIC_VECTOR(NumberOFAddressBit - 1 DOWNTO 0);
        WriteData       : IN  STD_LOGIC_VECTOR(NumberOFBit - 1 DOWNTO 0);
        ReadDataOne     : OUT STD_LOGIC_VECTOR(NumberOFBit - 1 DOWNTO 0);
        ReadDataTwo     : OUT STD_LOGIC_VECTOR(NumberOFBit - 1 DOWNTO 0)
    );
END component;
-- =========================================


-- ============ ProgramCounter ==============
component ProgramCounter IS
    GENERIC(N: Integer:= 32);
	PORT(
        clk,reset : in  std_logic;
		input     : in  std_logic_vector(31 downto 0);
        output    : out std_logic_vector(31 downto 0)
	);
END component; 
-- ==========================================