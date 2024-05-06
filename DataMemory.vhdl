-- =====================================================================
-- @File Name: DataMemory.vhd
-- @Author: Mohamed Gehad (ENGMGehad@gmail.com)
-- 
-- @Description: 
--		- DataMemory IS a module that represents a memory unit. 
-- 		- It stores data IN a fixed-size array OF regISters. 
-- 		- The module ALLows readINg and writINg data based on the provided address. 
-- 		- It operates synchronously with the clock SIGNAL.
--
-- @RevISion HIStory: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY DataMemory IS
	GENERIC(N: INteger:= 32);
	PORT (
		clk,MemRead,MemWrite: IN std_logic;
		Address,WriteData: IN std_logic_vector(N-1 DOWNTO 0);
		ReadData: OUT std_logic_vector(N-1 DOWNTO 0)
	);
END DataMemory;
-- ==========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE arch OF DataMemory IS
	type memory IS array(15 DOWNTO 0) OF std_logic_vector(31 DOWNTO 0);
	SIGNAL DataMem: memory:=(
		X"00000088", X"00000000", X"00000044", X"00000033",
		X"00000000", X"000000AA", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"000000BB", X"00000000"
	);
BEGIN
	PROCESS(clk)
	BEGIN
		IF (rISINg_edge(clk)) THEN
			IF (MemRead = '1') THEN 
				ReadData <= DataMem(TO_INTEGER(UNSIGNED(Address)));
			END IF;
			IF (MemWrite = '1') THEN
				DataMem(TO_INTEGER(UNSIGNED(Address))) <= WriteData;
			END IF;	  
		END IF;
	END PROCESS;
END arch;
-- =============================================		