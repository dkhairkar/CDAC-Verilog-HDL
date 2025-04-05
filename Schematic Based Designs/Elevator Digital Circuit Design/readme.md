# Elevator Digital Circuit Design 🚪🔋

This project aims to design a simple **Elevator System** using digital logic, where different input combinations represent requests for different floors, and corresponding outputs activate LEDs to indicate the elevator's position. Think of it like pressing a button inside an elevator — when you select a floor (using a 4-bit input), the system processes this and lights up the correct LED to show where the elevator is or where it's going. It's a basic simulation that helps understand how elevators can be controlled using combinational logic.

## 🧠 Overview

The circuit uses a truth table and corresponding Boolean expressions to determine how the LEDs (representing floors or elevator states) should behave based on a 4-bit input. This logic can be implemented using basic gates or programmed on an FPGA using schematic diagram.
An additional feature includes a buzzer, which activates only when a correct floor is selected. This adds an auditory confirmation that the elevator has accepted the input and moved to the requested floor. The corresponding LED will glow, and the buzzer will sound, simulating the floor arrival notification in real elevators.

## 🧾 State Table and Boolean Equations

> 📷 _For detailed state behavior and Boolean equations, refer to the image `State Table & Boolean Equation.png` included in the repository._

Where `'` indicates NOT (inversion), `·` indicates AND, and `+` indicates OR.

## 🔧 Components Used

- **Inputs**: F3, F2, F1, F0 (4-bit binary input)
- **Outputs**: LED3, LED2, LED1, LED0
- **Gates Required**: AND, OR, NOT
- **Buzzer**: Provides auditory feedback when a valid floor is selected

## 💻 Implementation

You can implement this design using:

- **FPGA board** Altera max 2 epm240t100c5n
- **Simulation tool** Altera Quaters II

## 🧪 Testing

To test the circuit:
1. Assign binary input values (F3–F0).
2. Check the corresponding LED outputs.
3. Compare the results with the expected behavior in the state table (see image).

## 📁 Files Included

- `State Table & Boolean Equation.png` - State table and Boolean equations of Design.
- `Circuit Diagram.png` – Diagram of the circuit.
- `README.md` – Project documentation.

---

🛠️ Designed by: **Ekansh Bansal**  
🎓 Project Type: Digital Logic Design  
📅 Date: April 2025

