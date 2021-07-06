module controller(
	input clk, 
    input [15:0] IR,  
    input z,
	output [48:0] OPs 
);
	

//Map function
wire [15:0] map_addr;
	
mapping_block mapping_func(
	.IR(IR), 
	.map_addr(map_addr)
);
	
wire [6:0] jump_addr;
wire [15:0] inc_addr;
wire [15:0] mux_out;
wire [15:0] reg_out;
wire [1:0] addr_select;

assign inc_addr = reg_out+1;

mux1_control_unit mux1(
	.map_addr(map_addr), 
	.jump_addr(jump_addr), 
	.inc_addr(inc_addr), 
	.reg_in(mux_out), 
	.select(addr_select)
);

cu_reg_rst_load register(
	.clk(clk), 
	.data_in(mux_out), 
	.data_out(reg_out), 
	.load_enable(1), 
	.reset(0)
);
	
wire [1:0] condition;
wire BT;

microcode micromemory(
	.reg_out(reg_out), 
	.condition(condition), 
	.BT(BT), .OPs(OPs), 
	.jump_addr(jump_addr)
);
	
wire [15:0] logic_in;

mux2_control_unit mux2(
	.z(z), 
	.select(condition), 
	.logic_in(logic_in)
);

logic_block logic_box(
	.BT_in(BT), 
	.mux2_out(logic_in), 
	.signal_out(addr_select)
);
	

endmodule	






	
