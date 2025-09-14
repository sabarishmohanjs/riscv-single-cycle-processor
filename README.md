# 🚀 RISC-V Single-Cycle Processor Implementation

Welcome to the RISC-V Single-Cycle Processor project!  
This repository contains a Verilog implementation of a basic RISC-V processor designed to execute instructions in a single clock cycle. Ideal for learning core computer architecture concepts .

---

## 🎯 Project Overview

This project demonstrates:
- Implementation of core RISC-V RV32I instructions.
- Integration of ALU, Control Unit, Register File, Data & Instruction Memory.
- Simulation-based functional verification using testbenches.
- Simple yet powerful architecture enabling quick instruction execution.

---

## 🧱 Key Features

- Program Counter (PC) and instruction fetch logic.
- Immediate Generator and ALU Control.
- Data Memory with read/write capabilities.
- Branch and Jump instruction handling.
- Single-cycle datapath architecture.
- Testbench for simulation verification.

---

## ⚡ Example Program

A simple RISC-V assembly program is included that computes the sum of the first 10 natural numbers using a loop.

---

## 📂 Repository Structure

- `riscv32_singlecycle.v` – Top module integrating the processor.
- `alu.v`, `control_unit.v`, `reg_file.v`, etc. – Core modules.
- `instruction_memory.mem` – Sample program instructions in machine code.
- `data_memory.mem` – Data memory initialization file.
- `testbench.v` – Testbench for simulation.
- `Report.pdf` – Detailed design and implementation report.

---

## 💡 Future Improvements

- Implement pipelining to improve performance by overlapping instruction execution stages.

---

## 📚 References

- Sarah Harris, *Digital Design & Computer Architecture (RISC-V Edition)*  

---

🔗 Happy Learning and Designing!
