# 4-Bit Full Adder in Verilog

This project implements a **4-bit ripple-carry full adder** using modular Verilog code. The design is built using basic logic gates such as XOR and AND gates in the half adder and full adder modules.

---

## 🏗️ Module Hierarchy

```
4-bit Adder
│
├── Full Adder (4 instances)
│   ├── Half Adder (2 per Full Adder)
│   │   ├── XOR gate
│   │   └── AND gate
```

---

## 📘 Description

* **4-bit Adder**: Adds two 4-bit binary numbers (`a[3:0]` and `b[3:0]`) along with an optional carry-in (`cin`).
* **Output**: A 4-bit sum and a carry-out (`cout`).
* This adder performs **unsigned binary addition**.
* The adder is implemented using a **ripple-carry configuration** where each full adder's carry-out is passed as carry-in to the next full adder.

---

## 🔧 Modules

### ✅ Half Adder

A **half adder** adds two single-bit numbers and produces a sum and carry. It is built using:

* **XOR Gate** for the sum: `sum = a ^ b`
* **AND Gate** for the carry: `carry = a & b`

---

### ✅ Full Adder

A **full adder** adds three inputs: two single-bit numbers (`a`, `b`) and a carry-in (`cin`). It produces a sum and carry-out. It is constructed using two **half adders** and an **OR gate** to combine the carry outputs.

```verilog
sumf = a ^ b ^ cin
carryf = (a & b) | (cin & (a ^ b))
```

---

## 🔍 Truth Tables

### 1. **Half Adder Truth Table**

| a | b | sum | carry |
| - | - | --- | ----- |
| 0 | 0 | 0   | 0     |
| 0 | 1 | 1   | 0     |
| 1 | 0 | 1   | 0     |
| 1 | 1 | 0   | 1     |

### 2. **Full Adder Truth Table**

| a | b | cin | sum | carry |
| - | - | --- | --- | ----- |
| 0 | 0 | 0   | 0   | 0     |
| 0 | 0 | 1   | 1   | 0     |
| 0 | 1 | 0   | 1   | 0     |
| 0 | 1 | 1   | 0   | 1     |
| 1 | 0 | 0   | 1   | 0     |
| 1 | 0 | 1   | 0   | 1     |
| 1 | 1 | 0   | 0   | 1     |
| 1 | 1 | 1   | 1   | 1     |

### 3. **4-Bit Adder Truth Table**

| a\[3:0] | b\[3:0] | cin | sum\[3:0] | carry-out |
| ------- | ------- | --- | --------- | --------- |
| 0000    | 0000    | 0   | 0000      | 0         |
| 0001    | 0001    | 0   | 0010      | 0         |
| 0101    | 0101    | 0   | 1010      | 0         |
| 1111    | 1111    | 0   | 1110      | 1         |
| 0000    | 0001    | 1   | 0010      | 0         |
| 1111    | 1111    | 1   | 1111      | 1         |

---

## 🖼️ Circuit Diagrams

### 1. **Half Adder Circuit**

The half adder adds two bits (`a`, `b`) and generates a **sum** and **carry**. Below is the circuit diagram for the half adder:

[![Half Adder Circuit](https://drive.google.com/uc?export=view\&id=11Er2uz_8dZFsihxvfK3CqnHzF4r_8lkq)](https://drive.google.com/file/d/11Er2uz_8dZFsihxvfK3CqnHzF4r_8lkq/view?usp=sharing)

---

### 2. **Full Adder Circuit**

The full adder adds two bits (`a`, `b`) and a carry-in (`cin`) to generate a **sum** and **carry-out**. The circuit diagram for the full adder is shown below:

[![Full Adder Circuit](https://drive.google.com/uc?export=view\&id=1ewYez1KKj7E16oqAPrlZCKJiNlRBnzq8)](https://drive.google.com/file/d/1ewYez1KKj7E16oqAPrlZCKJiNlRBnzq8/view?usp=sharing)

---

### 3. **4-Bit Adder Circuit**

The 4-bit adder is created by chaining four full adders. Below is the circuit diagram for the 4-bit adder:

[![4-Bit Adder Circuit](https://drive.google.com/uc?export=view\&id=1iLeNBkEfPB_w4xf1vPDZroUPztfA0LPy)](https://drive.google.com/file/d/1iLeNBkEfPB_w4xf1vPDZroUPztfA0LPy/view?usp=sharing)

---

## 📊 Waveform Diagrams

### 1. **Full Adder Waveform**

The waveform shows the behavior of the full adder. This diagram can be used to visualize how the sum and carry-out change as the inputs (`a`, `b`, and `cin`) vary.

[![Full Adder Waveform](https://drive.google.com/uc?export=view\&id=18LGw3Ops0UM-D2LZHL33uv5-TEecCvNH)](https://drive.google.com/file/d/18LGw3Ops0UM-D2LZHL33uv5-TEecCvNH/view?usp=sharing)

---

### 2. **4-Bit Adder Waveform**

The 4-bit ripple-carry adder's waveform shows the output sum and carry-out for various input combinations:

[![4-Bit Adder Waveform](https://drive.google.com/uc?export=view\&id=1FowDMdJcNzte9XDqMqv2CRuKhNWNV-9f)](https://drive.google.com/file/d/1FowDMdJcNzte9XDqMqv2CRuKhNWNV-9f/view?usp=sharing)

---

## 📂 Files Included

* `half_adder.v` — Implements a 1-bit half adder.
* `full_adder.v` — Implements a 1-bit full adder using half adders.
* `adder_4bit.v` — 4-bit ripple-carry adder.
* `adder_4bit_tb.v` — Testbench with waveform logging.
* `README.md` — This file.

---

## ▶️ Running the Simulation

### Using Vivado or Icarus Verilog + GTKWave:

1. Compile the Verilog files:

   ```bash
   iverilog -o adder_test adder_4bit.v full_adder.v half_adder.v adder_4bit_tb.v
   ```

2. Run the simulation:

   ```bash
   vvp adder_test
   ```

3. Open the waveform in GTKWave:

   ```bash
   gtkwave adder_4bit.vcd
   ```

---

## ✅ Future Improvements

* Add **overflow detection**.
* Support **subtraction** using two's complement.
* Build an **ALU** (Arithmetic Logic Unit) on top of the adder.

---
