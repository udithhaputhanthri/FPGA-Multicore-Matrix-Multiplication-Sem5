module microcode(reg_out, condition, BT, OPs, jump_addr); //.in_addr(reg_out), .condition(condition), .BT(BT), .Ops(OPs), .out_addr(jump_addr)
	//total reg length : 57 + 7+ 2+ 1
	
	input [15:0] reg_out;
	output [1:0] condition;
	output BT;
	output [5:0] OPs;
	output [15:0] jump_addr;
	
	//reg [15:0] reg_out_tmp=reg_out;
	
	
	//reg [66:0] ucode [0:85];
		
	//initial begin
	//ucode[0]=67'd0;
	//ucode[1]=67'd1;
	//	ucode[2]=67'd2;
	//	ucode[3]=67'd3;
	//	ucode[4]=67'd4;
	//	ucode[5]=67'd5;
	//	end
	
	//reg reg_temp
	//condition = ucode[reg_temp][0]
	
	reg [5:0]temp;
	assign OPs= temp;
	
	always @(reg_out)
		//{BT, condition, jump_addr, OPs}= 4;
		//OPs= 50'd4;
		temp= 15;
endmodule


//module microcode(reg_out, condition, BT, OPs, jump_addr); //.in_addr(reg_out), .condition(condition), .BT(BT), .Ops(OPs), .out_addr(jump_addr)
//	
//	//input [15:0] reg_out;
//	output [1:0] condition;
//	output BT;
//	output reg [50:0] OPs=0;
//	output [15:0] jump_addr;
//	
//	
//	assign condition=0;
//	assign BT=0;
//	assign jump_addr=0;
//	
//	always @(condition)
//		OPs=0;
//
//
//
//endmodule

