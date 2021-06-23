module controller(clk, IR, z, OPs);
	input clk; 
    input [15:0] IR;  //Bit number will vary according to the number of instructions
    input z;
	output [56:0] OPs; //Made a wire because output of micromemory module should be connected to a wire 

	//Map function
	wire [15:0] map_addr;
	// assign map_addr = IR<<3; 	
	// assign map_addr = IR + 16'd8;
	assign map_addr = IR;		

	wire [6:0] jump_addr;
	wire [15:0] inc_addr;
	wire [15:0] mux_out;
	wire [15:0] reg_out;
	wire [1:0] addr_select;

	assign inc_addr = reg_out+1;

	mux1_control_unit mux1(.map_addr(map_addr), .jump_addr(jump_addr), .inc_addr(inc_addr), .reg_in(mux_out), .select(addr_select));
	reg_rst_load register(.clk(clk), .data_in(mux_out), .data_out(reg_out), .load_enable(1), .reset(0));
	
	wire [1:0] condition;
	wire BT;

	microcode micromemory(.reg_out(reg_out), .condition(condition), .BT(BT), .OPs(OPs), .jump_addr(jump_addr));// implement !!!-> kara yako

	
	wire [15:0] logic_in;
	mux2_control_unit mux2(.z(z), .select(condition), .logic_in(logic_in));

	logic_block logic_box(.BT_in(BT), .mux2_out(logic_in), .signal_out(addr_select));
	


endmodule	






	
