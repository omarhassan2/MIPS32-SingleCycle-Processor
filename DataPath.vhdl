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
		clk, reset: in STD_LOGIC;

		-- Control
		RegisteryWriteEnable, RegisteryDistination, 
		ALUSource, Branch, MemoryReadWriteEnable, 
		BypassMemory, Jump : OUT STD_LOGIC;
        ALUControl : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		OPCode, Funct : IN STD_LOGIC_VECTOR(5 DOWNTO 0);

		

	);
END DataPath; 
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_DataPath OF DataPath IS
	BEGIN 
		
END Arch_DataPath;
-- =============================================