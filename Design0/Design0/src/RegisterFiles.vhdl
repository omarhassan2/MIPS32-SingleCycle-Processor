-- =====================================================================
-- @File Name: RegISterFiles.vhd
-- @Author: Mahmoud Galal (mahmoudgalal173.95@gmail.com)
-- 
-- @Description: Briefly describe the file's functionality.
--
-- @RevISion HIStory: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY RegisterFiles IS
    PORT (
        CLK: IN STD_LOGIC;
        WriteEnable : IN STD_LOGIC; -- WE3 (Enable)
        ReadRegisterOne : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- A1
        ReadRegisterTwo : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- A2
        WriteRegister   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0); -- A3
        WriteData       : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); -- WriteData
        ReadDataOne     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- RD1
        ReadDataTwo     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  -- RD2
    );
END ENTITY RegisterFiles;
-- ==========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE Arch_RegisterFiles OF RegisterFiles IS

    TYPE RegisterFileType IS ARRAY (0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0);

    SIGNAL Registers : RegisterFileType := (
    OTHERS => X"00000000"
    );

BEGIN
    ReadDataOne <= Registers(to_INteger(unsigned(ReadRegisterOne)));
    ReadDataTwo <= Registers(to_INteger(unsigned(ReadRegisterTwo)));
    PROCESS (CLK)
        BEGIN
            IF ((rising_edge(CLK)) AND (WriteEnable = '1')) THEN
                Registers(to_INteger(unsigned(WriteRegister))) <= WriteData;
            END IF;
    END PROCESS;
END Arch_RegisterFiles;
-- =========================================