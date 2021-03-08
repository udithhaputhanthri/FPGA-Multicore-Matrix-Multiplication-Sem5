module microcode(reg_out, condition, BT, OPs, jump_addr); //.in_addr(reg_out), .condition(condition), .BT(BT), .Ops(OPs), .out_addr(jump_addr)
	input [15:0] reg_out;
	output [1:0] condition;
	output BT;
	output reg [50:0] OPs=0;
	output [15:0] jump_addr;
	
	
	assign condition=0;
	assign BT=0;
	assign jump_addr=0;
	
	always @(condition)
		OPs=0;



endmodule

