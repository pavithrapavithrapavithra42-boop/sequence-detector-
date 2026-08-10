# 8-Bit ALU using Verilog HDL

## Overview

An Arithmetic Logic Unit (ALU) is a digital circuit that performs arithmetic and logical operations on binary data.

This project implements an **8-bit ALU** using Verilog HDL. The ALU takes two 8-bit inputs and performs different operations based on a 4-bit operation selector.

## Inputs

- `A[7:0]` - First 8-bit input
- `B[7:0]` - Second 8-bit input
- `ALU_Sel[3:0]` - Operation selector
- `Enable` - Enables the ALU

## Output

- `Result[7:0]` - 8-bit ALU result
- `Carry` - Carry output

## Supported Operations

| ALU_Sel | Operation | Description |
|---------|-----------|-------------|
| 0000 | ADD | A + B |
| 0001 | SUB | A - B |
| 0010 | AND | A & B |
| 0011 | OR | A \| B |
| 0100 | XOR | A ^ B |
| 0101 | NOT | ~A |
| 0110 | SHL | A << 1 |
| 0111 | SHR | A >> 1 |

## Example

If:

```text
A = 00001111
B = 00000001
```

For ADD:

```text
ALU_Sel = 0000

Result = 00010000
```

## Files Included

| File | Description |
|------|-------------|
| `alu_8bit.v` | Main ALU design |
| `alu_8bit_tb.v` | Testbench |
| `simulation_output.png` | Simulation waveform |
| `README.md` | Project documentation |

## Software Used

- Verilog HDL
- ModelSim / QuestaSim
- Vivado Simulator

## How to Run

1. Compile `alu_8bit.v`.
2. Compile `alu_8bit_tb.v`.
3. Run the simulation.
4. Add the ALU signals to the waveform.
5. Verify the output for each operation.

## Expected Result

The ALU correctly performs arithmetic and logical operations according to the selected operation code.

## Author

Your Name

B.Tech – Electronics and Communication Engineering