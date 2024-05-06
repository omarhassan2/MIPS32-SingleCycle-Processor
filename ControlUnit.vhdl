-- =====================================================================
-- File Name: ControlUnit.vhdl
-- Author(s): Karim Elghamry (kimos20139@gmail.com)
-- Description: The component that controls how the processor reacts to 
--              diffrent instruction types.
-- Revision History:
--   5/6/2024: Initial
-- =====================================================================



-- ============= Libraries Section ==============
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- ==============================================



-- ============= Entities Section ===============
ENTITY ControlUnit IS
	Generic(N: Integer:= 32);
	PORT(
		RegisteryWriteEnable, RegisteryDistination, 
        ALUSource, Branch, MemoryReadWriteEnable, 
        BypassMemory, Jump : OUT STD_LOGIC;
        ALUControl : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		OPCode, Funct : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	);
END ControlUnit; 
-- ==============================================



-- =========== Architectures Section ============
ARCHITECTURE Arch_ControlUnit OF ControlUnit IS
    SIGNAL OutputControl: STD_LOGIC_VECTOR(10 DOWNTO 0);
        BEGIN 
            PROCESS(OPCode) BEGIN
                CASE OPCode is
                    WHEN "000000" => -- R-Type Instructions (ALU)
                        CASE Funct is
                            WHEN "100000" => -- Add
                                OutputControl <= "1100000" & "0010";
                            WHEN "100010" => -- Subtract
                                OutputControl <= "1100000" & "0110";   
                            WHEN "100100" => -- AND
                                OutputControl <= "1100000" & "0000";   
                            WHEN "100101" => -- OR
                                OutputControl <= "1100000" & "0001";   
                            WHEN "101010" => -- Set Less Than (Comparator)
                                OutputControl <= "1100000" & "0111";   
                            WHEN "100111" => -- NOR
                                OutputControl <= "1100000" & "1100";   
                        END CASE;
                    WHEN "001000" => -- ADD Immediate 'Constant' to a registery (ADDI), ALU (ADD).
                        OutputControl <= "1010000" & "0010"; 
                    WHEN "001100" => -- SUBTRACT Immediate 'Constant' to a registery (SUBI), ALU (SUB).
                        OutputControl <= "1010000" & "0110"; 
                    WHEN "100011" => -- Load Instruction (LW), ALU (ADD).
                        OutputControl <= "1010010" & "0010"; 
                    WHEN "101011" => -- Store Instuction (SW), ALU (ADD).
                        OutputControl <= "0010100" & "0010";
                    WHEN "000100" => -- Branch if Equel (BEQ), ALU (SUBTRACT).
                        OutputControl <= "0001000" & "0110";
                    WHEN "000010" => -- Jump (J), ALU (DON'T CARE).
                        OutputControl <= "0001001" & "0000";
                END CASE;
            END PROCESS;

        RegisteryWriteEnable    <=      OutputControl(10);
        RegisteryDistination    <=      OutputControl(9);
        ALUSource               <=      OutputControl(8);
        Branch                  <=      OutputControl(7);
        MemoryReadWriteEnable   <=      OutputControl(6);
        BypassMemory            <=      OutputControl(5);
        Jump                    <=      OutputControl(4);
        ALUControl              <=      OutputControl(3 DOWNTO 0);
END Arch_ControlUnit;
-- ==============================================


