-- =====================================================================
-- File Name: instractionMemory.vhd
-- Author: Shehap Shukri ghzal (sh.s.ghazal2003.com)
-- Description :
-- Instruction memory stores machine instructions for CPU execution in a computer system
-- Instruction memory is vital for program execution efficiency and system responsiveness
-- Instruction memory design focuses on speed optimization techniques like caching and prefetching
-- =====================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionMemory is
    Port (
           Address       : in  std_logic_vector(31 downto 0);
           Instruction   : out std_logic_vector(31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type memory is array (0 to 1023) of std_logic_vector(31 downto 0);
    signal Memory: memory := (
 
     -- We can write the instruction here.... 
     -- but i  will be initialize the value with zeros ....

     others => (others => '0')
    
     );
begin 
            Instruction <= Memory(to_integer(unsigned(Address)));

end Behavioral;