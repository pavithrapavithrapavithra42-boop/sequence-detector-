# 1011 Sequence Detector using Verilog HDL

## Overview

This project implements a **1011 sequence detector** using Verilog HDL.

The circuit monitors a serial input stream and detects the sequence:

```text
1011
```

When the complete sequence is detected, the output `detected` becomes `1` for one clock cycle.

This implementation uses a **Mealy Finite State Machine (FSM)** and supports **overlapping sequences**.

## Inputs

- `clk` - Clock signal
- `reset` - Active-high reset
- `din` - Serial data input

## Output

- `detected` - Becomes `1` when the sequence `1011` is detected

## State Sequence

```text
S0 → S1 → S2 → S3 → S0
```

Where:

- S0: No matching bits
- S1: Detected `1`
- S2: Detected `10`
- S3: Detected `101`
- S0: After detecting `1011`

## Example

For the input:

```text
1101011011
```

The sequence `1011` is detected whenever the last four received bits are `1011`.

## Project Files

| File | Description |
|------|-------------|
| `sequence_detector.v` | Main Verilog design |
| `sequence_detector_tb.v` | Testbench |
| `simulation_output.png` | Simulation waveform |
| `README.md` | Project documentation |

## Software Used

- Verilog HDL
- ModelSim / QuestaSim
- Vivado Simulator

## Expected Result

The `detected` output becomes `1` for one clock cycle whenever the input sequence `1011` is detected.

## Author

Your Name

B.Tech - Electronics and Communication Engineering
