# single_cycle_risc_v_core
Single-cycle RISC-V processor implemented in SystemVerilog with simulation and verification in Xilinx Vivado.

A 32-bit **Single-Cycle RISC-V Processor** designed and implemented in **SystemVerilog**, simulated and verified using **Xilinx Vivado**. The processor follows a Harvard architecture and executes each instruction in a single clock cycle (CPI = 1).

## Overview

This project demonstrates the complete RTL implementation of a single-cycle RISC-V CPU, including the datapath, control unit, memory modules, and verification testbench. The design provides a practical understanding of processor architecture, digital logic design, and RTL development.

## Features

- 32-bit RISC-V Processor
- Single-cycle execution (CPI = 1)
- Harvard Architecture
- RTL implementation in SystemVerilog
- Functional simulation using Xilinx Vivado
- Modular and reusable hardware design
- Behavioral testbench for verification

---

## Processor Architecture

The processor consists of the following modules:

- Program Counter (PC)
- Instruction Memory (ROM)
- Register File (32 Registers)
- Immediate Generator (Sign Extender)
- Arithmetic Logic Unit (ALU)
- Data Memory (RAM)
- Control Unit
- Adders
- Multiplexers
- Datapath
- Top-Level Processor Wrapper

---

## Supported RISC-V Instructions

### R-Type
- ADD
- SUB
- AND
- OR
- XOR
- SLL
- SRL

### I-Type
- ADDI
- ANDI
- ORI
- XORI
- SLLI
- SRLI

### Load/Store
- LW
- SW

### Branch
- BEQ

### Jump
- JAL

---

## Project Structure

```
├── rtl/
│   ├── mux.sv
│   ├── adder.sv
│   ├── program_counter.sv
│   ├── instruction_memory.sv
│   ├── register_file.sv
│   ├── extend.sv
│   ├── alu.sv
│   ├── data_memory.sv
│   ├── control_unit.sv
│   ├── datapath.sv
│   └── riscv_single_cycle.sv
│
├── testbench/
│   └── riscv_tb.sv
│
├── program.txt
│
├── report.pdf
│
└── README.md
```

---

## Development Tools

- **Language:** SystemVerilog
- **Simulation:** Xilinx Vivado
- **Architecture:** RISC-V RV32I (Single-Cycle)

---

## Verification

The processor was verified using a behavioral SystemVerilog testbench. Simulation confirms:

- Correct instruction fetch
- Register read/write operations
- ALU functionality
- Load and store operations
- Branch decision logic
- Jump execution
- Program Counter updates

---

## Future Improvements

- Five-stage pipelined RISC-V processor
- Hazard Detection Unit
- Forwarding Unit
- Branch Prediction
- Cache Memory
- Support for additional RV32I instructions
- FPGA implementation

---

## Learning Outcomes

This project strengthened practical knowledge in:

- Computer Architecture
- RISC-V ISA
- RTL Design
- Digital Logic Design
- SystemVerilog
- Processor Datapath Design
- Control Unit Design
- Hardware Verification
- FPGA Development Workflow

---

## Author

**Saif Ullah**

Electrical Engineering Undergraduate

GitHub: [*GitHub profile link here*](https://github.com/engr-saifullah/)

LinkedIn: www.linkedin.com/in/saif-ullah-95647431a

---

## License

This project is released under the MIT License.
