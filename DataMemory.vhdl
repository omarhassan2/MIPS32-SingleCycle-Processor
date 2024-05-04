-- =====================================================================
-- File Name: DataMemory.vhd
-- Author: Mohamed Gehad (ENGMGehad@gmail.com)
-- Description: DataMemory is a module that represents a memory unit. 
-- It stores data in a fixed-size array of registers. The module allows 
-- reading and writing data based on the provided address. 
-- It operates synchronously with the clock signal.
-- =====================================================================




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


Entity DataMemory is
	Generic(N: integer:= 32);
	port(
		Address,WriteData: in std_logic_vector(N-1 downto 0);
		clk,MemRead,MemWrite: in std_logic;
		ReadData: out std_logic_vector(N-1 downto 0));
end DataMemory;

architecture arch of DataMemory is
	type memory is array(15 downto 0) of std_logic_vector(31 downto 0);
	signal DataMem: memory:=(
		X"00000088", X"00000000", X"00000044", X"00000033",
		X"00000000", X"000000AA", X"00000000", X"00000000",
		X"00000000", X"00000000", X"00000000", X"00000000",
		X"00000000", X"00000000", X"000000BB", X"00000000"
	);
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (MemRead = '1') then 
				ReadData <= DataMem(TO_INTEGER(UNSIGNED(Address)));
			end if;
			if (MemWrite = '1') then
				DataMem(TO_INTEGER(UNSIGNED(Address))) <= WriteData;
			end if;	  
		end if;
	end process;
end arch;
		
			