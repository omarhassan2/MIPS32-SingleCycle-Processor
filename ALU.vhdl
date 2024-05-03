-- =====================================================================
-- File Name: ALU.vhd
-- Author(s): hassan alzyat(hassanalzyatcse2022@gmail.com)
-- Description: The ALU (Arithmetic Logic Unit) is a crucial component of the MIPS processor. 
--It performs arithmetic, logical, and comparison operations on binary
-- data using fixed-size registers. The ALU executes operations such as addition, subtraction,, bitwise logical operations
--. It also sets zero flag  status flags to indicate the outcome of the operation. 

-- Revision History:
--   -<da te>: <description of changes> (optional, for major updates)
-- =====================================================================





library	 ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

entity ALU is 
	port(
			Alu_Input_One : in  std_logic_vector(31 downto 0); 
			Alu_Input_Two : in  std_logic_vector(31 downto 0); 
			Alu_Control   : in  std_logic_vector(3 downto 0);
			Alu_Output    : out std_logic_vector(31 downto 0);
			zero_Flag     : out std_logic
	);
	
end entity ;	

architecture Behave_Of_ALU of ALU is
	signal  Alu_Output_Signal : std_logic_vector(31 downto 0);
begin 		 
	
	Alu_Process :process(Alu_Input_One,Alu_Input_Two,Alu_Control)	 
			begin		
				case  Alu_Control is 
					when "0000"=>	 
						Alu_Output_Signal <=  Alu_Input_One and  Alu_Input_Two;	   
					when "0001"=>	 
						Alu_Output_Signal <=  Alu_Input_One or  Alu_Input_Two;
					when "0010"=>	 
						Alu_Output_Signal <=  Alu_Input_One +  Alu_Input_Two;
					when "0110"=>	 
						Alu_Output_Signal <=  Alu_Input_One -  Alu_Input_Two;	   
					when "0111"=>	  
						if(Alu_Input_One <Alu_Input_Two) then 
							Alu_Output_Signal<=x"00000001"	;
						else 
						   Alu_Output_Signal<=x"00000000"	;
							 end if;
					when "1100"=>	 
						Alu_Output_Signal <=  Alu_Input_One nor Alu_Input_Two;
					when others=>	 
						Alu_Output_Signal <= x"00000000";  
					
					
						end case;
			
		
		end process;		   
		Alu_Output <=Alu_Output_Signal;
		zero_Flag <= '1' when Alu_Output_Signal = x"00000000"else '0';
										   
end architecture ;
	





