# 🧮 4-Bit Full Adder in Verilog

This project implements a **4-bit ripple-carry full adder** using a modular Verilog design approach. The design builds from simple gates up to a multi-bit adder.

---

## 📁 Module Hierarchy

```
adder_4bit
│
├── full_adder (4 instances)
│   ├── half_adder (2 per full adder)
│   │   ├── XOR gate
│   │   └── AND gate
```

Each `full_adder` is composed of **two half adders** and an **OR gate**, and the `half_adder` is composed of basic logic gates.

---

## 📘 Description

* **4-bit Adder**: Adds two 4-bit binary numbers (`a[3:0]` and `b[3:0]`) along with an optional carry-in (`cin`).
* **Output**: A 4-bit sum and a carry-out (`cout`).
* This adder does not handle overflow or signed operations explicitly — it performs **unsigned binary addition**.

---

## 🔧 Modules

### ✅ `half_adder`

Implements:

```
sum  = a ^ b
carry = a & b
```

### ✅ `full_adder`

Built from two half adders and an OR gate:

```verilog
sumf = a ^ b ^ cin
carryf = (a & b) | (cin & (a ^ b))
```

---

## 📊 Truth Table for 1-Bit Full Adder

| a | b | cin | sum | cout |
| - | - | --- | --- | ---- |
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

---

## 🖼️ Circuit Diagrams

You can insert diagrams here using schematic tools like [Logisim](http://www.cburch.com/logisim/), Fritzing, or draw\.io.

### 📌 Half Adder

```
Inputs: a, b
sum = a XOR b
carry = a AND b
```

![Insert Half Adder Diagram Here](#)

---

### 📌 Full Adder

```
Inputs: a, b, cin
sum = a XOR b XOR cin
carry = (a AND b) OR (cin AND (a XOR b))
```

![Insert Full Adder Diagram Here](#)

---

### 📌 4-Bit Ripple Carry Adder

Connects 4 full adders in series.

![[Insert 4-Bit Adder Diagram Here](https://github.com/Mukesh0035/extra/blob/2e99274bc606e5ef605bd762879bd787093a3e44/Screenshot%202025-05-17%20110847.png)](#)

---

## 📂 Files Included

* `half_adder.v` — Implements a 1-bit half adder
* `full_adder.v` — Implements a 1-bit full adder using half adders
* `adder_4bit.v` — 4-bit ripple carry adder
* `adder_4bit_tb.v` — Testbench with waveform logging
* `README.md` — This file

---

## ▶️ Running the Simulation

### Using Icarus Verilog + GTKWave:

```bash
iverilog -o adder_test adder_4bit.v full_adder.v half_adder.v adder_4bit_tb.v
vvp adder_test
gtkwave adder_4bit.vcd
```

---

## ✅ Future Improvements

* Add **overflow detection**
* Support **subtraction** using two’s complement
* Build an **ALU** on top of the adder

---

Let me know if you want the diagrams created or rendered automatically, or want to extend this project!
