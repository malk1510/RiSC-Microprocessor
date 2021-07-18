# RiSC-Microprocessor

This project is the implementation of the simplified RISC Isa, also called, the Ridiculously Simple Computer (RiSC-16), by Prof. Bruce Jacob from University of Maryland.

In this project, we have essentially implemented a 5-stage pipelined RISC Microprocessor with an alu that runs the instruction set as outlined by Prof. Jacob using a simple FSM. This RiSC-16 processor would have 8 registers, each having 2 bytes of memory. Other than that, there can be a maximum of 256 instructions, and it also comes with a data memory comprising 256 memory locations of 2-bytes each.

This implements a von-Neumann architecture for the memory, and the time taken by each pipeline stage is such that the instruction fetching block runs for two clock cycles, so as to prevent Branching hazards.

The instruction set implemented is given in the paper down below. We have also used a few other sources for our reference.

We hope you like this project of ours, if there's anything you feel we should change to improve or correct any part of this project, please do tell us about it.

Thank you!

Resources that were helpful in making this project include:
1. https://user.eng.umd.edu/~blj/RiSC/RiSC-isa.pdf
2. https://github.com/preetam25/IITB-Proc
3. https://moodle.iitb.ac.in/pluginfile.php/191466/mod_resource/content/1/MIPS-pipelined.pdf

This project was made with the help of the following people:
1. Malhar Kulkarni
2. Tej Ved
3. Shivam Dawalbaje
4. Kunal Chhabra
5. Kartikeya Chandra
