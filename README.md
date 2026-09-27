# Verilog CPU Design

A three-phase CPU design project implemented in Verilog. The project starts with core processor components, progresses into an integrated datapath, and finishes with a more complete CPU supporting control logic, memory operations, branching, and jumps.

## Project Overview

This repository documents the development of a simple processor across three phases.

### Phase 1 — Core Components
Implemented and tested the fundamental building blocks:

- 32-bit ALU
- Register file
- ALU testbench
- Register file testbench
- ModelSim waveform setup

The ALU supports arithmetic, logical, shift, comparison, and flag operations including zero, negative, carry, and overflow detection.

### Phase 2 — Integrated Datapath
Expanded the design into a working datapath by adding:

- Program Counter
- Instruction Memory
- Data Memory
- Sign Extension
- Register File integration
- ALU integration
- Basic instruction decoding
- Datapath testbench

### Phase 3 — CPU Control & Flow
Added a dedicated control unit and expanded processor functionality with:

- R-type operations
- Immediate arithmetic and logical instructions
- Load and store instructions
- Conditional branch support
- Jump support
- Write-back selection
- Program-counter control
- Integrated CPU simulation

## Repository Structure

```text
verilog-cpu-design/
├── phase-1/
│   ├── ALU.v
│   ├── RegisterFile.v
│   ├── tb_ALU.v
│   ├── tb_RegisterFile.v
│   └── waveform scripts
├── phase-2/
│   ├── ALU.v
│   ├── DataMemory.v
│   ├── Datapath.v
│   ├── InstructionMemory.v
│   ├── PC.v
│   ├── RegisterFile.v
│   ├── SignExtend.v
│   └── tb_Datapath.v
└── phase-3/
    ├── ALU.v
    ├── ControlUnit.v
    ├── DataMemory.v
    ├── Datapath.v
    ├── InstructionMemory.v
    ├── PC.v
    ├── RegisterFile.v
    ├── SignExtend.v
    └── tb_Datapath.v
```

## Technologies

- Verilog HDL
- ModelSim
- Quartus
- Digital Logic Design
- CPU Datapath Design
- RTL Simulation

## Key Concepts

- Arithmetic Logic Units
- Register Files
- Program Counters
- Instruction Decoding
- Data & Instruction Memory
- Datapath Integration
- Control Units
- Branching & Jump Logic
- RTL Testbenches
- Processor Simulation

## Running the Simulation

Compile the Verilog files for the desired phase in ModelSim or another compatible Verilog simulator. For Phase 3, use `tb_Datapath.v` as the simulation top-level testbench.

## What I Learned

This project strengthened my understanding of how processor components interact at the RTL level and how a CPU evolves from individual building blocks into an integrated datapath controlled by instruction decoding and program-flow logic.

It also provided hands-on experience with Verilog design, debugging, simulation, waveform analysis, and modular hardware development.

## Author

**Ameer Daibes**  
Computer Engineering Student — Birzeit University

[LinkedIn](https://www.linkedin.com/in/ameer-daibes-1510aa207)
