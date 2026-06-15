# 8-Bit ALU (Arithmetic Logic Unit)

An 8-bit Arithmetic Logic Unit implemented in Verilog. Supports addition, subtraction, logical operations (AND, OR, XOR, NOT), and shift operations (SHL, SHR).
## SCHEMATIC & DEVICE
<img width="1360" height="717" alt="schematic png" src="https://github.com/user-attachments/assets/2745259c-0b45-479e-aae4-6d0d83334a78" />


<img width="650" height="436" alt="device png" src="https://github.com/user-attachments/assets/69c5561e-44b6-4502-91c6-544e60c33dae" />
## Block Diagram
<img width="1359" height="719" alt="add png" src="https://github.com/user-attachments/assets/309cfda2-3eff-4ed0-af9f-affc9cd5a8b8" />
<img width="1352" height="645" alt="and_gate png" src="https://github.com/user-attachments/assets/60c1e428-e6c3-42a5-8c7d-143e2aaa7ffe" />
<img width="1365" height="717" alt="or_gate png" src="https://github.com/user-attachments/assets/6af4e9ad-fd7b-4067-ae51-c4935a6da1bd" />
<img width="1363" height="717" alt="subtract png" src="https://github.com/user-attachments/assets/9655e47b-fcb2-4e3f-9dea-606e9201c014" />

## Features
- **Operations** (controlled by 3-bit SEL):
  - `000` : Addition (A + B) with Carry
  - `001` : Subtraction (A - B) with Borrow
  - `010` : Bitwise AND
  - `011` : Bitwise OR
  - `100` : Bitwise XOR
  - `101` : Bitwise NOT (on A)
  - `110` : Logical Shift Left (A << 1)
  - `111` : Logical Shift Right (A >> 1)

- Outputs: 8-bit Result, Carry/Borrow flag, Zero flag
- Modular design with separate modules for each component
- Comprehensive testbench with detailed simulation results

## Project Structure
8_bit_ALU/
├── 8_bit-alu/
│   ├── alu/                 
│   ├── adder.v
│   ├── alu_tb.v
│   ├── alu_top.v
│   ├── and_gate.v
│   ├── not_gate.v
│   ├── or_gate.v
│   ├── shifter.v
│   ├── subtractor.v
│   └── xor_gate.v 
└── readme.md 
## Waveform Simulation
add_simulation
<img width="1365" height="714" alt="add_gate_sim png" src="https://github.com/user-attachments/assets/83fcf633-8256-480b-bd49-3ee811ed40fb" />
subtract_simulation
<img width="1364" height="705" alt="subtract_sim png" src="https://github.com/user-attachments/assets/0e25ef48-ea69-49e7-ba84-dbe00e0c6a72" />
left_shift_simulation
<img width="1354" height="710" alt="shift-left_sim png" src="https://github.com/user-attachments/assets/75be5a72-2da2-4633-9218-f2920ed3224e" />
right_shift_simulation
<img width="1364" height="713" alt="shift-right-sim png" src="https://github.com/user-attachments/assets/a793a4cc-f4c4-4792-a34d-17c04ad18db6" />
and_gate_simulation
<img width="1352" height="710" alt="and_gate_sim png" src="https://github.com/user-attachments/assets/8edd46cc-991c-421a-ae71-4d900161e168" />
not_gate_simulation
<img width="1356" height="713" alt="not_gate_sim png" src="https://github.com/user-attachments/assets/d9ddeb49-2be6-49ae-855b-d8fc387551fd" />
or_gate_simulation
<img width="1360" height="710" alt="or_gate_sim png" src="https://github.com/user-attachments/assets/5b8674f1-6ecd-4711-b533-3c9efad3a3cc" />
xor_gate_simulation
<img width="1355" height="706" alt="xor_gate_sim png" src="https://github.com/user-attachments/assets/f5b373a9-d71c-443e-8db8-efe0f87b7dc6" />
## Project Summary
<img width="1350" height="717" alt="project_summary_1 png" src="https://github.com/user-attachments/assets/98998c5b-08d1-4d29-bbdc-296c03e4ba96" />
<img width="1365" height="708" alt="project_summary_2 png" src="https://github.com/user-attachments/assets/087acb3a-a37b-4586-8f90-a65661a7d412" />
## Power Report
<img width="1360" height="711" alt="power_report png" src="https://github.com/user-attachments/assets/faed8b09-6d0f-4c2e-925b-b3b89038d51c" />
## Utilization Report
<img width="1357" height="721" alt="utilization_report png" src="https://github.com/user-attachments/assets/fb6afd93-b3bf-49c9-8c5e-e70e97d26694" />
## Technologies
Language: Verilog HDL
Tools: Icarus Verilog, vivado
Target: FPGA / ASIC synthesis

## Future Improvements
Add more operations (e.g., multiply, rotate, arithmetic shift)
Implement control signals for signed operations
Add overflow detection
Create a synthesizable top module with clocked design
FPGA implementation (Vivado / Quartus)

# Author
Vaibhav Shromani
