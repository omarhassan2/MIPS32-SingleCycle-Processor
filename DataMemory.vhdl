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
	PORT (
		clk,WriteEnable: IN std_logic;
		Address,WriteData: IN std_logic_vector(31 DOWNTO 0);
		ReadData: OUT std_logic_vector(31 DOWNTO 0)
	);
END DataMemory;
-- ==========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE arch OF DataMemory IS
	type memory IS array (0 to 1023) OF std_logic_vector(31 DOWNTO 0);
	SIGNAL Data: memory:=(
		OTHERS => X"00000000"
	);
BEGIN
	PROCESS(clk,Address)
	BEGIN
		IF (falling_edge(clk)) THEN
			IF (WriteEnable = '1') THEN 
				Data(TO_INTEGER(UNSIGNED(Address))) <= WriteData;
			ELSE
				ReadData <= Data(TO_INTEGER(UNSIGNED(Address)));	
			END IF;	 
		END IF;			
	END PROCESS; 
	
	--ReadData <= Data(TO_INTEGER(UNSIGNED(Address))) WHEN WriteEnable = '0' AND TO_INTEGER(UNSIGNED(Address)) < 1023 ELSE X"00000000" ;
END arch;
-- =============================================		