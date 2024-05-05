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
ENTITY RegISterFiles IS
    GENERIC (
        NumberOFBit : INTEGER := 32;
        NumberOFAddressBit : INTEGER := 5
    );
    PORT (
        ReadRegISterOne : IN STD_LOGIC_VECTOR(NumberOFAddressBit - 1 DOWNTO 0);
        ReadRegISterTwo : IN STD_LOGIC_VECTOR(NumberOFAddressBit - 1 DOWNTO 0);
        WriteRegISter : IN STD_LOGIC_VECTOR(NumberOFAddressBit - 1 DOWNTO 0);
        WriteData : IN STD_LOGIC_VECTOR(NumberOFBit - 1 DOWNTO 0);
        RegWrite : IN STD_LOGIC;
        ReadDataOne : OUT STD_LOGIC_VECTOR(NumberOFBit - 1 DOWNTO 0);
        ReadDataTwo : OUT STD_LOGIC_VECTOR(NumberOFBit - 1 DOWNTO 0)
    );
END ENTITY RegISterFiles;
-- ==========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE Arch_RegISterFiles OF RegISterFiles IS

    TYPE RegISterFileType IS ARRAY (0 TO 2 ** NumberOFAddressBit - 1) OF STD_LOGIC_VECTOR(NumberOFBit - 1 DOWNTO 0);

    SIGNAL ROM : RegISterFileType := (
        x"00000000",
        x"11111111",
        x"22222222",
        x"33333333",
        x"44444444",
        x"55555555",
        x"66666666",
        x"77777777",
        x"88888888",
        x"99999999",
        x"AAAAAAAA",
        x"BBBBBBBB",
        x"CCCCCCCC",
        x"DDDDDDDD",
        x"EEEEEEEE",
        x"FFFFFFFF",
        x"00000000",
        x"11111111",
        x"22222222",
        x"33333333",
        x"44444444",
        x"55555555",
        x"66666666",
        x"77777777",
        x"88888888",
        x"99999999",
        x"AAAAAAAA",
        x"BBBBBBBB",
        x"10008000",
        x"7FFFF1EC",
        x"EEEEEEEE",
        x"FFFFFFFF"
    );

BEGIN
    ReadDataOne <= ROM(to_INteger(unsigned(ReadRegISterOne)));
    ReadDataTwo <= ROM(to_INteger(unsigned(ReadRegISterTwo)));
    PROCESS (RegWrite)
        BEGIN
            ROM(to_INteger(unsigned(WriteRegISter))) <= WriteData;
    END PROCESS;
END Arch_RegISterFiles;
-- =========================================