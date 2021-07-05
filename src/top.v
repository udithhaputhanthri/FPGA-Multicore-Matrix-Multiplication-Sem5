module top(
    input clk,
    input START,
    input RESET,

    input [1:0] addr_mux_select,
    input [15:0] ar_in,
    // input dread_in,

    //writing to data memory
    input [15:0] current_addr,
    input write_from_tb,
    input [15:0] mem_data,

    output END,

    //added for testing purposes
    output [15:0] dmem_disp,
	 output [15:0] imem_disp,
	 output [15:0] dmem_out_disp,
     output [48:0] ops_disp,
     output d_read_status,
     output  d_write_status,
     output i_read_status,
     output [15:0] ir_out_disp,
     output [15:0] dr_out_disp,
     output [15:0] bus_disp,
     output [15:0] ar_disp,
     output corrected_clk_disp,
     output [15:0] pc_disp,
     output inc_pc_disp,
     output lddr_disp,
    output [15:0]n_disp,
    output [15:0]c_disp,
    output [15:0]ic_disp,
    output [15:0]ie_disp,
    output [15:0]i_disp,
    output [15:0]j_disp,
    output [15:0]tp1_disp,
    output [15:0]tp2_disp,
    output [15:0]tp3_disp,
    output [15:0]count_disp,
	 output ldn_disp,
     output [15:0] ac_disp,
     output [15:0] tr_disp,
     output [15:0] alu_disp,
	  output z_disp,
	  output endinc_disp,
      output [15:0] memory_in_addr
);



// wire corrected_clk;
// clock_corrector clock( .trigger(START), .clk(clk), .corrected_clk(corrected_clk));

//Intermediate connections
wire [15:0] dmem_in;
wire [15:0] imem_in;
wire [15:0] dmem_out;
wire [15:0] ar_out;
// core 2
wire [15:0] dmem_in2;
wire [15:0] dmem_out2;
wire [15:0] ar_out2;
// core 3
wire [15:0] dmem_in3;
wire [15:0] dmem_out3;
wire [15:0] ar_out3;
// core 4
wire [15:0] dmem_in4;
wire [15:0] dmem_out4;
wire [15:0] ar_out4;


//Control signals
wire read_MI_F;
wire read_MD, read_MI, write_MD;
wire read_MD2, read_MI2, write_MD2; //core 2
wire read_MD3, read_MI3, write_MD3; //core 3
wire read_MD4, read_MI4, write_MD4; //core 4

//added for testing purposes
wire [48:0] OPs;
wire [15:0] ir_out_disp_temp;
wire [15:0] dr_out_disp_temp;
wire [15:0] bus_disp_temp;
wire [15:0] ar_disp_temp;
wire corrected_clk_disp_temp;
wire [15:0] pc_disp_temp;
wire inc_pc_disp_temp;
wire lddr_disp_temp;
wire [15:0]n_disp_temp;
wire [15:0]c_disp_temp;
wire [15:0]ic_disp_temp;
wire [15:0]ie_disp_temp;
wire [15:0]i_disp_temp;
wire [15:0]j_disp_temp;
wire [15:0]tp1_disp_temp;
wire [15:0]tp2_disp_temp;
wire [15:0]tp3_disp_temp;
wire [15:0]count_disp_temp;
wire ldn_disp_temp;
wire [15:0] ac_disp_temp;
wire [15:0] tr_disp_temp;
wire [15:0] alu_disp_temp;
wire z_disp_temp;
wire endinc_disp_temp;


assign dmem_disp =  dmem_out;
assign imem_disp =  imem_in;
assign dmem_out_disp = dmem_in;
assign ops_disp = OPs;
assign d_read_status = read_MD;
assign d_write_status = write_MD;
assign i_read_status = read_MI_F;
assign ir_out_disp = ir_out_disp_temp;
assign dr_out_disp = dr_out_disp_temp;
assign bus_disp = bus_disp_temp;
assign ar_disp = ar_disp_temp;
assign corrected_clk_disp = corrected_clk_disp_temp;
assign pc_disp = pc_disp_temp;
assign inc_pc_disp = inc_pc_disp_temp;
assign lddr_disp = lddr_disp_temp;
assign n_disp = n_disp_temp;
assign c_disp = c_disp_temp;
assign ic_disp = ic_disp_temp;
assign ie_disp = ie_disp_temp;
assign i_disp = i_disp_temp;
assign j_disp = j_disp_temp;
assign tp1_disp =  tp1_disp_temp;
assign tp2_disp = tp2_disp_temp;
assign tp3_disp = tp3_disp_temp;
assign count_disp = count_disp_temp;
assign ldn_disp= ldn_disp_temp;
assign ac_disp = ac_disp_temp;
assign tr_disp = tr_disp_temp;
assign alu_disp = alu_disp_temp;
assign z_disp= z_disp_temp;
assign endinc_disp= endinc_disp_temp;


wire [15:0] d_mem_addr;


assign memory_in_addr = d_mem_addr;



//intermediate wires for 2 mux

// input [15:0] current_addr,
//     input write_from_tb,
//     input [15:0] mem_data;

// [Instruction Memory]
instruction_memory IM(.read(read_MI_F), .address(ar_out), .instruction_out(imem_in));

// core processor1(.clk(clk), .START(START), .RESET(RESET), .dmem_in(dmem_in), .imem_in(imem_in) , .dmem_out(dmem_out), .ar_out(ar_out), .read_MD(read_MD), .read_MI(read_MI), .write_MD(write_MD), .end_i(END), .micro_ops(OPs), .ir_out_disp(ir_out_disp_temp), .dr_out_disp(dr_out_disp_temp), .bus_disp(bus_disp_temp), .ar_disp(ar_disp_temp), .corrected_clk_disp(corrected_clk_disp_temp), .pc_disp(pc_disp_temp), .inc_pc_disp(inc_pc_disp_temp), .lddr_disp(lddr_disp_temp),
// .n_disp(n_disp_temp), .c_disp(c_disp_temp),
// .ic_disp(ic_disp_temp), .ie_disp(ie_disp_temp),
//  .i_disp(i_disp_temp), .j_disp(j_disp_temp),
//  .tp1_disp(tp1_disp_temp), .tp2_disp(tp2_disp_temp),
//  .tp3_disp(tp3_disp_temp),.count_disp(count_disp_temp), .ldn_disp(ldn_disp_temp),
//  .ac_disp(ac_disp_temp), .tr_disp(tr_disp_temp), .alu_disp(alu_disp_temp), .z_disp(z_disp_temp), .endinc_disp(endinc_disp_temp)
//  );

// core #(.core_id(0)) processor1 (.clk(clk), .START(START), .RESET(RESET), 
// .read_MI(read_MI), .imem_in(imem_in),
// .dmem_in(dmem_in), .dmem_out(dmem_out), 
// .ar_out(ar_out), .read_MD(read_MD),  .write_MD(write_MD), 

// .end_i(END), .micro_ops(OPs), .ir_out_disp(ir_out_disp_temp), .dr_out_disp(dr_out_disp_temp), .bus_disp(bus_disp_temp), .ar_disp(ar_disp_temp), .corrected_clk_disp(corrected_clk_disp_temp), .pc_disp(pc_disp_temp), .inc_pc_disp(inc_pc_disp_temp), .lddr_disp(lddr_disp_temp),
// .n_disp(n_disp_temp), .c_disp(c_disp_temp),
// .ic_disp(ic_disp_temp), .ie_disp(ie_disp_temp),
//  .i_disp(i_disp_temp), .j_disp(j_disp_temp),
//  .tp1_disp(tp1_disp_temp), .tp2_disp(tp2_disp_temp),
//  .tp3_disp(tp3_disp_temp),.count_disp(count_disp_temp), .ldn_disp(ldn_disp_temp),
//  .ac_disp(ac_disp_temp), .tr_disp(tr_disp_temp), .alu_disp(alu_disp_temp), .z_disp(z_disp_temp), .endinc_disp(endinc_disp_temp)
//  );

// [CORE 1]
// send the address to write to the memory
dmem_mux data_mem_mux(.in_core(ar_out), .in_d_write(current_addr), .in_d_read(ar_in), .addr_mux_select(addr_mux_select), .mux_out(d_mem_addr));
//need to complete write enable thing - write signal to the data memory
wire write_to_data_mem;
tb_mux  data_mem_write_mux(.in_1(write_from_tb), .in_2(write_MD), .mux_out(write_to_data_mem));
//need to define a mux for mem_data and dmem_out - mux to determine data in for the data memory
wire [15:0] data_for_mem;
tb_mux_mem_data mem_data_select_mux(.in_1(mem_data), .in_2(dmem_out), .mem_data_select(write_from_tb), .mux_out(data_for_mem));

assign read_MI_F = read_MI || read_MI2 || read_MI3 || read_MI4;

 core #(.core_id(0)) processor1 (.clk(clk), .START(START), .RESET(RESET), 
.read_MI(read_MI), .imem_in(imem_in),
.dmem_in(dmem_in), .dmem_out(dmem_out), 
.ar_out(ar_out), .read_MD(read_MD),  .write_MD(write_MD), 

.end_i(END)
 );

// [CORE 2]
// not connected ar_out address and read_MI signal for Instruction memory
// read_MD is redudant
 core #(.core_id(1)) processor2 (.clk(clk), .START(START), .RESET(RESET), 
.read_MI(read_MI2), .imem_in(imem_in),
.dmem_in(dmem_in2), .dmem_out(dmem_out2), 
.write_MD(write_MD2), 
.ar_out(ar_out2)
 );

// [CORE 3]
 core #(.core_id(2)) processor3 (.clk(clk), .START(START), .RESET(RESET), 
.read_MI(read_MI3), .imem_in(imem_in),
.dmem_in(dmem_in3), .dmem_out(dmem_out3), 
.write_MD(write_MD3), 
.ar_out(ar_out3)
 );

// [CORE 4]
 core #(.core_id(3)) processor4 (.clk(clk), .START(START), .RESET(RESET), 
.read_MI(read_MI4), .imem_in(imem_in),
.dmem_in(dmem_in4), .dmem_out(dmem_out4), 
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

// for 4 cores
data_memory_multi_port DM_4(.clk(clk),
    .we_1(write_to_data_mem), .addr_1(d_mem_addr), .data_in_1(data_for_mem), .data_out_1(dmem_in),
    .we_2(write_MD2), .addr_2(ar_out2), .data_in_2(dmem_out2), .data_out_2(dmem_in2),
    .we_3(write_MD3), .addr_3(ar_out3), .data_in_3(dmem_out3), .data_out_3(dmem_in3),
    .we_4(write_MD4), .addr_4(ar_out4), .data_in_4(dmem_out4), .data_out_4(dmem_in4)
    );



endmodule