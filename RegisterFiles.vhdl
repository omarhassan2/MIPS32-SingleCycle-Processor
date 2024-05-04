-- =====================================================================
-- File Name: <RegisterFiles>.vhd
-- Author(s): <Mahmoud Galal> (<mahmoudgalal173.95@gmail.com>)
-- Description: Briefly describe the file's functionality.
-- Revision History:
--   - <date>: <description of changes> (optional, for major updates)
-- =====================================================================

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RegisterFiles IS
    GENERIC (
        NumberOfBit : INTEGER := 32;
        NumberOfAddressBit : INTEGER := 5
    );
    PORT (
        ReadRegisterOne : IN STD_LOGIC_VECTOR(NumberOfAddressBit - 1 DOWNTO 0);
        ReadRegisterTwo : IN STD_LOGIC_VECTOR(NumberOfAddressBit - 1 DOWNTO 0);
        WriteRegister : IN STD_LOGIC_VECTOR(NumberOfAddressBit - 1 DOWNTO 0);
        WriteData : IN STD_LOGIC_VECTOR(NumberOfBit - 1 DOWNTO 0);
        RegWrite : IN STD_LOGIC;
        ReadDataOne : OUT STD_LOGIC_VECTOR(NumberOfBit - 1 DOWNTO 0);
        ReadDataTwo : OUT STD_LOGIC_VECTOR(NumberOfBit - 1 DOWNTO 0)
    );
END ENTITY RegisterFiles;

ARCHITECTURE Arch_RegisterFiles OF RegisterFiles IS

    TYPE RegisterFileType IS ARRAY (0 TO 2 ** NumberOfAddressBit - 1) OF STD_LOGIC_VECTOR(NumberOfBit - 1 DOWNTO 0);

    SIGNAL ROM : RegisterFileType := (
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
    ReadDataOne <= ROM(to_integer(unsigned(ReadRegisterOne)));
    ReadDataTwo <= ROM(to_integer(unsigned(ReadRegisterTwo)));
    WriteProcess : PROCESS (RegWrite)
    BEGIN
        ROM(to_integer(unsigned(WriteRegister))) <= WriteData;
    END PROCESS;
END ARCHITECTURE Arch_RegisterFiles;