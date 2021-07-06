module top(
    input clk,
    input START,
    input RESET,

    //For writing and reading data memory from external files
    input [1:0] addr_mux_select,
    input [15:0] ar_in,
    input [15:0] current_addr,
    input write_from_tb,
    input [15:0] mem_data,

    output END,
	output [15:0] dmem_out_disp
    
);

//Wires for core connections

// Intermediate wires for core 1
wire [15:0] dmem_in;
wire [15:0] imem_in;
wire [15:0] dmem_out;
wire [15:0] ar_out;

// Intermediate wires for core 1
wire [15:0] dmem_in2;
wire [15:0] dmem_out2;
wire [15:0] ar_out2;

// Intermediate wires for core 1
wire [15:0] dmem_in3;
wire [15:0] dmem_out3;
wire [15:0] ar_out3;

// Intermediate wires for core 1
wire [15:0] dmem_in4;
wire [15:0] dmem_out4;
wire [15:0] ar_out4;


//Control signals
wire read_MI_F;
wire read_MD, read_MI, write_MD;    //core 1
wire read_MD2, read_MI2, write_MD2; //core 2
wire read_MD3, read_MI3, write_MD3; //core 3
wire read_MD4, read_MI4, write_MD4; //core 4

//Used to write data in data memory to an external file
assign dmem_out_disp = dmem_in;

wire [15:0] d_mem_addr;
assign memory_in_addr = d_mem_addr;

// [Instruction Memory]
instruction_memory IM(
    .read(read_MI_F), 
    .address(ar_out), 
    .instruction_out(imem_in)
);

// To select addresses coming from cores and test bench for writing and reading from external file
dmem_mux data_mem_mux(
    .in_core(ar_out), 
    .in_d_write(current_addr), 
    .in_d_read(ar_in), 
    .addr_mux_select(addr_mux_select), 
    .mux_out(d_mem_addr)
);

// To select write enable signals coming from cores and test bench for writing and reading from external files
wire write_to_data_mem;

tb_mux  data_mem_write_mux(
    .in_1(write_from_tb), 
    .in_2(write_MD), 
    .mux_out(write_to_data_mem)
);

// To select data coming from cores and test bench for writing and reading from external files
wire [15:0] data_for_mem;

tb_mux_mem_data mem_data_select_mux(
    .in_1(mem_data), 
    .in_2(dmem_out), 
    .mem_data_select(write_from_tb), 
    .mux_out(data_for_mem)
);

//Allowing all cores to access the instructions
assign read_MI_F = read_MI || read_MI2 || read_MI3 || read_MI4;

//Initiating Cores
// [CORE 1]
core #(.core_id(0)) processor1 (
    .clk(clk), 
    .START(START), 
    .RESET(RESET), 
    .read_MI(read_MI), 
    .imem_in(imem_in),
    .dmem_in(dmem_in), 
    .dmem_out(dmem_out), 
    .ar_out(ar_out), 
    .read_MD(read_MD),  
    .write_MD(write_MD), 
    .end_i(END)
 );

// [CORE 2]
core #(.core_id(1)) processor2 (
    .clk(clk), 
    .START(START), 
    .RESET(RESET), 
    .read_MI(read_MI2), 
    .imem_in(imem_in),
    .dmem_in(dmem_in2), 
    .dmem_out(dmem_out2), 
    .write_MD(write_MD2), 
    .ar_out(ar_out2)
 );

// [CORE 3]
core #(.core_id(2)) processor3 (
    .clk(clk), 
    .START(START),
    .RESET(RESET), 
    .read_MI(read_MI3), 
    .imem_in(imem_in),
    .dmem_in(dmem_in3), 
    .dmem_out(dmem_out3), 
    .write_MD(write_MD3), 
    .ar_out(ar_out3)
 );

// [CORE 4]
core #(.core_id(3)) processor4 (
    .clk(clk), 
    .START(START), 
    .RESET(RESET), 
    .read_MI(read_MI4), 
    .imem_in(imem_in),
    .dmem_in(dmem_in4), 
    .dmem_out(dmem_out4), 
    .write_MD(write_MD4), 
    .ar_out(ar_out4)
 );

// [Data Memory]

// for single core
// data_memory DM (.write(write_to_data_mem), .read(read_MD), .clk(clk), .address(d_mem_addr), .data_in(data_for_mem), .data_out(dmem_in));

// for 2 cores
// data_memory_2_port DM_2(.clk(clk),
//     .we_a(write_to_data_mem), .addr_a(d_mem_addr), .data_in_a(data_for_mem), .data_out_a(dmem_in),
//     .we_b(write_MD2), .addr_b(ar_out2), .data_in_b(dmem_out2), .data_out_b(dmem_in2)
//     );

// Initiating Multi Port Memory
data_memory_multi_port DM_4(
    .clk(clk),
    .we_1(write_to_data_mem), 
    .addr_1(d_mem_addr), 
    .data_in_1(data_for_mem), 
    .data_out_1(dmem_in),
    .we_2(write_MD2), 
    .addr_2(ar_out2), 
    .data_in_2(dmem_out2), 
    .data_out_2(dmem_in2),
    .we_3(write_MD3), 
    .addr_3(ar_out3), 
    .data_in_3(dmem_out3), 
    .data_out_3(dmem_in3),
    .we_4(write_MD4), 
    .addr_4(ar_out4), 
    .data_in_4(dmem_out4), 
    .data_out_4(dmem_in4)
);



endmodule