# Single-Cycle MIPS Processor

🚀 Welcome to the MIPS ISA 32 bit Single Cycle processor repository! 🚀

Welcome to the Single-Cycle MIPS Processor repository! This project demonstrates the design and implementation of a single-cycle MIPS (Microprocessor without Interlocked Pipeline Stages) processor. The MIPS architecture is a classic RISC (Reduced Instruction Set Computer) architecture, and this single-cycle version executes each instruction in one clock cycle.

## Table of Contents

- [Introduction](#introduction)
- [Architecture Overview](#architecture-overview)
- [Components](#components)
- [Instruction Set](#instruction-set)
- [Getting Started](#getting-started)

## Introduction

The Single-Cycle MIPS Processor project aims to provide a clear understanding of how a basic MIPS processor works. This processor is designed to execute one instruction per clock cycle, making it simpler but less efficient than multi-cycle or pipelined designs. The simplicity of the single-cycle processor makes it an excellent educational tool for learning about computer architecture.

## Architecture Overview

![ARCHITECTURE](/MIPS32-SingleCycle-Processor.png)

The single-cycle MIPS processor architecture includes the following main components:

1. **Program Counter (PC)**: Holds the address of the next instruction to be fetched.
2. **Instruction Memory**: Stores the instructions to be executed.
3. **Data Memory**: Stores data that is read and written by load and store instructions.
4. **Registers**: A set of 32 registers used for storing temporary data and performing arithmetic operations.
5. **ALU (Arithmetic Logic Unit)**: Performs arithmetic and logical operations.
6. **Control Unit**: Generates control signals based on the opcode of the instruction being executed.
7. **Muxes (Multiplexers)**: Used to select between different data sources.
8. **Sign Extender**: Extends the immediate values in instructions to 32 bits.
9. **Branch Logic**: Determines the address for branch instructions.

## TOP-VIEW

![TOP-VIEW](/MIPS%20Top%20View.png)

## Components

### 1. Program Counter (PC)
- The PC is a register that contains the address of the next instruction to be executed.
- It increments by 4 after each instruction fetch (assuming 32-bit instructions).

### 2. Instruction Memory
- A memory unit that stores the program instructions.
- Instructions are fetched based on the address provided by the PC.

### 3. Data Memory
- Used for load (read) and store (write) instructions.
- Separate from instruction memory to allow simultaneous instruction fetch and data operations.

### 4. Registers
- Contains 32 general-purpose registers (`$0` to `$31`), each 32 bits wide.
- Register `$0` is hardwired to 0.

### 5. ALU
- Performs arithmetic operations like addition, subtraction, and logical operations like AND, OR.
- Inputs are typically values from registers or immediate values.

### 6. Control Unit
- Decodes the instruction opcode.
- Generates control signals to direct the flow of data and operations in the processor.

### 7. Multiplexers
- Used to select between different inputs based on control signals.
- Critical for choosing the correct data paths.

### 8. Sign Extender
- Extends 16-bit immediate values in instructions to 32 bits for use in operations.

### 9. Branch Logic
- Evaluates branch conditions.
- Determines the next instruction address for conditional and unconditional branches.

## Instruction Set

The Single-Cycle MIPS Processor supports a subset of the MIPS instruction set, including:

- **R-type instructions**: 
    ```bash
    `add`, `sub`, `and`, `or`, `slt`, `nor` 
- **I-type instructions**:
    ```bash
    `lw`, `sw`, `beq`, `addi`, `subi`
- **J-type instructions**: 
    ```bash
    `j`

Each instruction type is encoded in a specific format, and the processor decodes and executes them in a single cycle.

## Getting Started

### Prerequisites

- Basic understanding of digital logic and computer architecture.
- Simulation software (e.g., Active-HDL ,ModelSim, Vivado) for testing the processor design.

1. **Clone the repository:**
   ```bash
   `git clone https://github.com/omarhassan2/MIPS32-SingleCycle-Processor.git`
2. **Explore the Code:** Review the VHDL code files to understand the Processor's implementation.
3. **Simulation:** USE a VHDL simulator to simulate the processor and test its functionality.
4. **integration:** Integrate the Processor into your desired hardware environment or FPGA platform.
5. **Contribute:** Feel free to contribute to the project by submitting bug fixes, improvements, or new features through pull requests.