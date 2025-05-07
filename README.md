# FiniteStateMachineAlu
VHDL project implementing an 8-bit Arithmetic Logic Unit (ALU) controlled by a Finite State Machine (FSM), featuring flip-flops and multiplexers. Designed for FPGA synthesis using Intel Quartus Prime, with support for simulation via ModelSim.

## ⚙️ Components Overview

### 1. **Flip-Flop (flipflop.vhd)**
- **Inputs:**
  - `D`: Data input (8-bit)
  - `clk`: Clock signal
  - `reset`: Optional reset signal
- **Output:**
  - `Q`: Stored output value
- **Function:** Stores and synchronizes data between clock cycles; used to hold operands or results.
- 3 flip flop are instantiated, two for storing the operands (a,b) and one for the result (c)

### 2. **MUX (mux.vhd)**
- **Inputs:**
  - Multiple 8-bit data inputs (e.g., `A`, `B`)
  - `sel`: Selection line 
- **Output:**
  - One selected 8-bit output
- **Function:** Routes one of the input signals to the output based on the `sel` value.


### 3. **ALU (alu.vhd)**
- **Inputs:**
  - `IN1`, `IN2`: 8-bit operands
  - `OP`: 3-bit operation selector
- **Outputs:**
  - `Result`: 8-bit result of the operation
  - `carryout`: Carry-out flag for addition/subtraction
- **Function:** Performs arithmetic and logic operations such as addition, subtraction, multiplication, division, XOR, XNOR, and comparisons.

### 4. **FSM Controller (fsm.vhd)**
- **Inputs:**
  - `clk`: Clock signal
  - `reset`: Asynchronous reset
  - Optional control or status signals from the ALU or external sources
- **Outputs:**
  - Control signals to operate ALU, MUX, or flip-flops
- **Function:** Implements a finite state machine to sequence operations or manage a datapath.
![fsm drawio](https://github.com/user-attachments/assets/add607e8-395d-4345-8fc8-90b7356d6e55)
init: All control signals are set to 0.

If acc = 0 → fetch: Update the contents of operand flip-flops A and B. Set SEL = 1 to select new operands.

If acc = 1 → accumulate: Update the content of flip-flop A. Set SEL = 0 to select the result of the previous execution as the second operand.

process → write_result: All control signals are set to 0, except for flip-flop C, which is updated with the ALU result.


### 5. **Block Diagram File (alu-controller.bdf)**
![alu](https://github.com/user-attachments/assets/8c1a3464-6775-447c-9ea4-2fc7b0974063)
- **File Type:** Quartus Block Diagram File (`.bdf`)
- **Function:** Visually connects the ALU, FSM, MUX, and flip-flops using a schematic interface in Quartus.
- **Purpose:** 
  - Acts as the **top-level design entity**.
  - Simplifies wiring and hierarchy management by allowing graphical component instantiation and signal routing.
  - Makes the design easier to understand, especially for those less familiar with HDL code.
 [alu.pdf](https://github.com/user-attachments/files/20085633/alu.pdf)

