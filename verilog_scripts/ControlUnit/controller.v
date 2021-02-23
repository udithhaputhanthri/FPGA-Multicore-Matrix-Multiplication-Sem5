module controller(clk, IR, z, OPs); // implement OPs -> Control Signals!!!
	input clk, IR, z;
	output reg [50:0] OPs; // check and change25 (number of columns)

	wire [15:0] map_addr;
	assign map_addr=IR<<3; // CHECK 			

	wire [15:0] jump_addr;
	wire [15:0] inc_addr;
	wire [15:0] mux_out;
	wire [15:0] reg_out;
	wire [1:0] addr_select;

	mux1_ControlUnit mux1(.map_addr(map_addr), .jump_addr(jump_addr), .inc_addr(inc_addr), .reg_in(mux_out), .select(addr_select));
	reg_RstLd register(.clk(clk), .data_in(mux_out), .data_out(reg_out), .load_enable(1), .reset(0));
	
	wire [1:0] condition;
	wire BT;

	microcode micromemory(.reg_out(reg_out), .conditon(condition), .BT(BT), .OPs(OPs), .jump_addr(jump_addr));// implement !!!
	

	assign inc_addr = reg_out+1;
	
	
	wire [15:0] logic_in;
	Mux mux2_ControlUnit(.z(z), .select(condition), .logic_in(logic_in));
	
	//BT, logic_in, outs -> S1, S0
	
	reg add_sel2= (~BT and logic_in);
	assign addr_select[1]=BT;
	assign addr_select[0]=addr_sel2;

endmodule	






	
