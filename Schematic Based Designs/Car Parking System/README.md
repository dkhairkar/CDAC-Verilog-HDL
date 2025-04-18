# 🚗 Car Parking System: A Smart Vehicle Safety Prototype

This project is a simple yet innovative vehicle safety system prototype. It leverages a microcontroller, ultrasonic sensor, joystick, buzzer, switches, and LEDs to simulate and ensure safety during vehicle operation.

---

## 📜 System Overview

![Pin Diagram](./Pin%20Diagram.png)

---

## 🧩 Components Used

- **Microcontroller development board** - The brain of the system.
- **HC-SR04 Ultrasonic Sensor** - For obstacle detection.
- **Joystick module** - Simulates driving controls.
- **Buzzer** - Alerts when safety conditions are breached.
- **Toggle Switches** - Simulates key and seatbelt functionality.
- **8x LEDs** - Displays system status visually.
- **Breadboard and jumper wires** - For connecting components.

---

## ⚙️ Connections

| Component         | Connected To (Microcontroller Pin) |
|------------------|-------------------------------------|
| **HC-SR04 Trigger**  | P3.3                            |
| **HC-SR04 Echo**     | P3.4                            |
| **Buzzer**           | P3.5                            |
| **Joystick X**       | P1.0                            |
| **Joystick Y**       | P1.1                            |
| **Joystick Button**  | P1.2                            |
| **Key Switch**       | P1.3                            |
| **Seatbelt Switch**  | P1.4                            |
| **LEDs**             | P2.0 to P2.7                    |

---

## 🚦 Working Principle

1. **Ultrasonic Sensor**: Detects obstacles ahead of the vehicle.
2. **Joystick**: Simulates driving (forward, backward, stop).
3. **Key & Seatbelt Switches**: Simulate ignition and seatbelt engagement.
4. **LEDs**: Indicate system status.
5. **Buzzer**: Alerts when safety conditions are not met.

---

## 🛡️ Safety Logic Flow

- If the **key** is off, the system remains idle.
- If the **key** is on but the **seatbelt** isn't fastened, the buzzer alerts.
- When both key and seatbelt are active:
  - Joystick movement is enabled.
  - If an obstacle is detected within a predefined range by the ultrasonic sensor, the buzzer alerts and driving halts immediately.

---

## 🧑‍💻 Firmware

The firmware includes:
- Reading digital inputs (switches).
- Processing analog inputs (joystick).
- Controlling outputs (LEDs and buzzer).
- Triggering and reading the ultrasonic sensor distance.
- Implementing safety logic based on defined rules.

---

## 🛠️ Setup Instructions

1. Connect all components as per the wiring diagram.
2. Flash the microcontroller with the provided firmware code.
3. Power up the board and test the system using the switches and joystick.

---

## 🚀 Future Enhancements

- Add a **display** for visual messages.
- Log **driving behavior data** for analysis.
- Introduce **GPS** or **GSM modules** for real-time alerts.

---
## Contributors
- Dipti Khairkar
- Neeraj Chhajed
- Shreya Ingole
- Ruturaj Nimkar
- Jaychandra Nagabandi
