-- =====================================================================
-- @File Name: ShiftLeft2.vhdl
-- @Author: Omar Hassan (engomar625@gmail.com)
-- 
-- @Description: 
--		- When we use J-Type to make the PC jump to another address.
--      - Equation : PC' = PC + 4 + (signExtend * 4).
--      - So to multiple signExtend with 4 we use ShiftLeft2(<<2 = *4)
--
-- @Revision History: 4-5-2024
-- =====================================================================



-- =========== Libraries Section ===========
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- =========================================



-- =========== Entities Section =============
ENTITY ShiftLeft2 IS
	PORT(
		input  : in  std_logic_vector(31 downto 0);
        output : out std_logic_vector(31 downto 0)
	);
END ShiftLeft2; 
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_ShiftLeft2 OF ShiftLeft2 IS
BEGIN 
	output <= std_logic_vector(unsigned(input) sll 2);
END Arch_ShiftLeft2;
-- =============================================