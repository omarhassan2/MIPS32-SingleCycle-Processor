-- =====================================================================
-- @File Name: DataMemory.vhd
-- @Author: Mohamed Gehad (ENGMGehad@gmail.com)
-- 
-- @Description: 
--		- DataMemory is a module that represents a memory unit. 
-- 		- It stores data in a fixed-size array of registers. 
-- 		- The module allows reading and writing data based on the provided address. 
-- 		- It operates synchronously with the clock signal.
--
-- @Revision History: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY DataMemory IS
	PORT (
		clk,WriteEnable		: IN STD_LOGIC;
		Address,WriteData	: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		ReadData			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END DataMemory;
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_DataMemory OF DataMemory IS
	TYPE Memory IS ARRAY (0 to 1023) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL Data: Memory:=(
		OTHERS => X"00000000"
	);
BEGIN
	PROCESS(clk,Address)
	BEGIN
		IF (FALLING_EDGE(clk)) THEN
			IF (WriteEnable = '1') THEN 
				Data(TO_INTEGER(UNSIGNED(Address))) <= WriteData;
			ELSE
				ReadData <= Data(TO_INTEGER(UNSIGNED(Address)));	
			END IF;	 
		END IF;			
	END PROCESS; 

	END Arch_DataMemory;
-- =============================================		