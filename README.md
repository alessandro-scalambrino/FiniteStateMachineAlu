# FiniteStateMachineAlu
A modular VHDL project implementing an 8-bit Arithmetic Logic Unit (ALU) controlled by a Finite State Machine (FSM), featuring flip-flops and multiplexers. Designed for FPGA synthesis using Intel Quartus Prime, with support for simulation via ModelSim.

## ⚙️ Components Overview

### 1. **ALU (alu.vhd)**
- **Inputs:**
  - `IN1`, `IN2`: 8-bit operands
  - `OP`: 3-bit operation selector
- **Outputs:**
  - `Result`: 8-bit result of the operation
  - `carryout`: Carry-out flag for addition/subtraction
- **Function:** Performs arithmetic and logic operations such as addition, subtraction, multiplication, division, XOR, XNOR, and comparisons.

### 2. **FSM Controller (fsm.vhd)**
- **Inputs:**
  - `clk`: Clock signal
  - `reset`: Asynchronous reset
  - Optional control or status signals from the ALU or external sources
- **Outputs:**
  - Control signals to operate ALU, MUX, or flip-flops
- **Function:** Implements a finite state machine to sequence operations or manage a datapath.

### 3. **MUX (mux.vhd)**
- **Inputs:**
  - Multiple 8-bit data inputs (e.g., `A`, `B`)
  - `sel`: Selection line (usually 1–2 bits)
- **Output:**
  - One selected 8-bit output
- **Function:** Routes one of the input signals to the output based on the `sel` value.

### 4. **Flip-Flop (flipflop.vhd)**
- **Inputs:**
  - `D`: Data input (typically 8-bit)
  - `clk`: Clock signal
  - `reset`: Optional reset signal
- **Output:**
  - `Q`: Stored output value
- **Function:** Stores and synchronizes data between clock cycles; used to hold operands or results.

### 5. **Block Diagram File (alu-controller.bdf)**
- **File Type:** Quartus Block Diagram File (`.bdf`)
- **Function:** Visually connects the ALU, FSM, MUX, and flip-flops using a schematic interface in Quartus.
- **Purpose:** 
  - Acts as the **top-level design entity**.
  - Simplifies wiring and hierarchy management by allowing graphical component instantiation and signal routing.
  - Makes the design easier to understand, especially for those less familiar with HDL code.

![alu-1](https://github.com/user-attachments/assets/1090bdd6-3a71-441c-a94d-486bcdd1afc8)

