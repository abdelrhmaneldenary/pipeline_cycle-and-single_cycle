# 16-Bit MIPS-like Processor Design

This repository contains the Verilog implementation and architectural documentation for two variants of a 16-bit RISC processor: a **Single-Cycle** implementation and a **5-Stage Pipelined** implementation.

## 🚀 Project Overview
The project implements a custom 16-bit Instruction Set Architecture (ISA) designed to perform basic arithmetic and memory operations. The processor is designed with a focus on modularity, where each component (ALU, Control Unit, Register File) is built as a standalone Verilog module.

### Architecture Specifications:
* **Word Size**: 16-bit.
* **Registers**: 8 general-purpose 16-bit registers ($R0$ to $R7$).
* **Memory**: 16-bit wide instruction and data memory.
* **Addressing**: Word-addressable (PC increments by 1).

---

## 🏗️ Implementation Variants

### 1. Single-Cycle Implementation
In this version, every instruction completes in a single clock cycle.
* **Mechanism**: The clock period is determined by the longest path (typically `LW`), ensuring all signals stabilize before the next clock edge.
* **Hardware**: Separate Instruction and Data memories are used to allow simultaneous access within one cycle.
* **Simplicity**: No need for complex hazard detection or pipeline registers.



### 2. 5-Stage Pipelined Implementation
The pipelined version increases throughput by overlapping the execution of multiple instructions.
* **Stages**:
  1. **IF (Instruction Fetch)**: Grabs the instruction from memory.
  2. **ID (Instruction Decode)**: Translates opcode and reads registers.
  3. **EX (Execute)**: Performs ALU operations or address calculation.
  4. **MEM (Memory Access)**: Reads/Writes to data memory.
  5. **WB (Write Back)**: Saves results to the register file.
* **Hazard Management**: This design uses **Software Stalling (NOPs)**. In the `instruction_memory`, three NOPs (`16'h0000`) are inserted after `LW` instructions to allow data to reach the Write-Back stage before being used by subsequent arithmetic operations.



---

## 🕹️ Instruction Set (ISA)
The processor supports R-Type and I-Type formats using 4-bit opcodes:

| Instruction | Opcode | Type | Description |
| :--- | :--- | :--- | :--- |
| **ADD** | `0000` | R | Add values of two registers |
| **OR** | `0000` | R | Bitwise OR of two registers |
| **LW** | `1000` | I | Load Word from Memory to Register |
| **SW** | `1010` | I | Store Word from Register to Memory |

---

## 🧪 Simulation and Testing
The processor was verified using a test program that manipulates Student ID data:

1. **Initialize**: Memory addresses 0 and 1 are hardcoded with Student ID parts (`0253` and `2022`).
2. **Execute**:
   - `LW` $1 and $2 with the ID parts.
   - `ADD` $3, $1, $2 (Result: `2275` hex).
   - `OR` $4, $1, $2 (Result: `2273` hex).
3. **Store**: Results are saved back to Memory addresses 5 and 7.

### Performance Note:
Due to the 3 NOPs required for data hazard safety, the pipelined implementation completes the 6-instruction test program in **10 clock cycles**.

---

## 🛠️ How to Run
1. Open the project in **Intel Quartus Prime**.
2. Compile the top-level block design file (`.bdf`).
3. Open the **University Program VWF** file to run the functional simulation.
4. Observe the `register_block` and `data_memory` signals to verify the final results (`2275` and `2273`).
