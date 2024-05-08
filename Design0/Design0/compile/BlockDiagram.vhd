---------------------------------------------------------------------------------------------------
--
-- Title       : BlockDiagram
-- Design      : Design0
-- Author      : Omar Hassan
-- Company     : Lenvo ideapad 5
--
---------------------------------------------------------------------------------------------------
--
-- File        : d:\CSE_2_Term__2\Hardware Design\Project\MIPS32-SingleCycle-Processor\Design0\Design0\compile\BlockDiagram.vhd
-- Generated   : Wed May  8 02:45:39 2024
-- From        : d:\CSE_2_Term__2\Hardware Design\Project\MIPS32-SingleCycle-Processor\Design0\Design0\src\BlockDiagram.bde
-- By          : Bde2Vhdl ver. 2.6
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity BlockDiagram is
  port(
       Input0 : in STD_LOGIC;
       Input1 : in STD_LOGIC;
       Input2 : in STD_LOGIC
  );
end BlockDiagram;

architecture BlockDiagram of BlockDiagram is

---- Component declarations -----

component ControlUnit
  port (
       Funct : in STD_LOGIC_VECTOR(5 downto 0);
       OPCode : in STD_LOGIC_VECTOR(5 downto 0);
       ALUControl : out STD_LOGIC_VECTOR(3 downto 0);
       ALUSource : out STD_LOGIC;
       Branch : out STD_LOGIC;
       BypassMemory : out STD_LOGIC;
       Jump : out STD_LOGIC;
       MemoryReadWriteEnable : out STD_LOGIC;
       RegisteryDistination : out STD_LOGIC;
       RegisteryWriteEnable : out STD_LOGIC
  );
end component;
component DataMemory
  port (
       Address : in STD_LOGIC_VECTOR(31 downto 0);
       WriteData : in STD_LOGIC_VECTOR(31 downto 0);
       WriteEnable : in STD_LOGIC;
       clk : in STD_LOGIC;
       ReadData : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component datapath
  port (
       ALUControl : in STD_LOGIC_VECTOR(3 downto 0);
       ALUSource : in STD_LOGIC;
       BypassMemory : in STD_LOGIC;
       Instruction : in STD_LOGIC_VECTOR(31 downto 0);
       Jump : in STD_LOGIC;
       PCSrouce : in STD_LOGIC;
       ReadData : in STD_LOGIC_VECTOR(31 downto 0);
       RegisteryDistination : in STD_LOGIC;
       RegisteryWriteEnable : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       ALU_Output : buffer STD_LOGIC_VECTOR(31 downto 0);
       PC : buffer STD_LOGIC_VECTOR(31 downto 0);
       WriteData : buffer STD_LOGIC_VECTOR(31 downto 0);
       Zero_Flag : buffer STD_LOGIC
  );
end component;
component InstructionMemory
  port (
       Address : in STD_LOGIC_VECTOR(31 downto 0);
       INstruction : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1895 : STD_LOGIC;
signal NET226 : STD_LOGIC;
signal NET230 : STD_LOGIC;
signal NET272 : STD_LOGIC;
signal NET276 : STD_LOGIC;
signal NET412 : STD_LOGIC;
signal NET416 : STD_LOGIC;
signal NET448 : STD_LOGIC;
signal NET452 : STD_LOGIC;
signal BUS166 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1740 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS1748 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS1752 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS2106 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS3904 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : ControlUnit
  port map(
       ALUControl => BUS166,
       ALUSource => NET416,
       Branch => NET276,
       BypassMemory => NET412,
       Funct(0) => BUS3904(26),
       Funct(1) => BUS3904(27),
       Funct(2) => BUS3904(28),
       Funct(3) => BUS3904(29),
       Funct(4) => BUS3904(30),
       Funct(5) => BUS3904(31),
       Jump => NET226,
       MemoryReadWriteEnable => NET452,
       OPCode(0) => BUS3904(26),
       OPCode(1) => BUS3904(27),
       OPCode(2) => BUS3904(28),
       OPCode(3) => BUS3904(29),
       OPCode(4) => BUS3904(30),
       OPCode(5) => BUS3904(31),
       RegisteryDistination => NET448,
       RegisteryWriteEnable => NET1895
  );

U2 : datapath
  port map(
       ALUControl => BUS166,
       ALUSource => NET416,
       ALU_Output => BUS1748,
       BypassMemory => NET412,
       Instruction => BUS3904,
       Jump => NET226,
       PC => BUS1740,
       PCSrouce => NET272,
       ReadData => BUS2106,
       RegisteryDistination => NET448,
       RegisteryWriteEnable => NET452,
       WriteData => BUS1752,
       Zero_Flag => NET230,
       clk => Input0,
       reset => Input1
  );

NET272 <= NET230 and NET276;

U4 : InstructionMemory
  port map(
       Address => BUS1740,
       INstruction => BUS3904
  );

U5 : DataMemory
  port map(
       Address => BUS1748,
       ReadData => BUS2106,
       WriteData => BUS1752,
       WriteEnable => NET1895,
       clk => Input2
  );


end BlockDiagram;
