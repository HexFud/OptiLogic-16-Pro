---
title: "OptiLogic-16 Pro"
author: "HexFud"
description: "A logic analyzer with 16 channels that can also watch two fiber network links at the same time"
created_at: "2026-10-12"
---

# 2026-10-25: Final routing and wiring the remaning not connected pads

**Total time spent: 1h 3m**

I grouped 2 sessions in one because i basically did the same thing and i can also finally say that the board is officially COMPLETE. I spent an hour trying to get rid of all of the errors and I did it! The most complex part were the connections under the CPU because it was too saturated of traces but i managed to make it. 
![image.png](https://cdn.hackclub.com/01a17214-6f5b-70a2-a56b-d61a1c0e7658/image.png)![image.png](https://cdn.hackclub.com/01a17214-b75b-7c8c-a784-6c36548b9e75/image.png)

# 2026-10-24: Final Routing, DDR3 Length Tuning and Enclosure Design,

**Total time spent: 2h 31m**

During the final phase of the project I obviously needed to complete the routing and organize the PCB. I tried to keep a resonable lenght of the traces ofr the ram and the fast comparators and for the data lines, strobe signals, and clock.
![image.png](https://cdn.hackclub.com/01a16fca-24b1-7928-bdec-2f74a8456d22/image.png)
Next I completed the wiring from the USB 3.0 to the FPGA. Unfortunately i wanted to keep things as clean as possible but because there were too many wires i needed to use the GND layers.
![image.png](https://cdn.hackclub.com/01a16fca-73fd-75ac-af46-79e8cefbbe24/image.png)
At the same time while I was wiring the components I was running the DRC A LOT because it is impossible to see the missing connection following the microscopic blue lines (I also tried to correct silkscreen warnings to make text not overlap to another).
Obivously I forgot the most important part of the PCB, the mounting holes that i added in the schematic connecting them to ground and placed them on the pcb.
![image.png](https://cdn.hackclub.com/01a16fca-a924-736f-8c98-6d85f7f0a6b6/image.png)![image.png](https://cdn.hackclub.com/01a16fca-e211-74d4-ba8f-3fb299332565/image.png)
After 2 hours of work i got tired of wiring components (so I will wire the few remaning missing connections tomorrow or maybe today if I have time) and I started designing the case. 
![image.png](https://cdn.hackclub.com/01a16fcb-3896-7e86-92fe-0942dfb1e5c3/image.png)

# 2026-10-23: Ethernet and USB 3.0  routing, and FPGA power and ground VIAs placement

**Total time spent: 28m**

During this session, I focused on routing the digital section starting with the Ethernet. I routed the power traces for the +1V2 and +2V5 rails connecting them to their decoupling capacitors and tidying up the ground connections around the resistor and the crystal. I then moved onto the USB 3.0 routing the +3V3 and +2V5 power connections to the package pins and nearby capacitors. I also completed the local routing around the QSPI Flash memory.
![image.png](https://cdn.hackclub.com/01a16a35-52d5-7aa2-b86e-e481e265e63c/image.png)
The most complicated part of the session was the fanout of the FPGA. I placed a dense array of vias to bring signals and power connections out from the inner pads, routing traces across the various inner layers to distribute the core and voltage rails.
![image.png](https://cdn.hackclub.com/01a16a34-eeef-787f-b382-cc5f568d8dbb/image.png)

# 2026-10-23: Power lines Routing, Op-Amp building and Silkscreen 

**Total time spent: 1h 45m**

I began the session by defining The gorund plane. I haven't selected the inner layers and upper layer just to have them but these ground planes serve as shield for the interferences. I routed vias and shaped traces for the various internal and I/O voltage rails (+1V0, +1V2, +1V5, +1V8, and +2V5) rearranging the decoupling capacitors to optimize current delivery, then continued routing some of the DDR3 memory signals.
![image.png](https://cdn.hackclub.com/01a16a2a-9856-745e-a7fd-64f86f68ef40/image.png)
Then I have spent most of the times on the scaling section so the four quad amplifiers and the two SPI DACs. I spent time arranging as the previous devlog the resistors in a compact layout around their chip. This minimized trace lengths to keep the signals clean before routing them to the comparators.
![image.png](https://cdn.hackclub.com/01a16a29-b22f-7591-9669-4758d6b2b53b/image.png)
Finally, after placing the last remaining scattered components that were still outside the board I worked on the exterior aspect by adding something to the silskreen. To make future hardware debugging significantly easier I visually separated the various power supply by drawing boxes around each converter and adding text labels describing the input voltage -> output voltage 
![image.png](https://cdn.hackclub.com/01a16a2a-5031-7bbb-b333-5c0e701dae8f/image.png)

# 2026-10-23: Analog Comparator Routing, Layout Optimization, and Power Routing

**Total time spent: 1h 32m**

I began the session by focusing on the main power input routing very wide traces for the +12V rail through the barrel jack, the resettable fuse, the reverse-polarity protection MOSFET and the diode to minimize voltage drops and handle high currents. Next, I placed the oscillator and the bypass capacitors connecting them to the FGPA. I also verified the trace widths on the inductor switching nodes for the +7V rail.
![image.png](https://cdn.hackclub.com/01a16a1d-6f2d-74e0-b183-36f8988b0e15/image.png)
The most difficult part was routing the four comparators and their components and also because here the signal is very sensitive i spent a lot of time optimizing the placement of the components around each chip. Then I routed major power lines such as +7V, +2.5V, and -3V using thick traces to havee minimum impedance. 
![image.png](https://cdn.hackclub.com/01a16a1d-ebd8-7677-8066-c548c3c579fb/image.png)
Then to complete the comparators block I routed the sixteen output pairs from the comparators to the FPGA, and continued working on the wiring of the DDR3. 

# 2026-10-23: Component Placement, SFP Module Routing, DDR3 Memory, and Power Supply Section

**Total time spent: 1h 43m**

I began the PCB layout phase by organizing the large number of FPGA decoupling capacitors grouping them by their value. The main objective I imposed myself was to define the mechanical clearances and external interfaces. To achieve this, I placed the main connectors along the edges of the board.
![image.png](https://cdn.hackclub.com/01a16a12-7820-71dc-ad64-c0010a0c6968/image.png)
I then focused on the three optical SFP modules routing their connections. I placed and routed the passive components including ferrite beads, capacitors, and resistors placing them really close to the SFP cages to minimize the interferences.
![image.png](https://cdn.hackclub.com/01a16a12-bfe1-77ee-a1dc-6615461dae21/image.png)
Next I started to route the power supply. Initially, I made the mistake of leaving the components  scattered across the PCB bringing only the central chips on their place. To resolve this I had the schematic on my second screen to make some little group of components on the PCB to have everything in the same place like grouping all buck converters, LDOs, and inductors in the corner of the PCB. I then routed the power supply section using wide traces for the switching nodes of the converters.
![image.png](https://cdn.hackclub.com/01a16a13-018c-777d-93b0-e73596987c8e/image.png)
Finally, I worked on the high-speed memory interface. I performed the BGA fanout for the DDR3 memory routing the power and ground pads directly to the internal layers through vias before starting to route the signal traces toward the FPGA pin array. I positioned termination resistors really close to the memory chip to preserve signal integrity.
![image.png](https://cdn.hackclub.com/01a16a13-3319-75d6-87d9-ab9be3a11488/image.png)

# 2026-10-23: FPGA Pinout Completion, SFP Module Interface, and Component Updates

**Total time spent: 52m**

I havw finally completed the FPGA net lable placing i started in the previous session. I also added a tactile push button for manual reset and an LED connected to the DONE_0 pin to show the status of the firmware and maybe in the future also provide error codes blinking.

Next I wired the I2C bus signals dedicated to the management and diagnostics of the three optical modules and completed the control lines for the SPI DAC.
![image.png](https://cdn.hackclub.com/01a16977-d111-778a-8aed-2a38f6c7c12c/image.png)![image.png](https://cdn.hackclub.com/01a16978-28cf-7374-b7b7-0a6cca4ecc49/image.png)

After completing the connections I assigned the correct and updated footprints of the new components. 

In the end I improved the readability of the power supply section by enclosing the input protection circuit within a blue rectangle. I also added an extra 100 nF decoupling capacitor to the USB interface and replaced the generic differential oscillator symbol with the SiT9365 model, ensuring that its power supply pin was connected to the +3.3V rail.
![image.png](https://cdn.hackclub.com/01a16978-f87a-7c91-83ce-9c4a2373da76/image.png)

# 2026-10-23: Changing CPU symbol, footprint and re-wiring

**Total time spent: 27m**

Unfortunately I discovered after searching for a while that I imported the wrong CPU symbol and footprint. So now i need to re-wire EVERYTHING. I used the cpu variant with less pins and it didn't have the functionality to support everything on my board because I couldn't connect it. So I imported the correct CPU that has 676 pins. Then i transposed some NET Labels that were connected to the new CPU (I will do the rest in the next session)
![image.png](https://cdn.hackclub.com/01a168e4-6b43-753b-abee-c798535f7bba/image.png)![image.png](https://cdn.hackclub.com/01a168e4-8ca7-757b-a6a1-a0d035a5d843/image.png)

# 2026-10-23: Complete FPGA I/O Bank Mapping, DDR/Negative Supply ERC Corrections, and Netlist Import into the PCB

**Total time spent: 1h 39m**

At this stage, I completed the wiring of the entire FPGA (The most boring part) Placing A LOT of net lables across the entire chip.Then I connected the serial lines for the SFP modules the 100 ohm calibration resistor and the 125 MHz oscillator. I also mapped the JTAG bus and QSPI Flash interface. I distributed the 32-bit parallel bus of the USB 3.0 bridge, the Ethernet interface, the entire DDR3 memory bus, and all 16 differential pairs from the comparators. 
![image.png](https://cdn.hackclub.com/01a168cf-d96e-7050-a343-f9ca4578f6d4/image.png)

After a while I have run the first ERC and i noticed some errors on the power supply design. 
1. The inverting regulator didn't have the input voltage, so I added a 100 nF filter capacitor and a feedback resistor to stabilize the negative output voltage. 
2. The memory voltage converter where I initially connected VIN to +1.5V but i left VLDOIN unconnected, incorrectly grounded the VOSNS pin, and shorted REFIN to REFOUT. I fixed these issues by powering VIN with +3.3V, and connecting VLDOIN to +1.5V and connected VOSNS directly to the +0.75V output.
![image.png](https://cdn.hackclub.com/01a168d4-7607-72f9-8728-7b4e7a591b74/image.png)![image.png](https://cdn.hackclub.com/01a168d4-c3f3-7dab-847c-9a4a3a9f808b/image.png)

Finally, I assigned footprints to all schematic symbols, also searching LCSC for a combined cage-and-20-pin connector footprint for the three SFP modules. I then imported the complete netlist into the PCB Editor.
![image.png](https://cdn.hackclub.com/01a168d5-4933-71c1-a4eb-5b8acb81cf78/image.png)

# 2026-10-22: Completion of the DDR3 Interface, QSPI Memory, and JTAG for the FPGA, and Power Supply Design

**Total time spent: 59m**

I started by completing the connections this time for the Ethernet port wiring the four differential MDI pairs to the RJ45 connector and then i finished labeling the entire ethernet controller, and adding pull-up resistors to +2.5V on the MDIO and PHY_RESET_N lines that were missing before. 
![image.png](https://cdn.hackclub.com/01a1652b-524b-7670-b7e9-56ce2611ff83/image.png)
Moving onto the DDR3 memory the lables were already connected I only connected the 0.75V power and adding the corresponding 100 nF decoupling capacitor , and corrected an error in the differential clock connections: I had initially used a 240 ohm resistor to ground, replacing it with the correct 100 ohm resistor.
![image.png](https://cdn.hackclub.com/01a1652b-92a8-7b4e-8301-9fe70eac565e/image.png)
I then added the QSPI Flash memory for FPGA configuration, including pull-up resistors to on the WP and HOLD pins. I also added the 14-pin JTAG connector fter verifying the adapter pinout and wired the two 20-pin input connectors, alternating the 16 analog signals with ground pins to provide shielding for the traces.
![image.png](https://cdn.hackclub.com/01a1652c-22e8-7e94-8e53-d50a4bcf7339/image.png)![image.png](https://cdn.hackclub.com/01a1652c-5419-7e62-9b93-eab93435ac04/image.png)
Then I focused entirely on the power supply design to generate all the system voltages from the 12 V DC jack. The input is protected by a 3 A resettable fuse, a P-channel MOSFET for reverse polarity protection and a Zener diode. For the main buck converter I initially selected a TPS5430DDA, but after simulating the circuit using the texas instruments WEBENCH Power Designer, I decided to replace it with a different regulator that had more efficency and stability. After viewing the example schematic on the site I replicated it on kikad.
![image.png](https://cdn.hackclub.com/01a1652c-d8d8-78e2-bf46-bb562091e97d/image.png)![image.png](https://cdn.hackclub.com/01a1652d-3798-71d7-b8c2-901b904aa1f4/image.png)
Finally, I designed the other voltage regulators using three TPS563200 buck converters to generate the +3.3V +1.5V and +7V rails. I added two low-dropout linear regulators, an AP2112K-2.5 and a TLV75512PDBV, to provide low noise +2.5V and +1.2V rails. I also included a TPS51200DRC regulator to generate the +0V75_VTT and +0V75_VREF rails. To complete the power supply, I also designed an inverting converter with to generate the negative -3V supply required by the comparators and the amplifiers.
![image.png](https://cdn.hackclub.com/01a1652d-b82e-7224-bdf2-32c9acee3431/image.png)

# 2026-10-22: Scaling Power Supply, DAC, and Ethernet Fix and completations

**Total time spent: 20m**

I didn’t have much time this session, so there isn’t much to report. I added 2 missing connections on the DAC ![image.png](https://cdn.hackclub.com/01a1651a-45cd-75e9-929a-8b036f6488a5/image.png)and fixed the missing resistors and power connections to the scaling stage (I also rearranged them to make the sheet cleaner) ![image.png](https://cdn.hackclub.com/01a16519-d014-74c4-ba54-f167ae6db325/image.png) cleaned up USB-C ERC warnings, and started to write the ethernet chip net lables.![image.png](https://cdn.hackclub.com/01a16519-fcfe-7340-9874-558528bb430b/image.png)

# 2026-10-22: Revision of the 16-Channel Comparator Stage, DAC Scaling, USB 3.0 Interface, and Ethernet PHY

**Total time spent: 53m**

I started by updating the 16 comparators raising the positive supply voltage VCCI to +7V because i though it was lower but after reading the datasheet carefully i was wrong.I also replaced the generic TVS diodes with dual BAV99 diodes to protect the input.

During this phase I corrected the operational amplifiers: I had initially used an outdated reference voltage and used 16 separate chips on the PCB instead of four!. So i changed their reference name to the correct one.

For high-speed data acquisition to the PC I completed the schematic for the USB 3.0 SuperSpeed interface after the boring work of copying and pasting every NET form the usb controller to the CPU. I added resistors to the CC1/CC2 pins, AC-coupling capacitors on the SuperSpeed differential lines, and pull-up resistors to control signals. ![image.png](https://cdn.hackclub.com/01a1650a-5cc3-7f2e-a95e-6a2091cd20b3/image.png)

Finally, I started wiring the Ethernet controller but I didn't have much time so I left it unfinished
![image.png](https://cdn.hackclub.com/01a1650a-deaa-75e5-aff7-5c42507d9c27/image.png)

# 2026-10-22: 16-Channel Front-End Schematics, SFP Modules, and DDR3L for the FPGA

**Total time spent: 1h 43m**

![image.png](https://cdn.hackclub.com/01a164f8-1cfe-778f-8bb7-8c485100c066/image.png)
In this session, I designed the main blocks of an AMD Kintex-7 acquisition board in KiCad. I connected three SFP modules (J1–J3) to the MGT transceivers, adding power filtering, AC-coupling capacitors and status pull-ups. I also connected a 125MHz differential oscillator to MGT bank 115 and wired the DDR3 memory, including the calibration resistor and reset pull-down.

For the 16-channel analog front end, I used four LMH7324 quad comparators with input protection and differential output termination. Two 8-channel SPI DACs generate the thresholds, using a voltage reference, an LMH6609MA buffer and resistor networks to adapt the voltage range.

During schematic development, I corrected grounding errors and a short i caused on the SFP connector because i have put the capacitors to ground and that would've destoryed the signal. I also revised the comparator block to include the missing protection and termination components before duplicating it across all 16 channels and assigning unique net names.

