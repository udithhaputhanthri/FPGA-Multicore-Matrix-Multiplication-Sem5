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

// Intermediate wires for core 2
wire [15:0] dmem_in2;
wire [15:0] dmem_out2;
wire [15:0] ar_out2;

// Intermediate wires for core 3
wire [15:0] dmem_in3;
wire [15:0] dmem_out3;
wire [15:0] ar_out3;

// Intermediate wires for core 4
wire [15:0] dmem_in4;
wire [15:0] dmem_out4;
wire [15:0] ar_out4;

// Intermediate wires for core 5
wire [15:0] dmem_in5;
wire [15:0] dmem_out5;
wire [15:0] ar_out5;

// Intermediate wires for core 6
wire [15:0] dmem_in6;
wire [15:0] dmem_out6;
wire [15:0] ar_out6;

// Intermediate wires for core 7
wire [15:0] dmem_in7;
wire [15:0] dmem_out7;
wire [15:0] ar_out7;

// Intermediate wires for core 8
wire [15:0] dmem_in8;
wire [15:0] dmem_out8;
wire [15:0] ar_out8;

// Intermediate wires for core 9
wire [15:0] dmem_in9;
wire [15:0] dmem_out9;
wire [15:0] ar_out9;

// Intermediate wires for core 10
wire [15:0] dmem_in10;
wire [15:0] dmem_out10;
wire [15:0] ar_out10;


//Control signals
wire read_MI_F;
wire read_MD, read_MI, write_MD;    //core 1
wire read_MD2, read_MI2, write_MD2; //core 2
wire read_MD3, read_MI3, write_MD3; //core 3
wire read_MD4, read_MI4, write_MD4; //core 4
wire read_MD5, read_MI5, write_MD5; //core 5
wire read_MD6, read_MI6, write_MD6; //core 6
wire read_MD7, read_MI7, write_MD7; //core 7
wire read_MD8, read_MI8, write_MD8; //core 8
wire read_MD9, read_MI9, write_MD9; //core 9
wire read_MD10, read_MI10, write_MD10; //core 10

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
assign read_MI_F = read_MI || read_MI2 || read_MI3 || read_MI4 || read_MI5 || read_MI6 || read_MI7 || read_MI8 ||read_MI9 || read_MI10 ;

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

// // [CORE 2]
// core #(.core_id(1)) processor2 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI2), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in2), 
//     .dmem_out(dmem_out2), 
//     .write_MD(write_MD2), 
//     .ar_out(ar_out2)
//  );

// // [CORE 3]
// core #(.core_id(2)) processor3 (
//     .clk(clk), 
//     .START(START),
//     .RESET(RESET), 
//     .read_MI(read_MI3), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in3), 
//     .dmem_out(dmem_out3), 
//     .write_MD(write_MD3), 
//     .ar_out(ar_out3)
//  );

// // [CORE 4]
// core #(.core_id(3)) processor4 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI4), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in4), 
//     .dmem_out(dmem_out4), 
//     .write_MD(write_MD4), 
//     .ar_out(ar_out4)
//  );

//  // [CORE 5]
// core #(.core_id(4)) processor5 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI5), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in5), 
//     .dmem_out(dmem_out5), 
//     .write_MD(write_MD5), 
//     .ar_out(ar_out5)
//  );

//   // [CORE 6]
// core #(.core_id(5)) processor6 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI6), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in6), 
//     .dmem_out(dmem_out6), 
//     .write_MD(write_MD6), 
//     .ar_out(ar_out6)
//  );

//    // [CORE 7]
// core #(.core_id(6)) processor7 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI7), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in7), 
//     .dmem_out(dmem_out7), 
//     .write_MD(write_MD7), 
//     .ar_out(ar_out7)
//  );

//   // [CORE 8]
// core #(.core_id(7)) processor8 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI8), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in8), 
//     .dmem_out(dmem_out8), 
//     .write_MD(write_MD8), 
//     .ar_out(ar_out8)
//  );


//   // [CORE 9]
// core #(.core_id(8)) processor9 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI9), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in9), 
//     .dmem_out(dmem_out9), 
//     .write_MD(write_MD9), 
//     .ar_out(ar_out9)
//  );

//    // [CORE 10]
// core #(.core_id(9)) processor10 (
//     .clk(clk), 
//     .START(START), 
//     .RESET(RESET), 
//     .read_MI(read_MI10), 
//     .imem_in(imem_in),
//     .dmem_in(dmem_in10), 
//     .dmem_out(dmem_out10), 
//     .write_MD(write_MD10), 
//     .ar_out(ar_out10)
//  );
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
    .data_out_4(dmem_in4),
    .we_5(write_MD5), 
    .addr_5(ar_out5), 
    .data_in_5(dmem_out5), 
    .data_out_5(dmem_in5),
    .we_6(write_MD6), 
    .addr_6(ar_out6), 
    .data_in_6(dmem_out6), 
    .data_out_6(dmem_in6),
    .we_7(write_MD7), 
    .addr_7(ar_out7), 
    .data_in_7(dmem_out7), 
    .data_out_7(dmem_in7),
    .we_8(write_MD8), 
    .addr_8(ar_out8), 
    .data_in_8(dmem_out8), 
    .data_out_8(dmem_in8),
    .we_9(write_MD9), 
    .addr_9(ar_out9), 
    .data_in_9(dmem_out9), 
    .data_out_9(dmem_in9),
    .we_10(write_MD10), 
    .addr_10(ar_out10), 
    .data_in_10(dmem_out10), 
    .data_out_10(dmem_in10)


);



endmodule