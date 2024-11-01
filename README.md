# ARC-Ejercicios

Se usa [arktools](https://academicos.azc.uam.mx/oan/linux/arctools.html) para correr los ejercicios.

# ARCTools User Manual

## ARC Instructions Supported (Version 2.0.3)

| Instruction            | Type               | Description                                 |
|------------------------|--------------------|---------------------------------------------|
| **ADD**                | Arithmetic         | Add                                         |
| **ADDCC**              |                    | Add with Condition Codes                    |
| **SUB**                |                    | Subtract                                    |
| **SUBCC**              |                    | Subtract with Condition Codes               |
| **SETHI**              |                    | Set High Immediate                          |
| **AND**                | Logical            | Logical AND                                 |
| **ANDN**               |                    | Logical AND NOT                             |
| **OR**                 |                    | Logical OR                                  |
| **ORN**                |                    | Logical OR NOT                              |
| **XOR**                |                    | Exclusive OR                                |
| **XNOR**               |                    | Exclusive NOR                               |
| **ANDCC**              |                    | AND with Condition Codes                    |
| **ANDNCC**             |                    | AND NOT with Condition Codes                |
| **ORCC**               |                    | OR with Condition Codes                     |
| **ORNCC**              |                    | OR NOT with Condition Codes                 |
| **XORCC**              |                    | XOR with Condition Codes                    |
| **XNORCC**             |                    | XNOR with Condition Codes                   |
| **BA**                 | Branch             | Branch Always                               |
| **BN**                 |                    | Branch Never                                |
| **BNE**                |                    | Branch if Not Equal                         |
| **BE**                 |                    | Branch if Equal                             |
| **BG**                 |                    | Branch if Greater                           |
| **BLE**                |                    | Branch if Less or Equal                     |
| **BGE**                |                    | Branch if Greater or Equal                  |
| **BL**                 |                    | Branch if Less                              |
| **BGU**                |                    | Branch if Greater Unsigned                  |
| **BLEU**               |                    | Branch if Less or Equal Unsigned            |
| **BCC**                |                    | Branch if Carry Clear                       |
| **BCS**                |                    | Branch if Carry Set                         |
| **BPOS**               |                    | Branch if Positive                          |
| **BNEG**               |                    | Branch if Negative                          |
| **BVC**                |                    | Branch if Overflow Clear                    |
| **BVS**                |                    | Branch if Overflow Set                      |
| **CALL**               | Control            | Call a Subroutine                           |
| **JMPL**               |                    | Jump and Link                               |
| **RETT**               |                    | Return from Trap                            |
| **TA**                 |                    | Trap Always                                 |
| **LD**                 | Memory             | Load Word                                   |
| **LDSB**               |                    | Load Signed Byte                            |
| **LDSH**               |                    | Load Signed Halfword                        |
| **LDUB**               |                    | Load Unsigned Byte                          |
| **LDUH**               |                    | Load Unsigned Halfword                      |
| **ST**                 |                    | Store Word                                  |
| **STB**                |                    | Store Byte                                  |
| **STH**                |                    | Store Halfword                              |
| **SRL**                | Shift              | Shift Right Logical                         |
| **SLL**                |                    | Shift Left Logical                          |
| **SRA**                |                    | Shift Right Arithmetic                      |
| **RD**                 | I/O                | Read                                        |
| **WR**                 |                    | Write                                       |


### Synthetic Instructions
The following synthetic instructions are also supported:

| Synthetic Instruction | Instruction Generated        | Comment                   |
|-----------------------|------------------------------|---------------------------|
| `not rs1, rd`        | `xnor rs1, %r0, rd`          | 1's complement            |
| `neg rs2, rd`        | `sub %r0, rs2, rd`           | 2's complement            |
| `inc rd`             | `add rd, 1, rd`              | Increment by 1            |
| `dec rd`             | `sub rd, 1, rd`              | Decrement by 1            |
| `clr rd`             | `and rd, %r0, rd`            | Clear a register          |
| `cmp rs1, reg_or_imm`| `subcc rs1, reg_or_imm, %r0` | Compare, set condition codes |
| `tst rs2`            | `orcc %r0, rs2, %r0`         | Test                      |
| `mov reg_or_imm, rd` | `or %r0, reg_or_imm, rd`     | Move a value              |

---

For more details on using these instructions, refer to the full ARCTools documentation.


## Contents
1. [Introduction](#introduction)
2. [Launching ARCTools](#launching-arctools)
3. [Buttons and Controls](#buttons-and-controls)
4. [Introduction to TimeModel](#introduction-to-timemodel)
5. [TimeModel Statistics](#timemodel-statistics)

### 1.0 Introduction
ARCTools is an assembly language simulator for the ARC language, similar to SPARC assembly. It includes an assembler, a simulator, and a TimeModel component for timing simulations and cache analysis.

### 2.0 Launching ARCTools
Refer to `README-FIRST.txt` for instructions. The main interface, the ARC Simulator window, allows you to create, edit, and load ARC assembly programs.

#### 2.1 Creating/Opening ARC Assembly Programs
- **New Program**: Click 'Edit' in the ARC Simulator to open the ASM Edit Window and write your ARC code.
- **Open Existing**: Use 'File > Open' in ASM Edit to load `.asm` files.
- **Load Pre-Assembled Program**: Click 'Load' in ARC Simulator to select a `.bin` file.

#### 2.2 Assembling ARC Programs
Assemble programs in the ASM Edit window with the 'Assemble' button. Successful assembly generates `.lst` (listing) and `.bin` (binary) files, accessible via buttons in the window.

#### 2.3 Simulating ARC Programs
After assembling, load the program into the ARC Simulator with 'Bin->Sim'. Use 'Step' to execute line-by-line or 'Run' for continuous simulation. The simulator stops at breakpoints, 'halt' instructions, or errors.

### 3.0 Buttons and Controls
- **Register Panel**: Displays registers, flags, and values, all editable when stopped.
- **Button Panel**: Includes simulation controls (`Run`, `Step`, `Stop`, etc.) and tools for clearing registers/memory, printing, and loading files.
- **Machine Execution Viewer**: Shows program instructions and allows breakpoint setting.
- **Memory Viewer**: Displays memory in a 4x4 grid and enables manual editing and navigation.

### 4.0 Introduction to TimeModel
TimeModel extends ARCTools by simulating execution timing and cache operations. It includes a configuration editor and a statistics window.

#### 4.1 Launching TimeModel
Open TimeModel's configuration with 'Time Model Editor' and view timing statistics with 'Timing Statistics'.

#### 4.2 The TimeModel Editor
Allows configuration of clock frequency, instruction timing, and memory/IO settings, which must be applied to take effect in simulations.

#### 4.3-4.6 Configurations
- **Clock Frequency/Period**: Syncs based on chosen frequency/period.
- **Instruction Timing**: Configures execution cycles for instruction categories.
- **Shift Instructions**: Allows variable timing based on shifts.
- **Memory / IO Parameters**: Configure main memory, I/O timing, and L1/L2 cache parameters.

### 5.0 TimeModel's Statistics Window
Displays execution statistics, L1/L2 cache views, and a log history of recent instructions. The cache simulator offers detailed analysis on cache hits, misses, and overall performance.

---

## Authors
Ross Zwisler, Shane Neuville, Vincent P. Heuring, and Michael Wilson  
Department of Electrical and Computer Engineering  
University of Colorado-Boulder, Boulder CO 80309-0425  