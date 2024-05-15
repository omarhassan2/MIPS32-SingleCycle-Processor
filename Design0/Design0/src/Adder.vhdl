-- =====================================================================
-- @File Name: Adder.vhd
-- @Author: Mohamed Gehad (ENGMGehad@gmail.com)
--
-- @Description: 
--      - Adder is a module that performs addition on two input vectors.
--      - It operates on fixed-size vectors and produces the sum as output.
--      - The module is parameterized with the vector size (N).
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
ENTITY Adder IS
    PORT(
        IN0, IN1    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        Output      : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END Adder;
-- ==========================================



-- =========== Architectures Section ===========
ARCHITECTURE Arch_Adder OF Adder IS
BEGIN
    Output <= IN0 + IN1;
END Arch_Adder;
-- =============================================