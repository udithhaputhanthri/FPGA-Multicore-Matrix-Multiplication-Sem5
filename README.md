# Multi-Core Processor Design for Matrix Multiplication using FPGA

The goal of this project is to implement a simple processor that is capable of handling single
instruction and multiple data processing in order to compute and output the results of a matrix
multiplication. The processor is specifically designed and optimized to do matrix multiplication
of square matrices of n x n. However, the proposed solution also facilitates the multiplication
of matrices with different shapes.

The proposed solution is implemented in Verilog Hardware Description Language using the QuartusLite 18.1.0.625.

## Overview of the Proposed Solution

The proposed solution facilitates the multiplication of two p x q and q x r matrices using a
number of cores as defined by the user as per his requirement.

Initially, following the input of the two matrices, along with the number of cores and matrix
sizes, the implemented Python code will rearrange the matrices to be stored appropriately
in the memory as per the proposed memory allocation defined in the algorithm. Next, the
Verilog testbench will read the rearranged data which will be stored in the Data Memory (DM).
Following the storage, the cores will initialize the operation and complete the multiplication of
the two input matrices. After this realization, the Verilog testbench will write the results of
the process stored in the DM to an external text file. Finally, the implemented Python code
will rearrange the data stored in that text file in a more user readable format and outputs the
results of the matrix multiplication while informing the latency of the computation. This is
achieved after comparing the obtained results with expected outcome calculated from a matrix
multiplication in Python.

## Algorithm
![algorithm](figures/algorithm.png){:height="50%" width="50%"}
**Fig :** Algorithm

## Instruction Set Architecture (ISA)

##### Data Paths
![datapaths](figures/datapaths.png)
**Fig :** Data Paths Diagram

##### Instruction Set
![instructions](figures/instructions.png)
**Fig :** Instructions

##### State Diagram
![state](figures/state.pdf)
**Fig :** State Diagram

### Control Unit
![controlunit](figures/controlunit.pdf)
**Fig :** Control Unit

## Results and Conclusion
To this end, we have implemented and tested 10-core processor for paralleled matrix multiplication
with 16-bit valued data. Because of the independent processing of each core, the capability of adding more cores is straight forward. With the results shown in Fig. 34, it can be seen that the computation time for matrix multiplication is decreasing when increasing the number of cores for all matrix sizes. The implemented processor is capable of doing;

![results](figures/results.pdf)
**Fig :** Results

* (4x4) 16-bit valued matrix multiplication within around 1 us utilizing 4 cores.
* (8x8) 16-bit valued matrix multiplication within around 4 us utilizing 8 cores.
* (16x16) 16-bit valued matrix multiplication within around 27 us utilizing 10 cores.

Even though initial reduction of computation time is significant, number of cores will no
longer be affected to the computation time when the number of cores passes the size of matrices.







