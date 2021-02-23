module microcode(reg_out, condition, BT, OPs, jump_addr); //.in_addr(reg_out), .condition(condition), .BT(BT), .Ops(OPs), .out_addr(jump_addr)
	input [15:0] reg_out;
	output [1:0] condition;
	output BT;
	output [50:0] OPs;
	output [15:0] jump_addr;
	
//
//	reg [0:60] mem[240:0];
//
//	initial
//		begin 
//			mem[0]={8'd0,1,0,0,0,1,1}
//			mem[1]={}
//			...
//			mem[240]={}
//
//		end
//	
//	reg [15:0] line;
//	
//	assign line=mem[in_addr];
//	assign condition=line[1];
//	assign BT=line[0];
//	assign OPs=line[2:52];
//	assign out_addr=line[46:60];

	//reg tmp_condition=0;
	//reg tmp_BT=0;
	//reg tmp_OPs= 0;
	//reg tmp_jump_addr=0;
	
	assign condition=0;
	assign BT=0;
	assign OPs=0;
	assign jump_addr=0;
	


endmodule

