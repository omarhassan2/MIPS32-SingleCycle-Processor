-- =====================================================================
-- @File Name: Adder.vhd
-- @Author: Mohamed Gehad (ENGMGehad@gmail.com)
--
-- @Description: 
--      - Adder IS a module that performs addition on two INput vectors.
--      - It operates on fixed-size vectors and produces the sum as OUTput.
--      - The module IS parameterized with the vector size (N).
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
ENTITY Adder IS
    PORT(
        IN0, IN1: IN  std_logic_vector(31 DOWNTO 0);
        OUTput:   OUT std_logic_vector(31 DOWNTO 0)
    );
END Adder;
-- ==========================================



-- =========== ARCHITECTUREs Section ===========
ARCHITECTURE Arch_Adder OF Adder IS
BEGIN
    OUTput <= IN0 + IN1;
END Arch_Adder;
-- =============================================