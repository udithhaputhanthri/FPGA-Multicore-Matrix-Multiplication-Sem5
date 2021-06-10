module microcode(reg_out, condition, BT, OPs, jump_addr); //.in_addr(reg_out), .condition(condition), .BT(BT), .Ops(OPs), .out_addr(jump_addr)
	//total reg length : 57 + 7+ 2+ 1
	
	input [15:0] reg_out;
	output reg [1:0] condition;
	output reg BT;
	output reg [50:0] OPs=0;
	output reg [15:0] jump_addr;
	
	//reg [15:0] reg_out_tmp=reg_out;
	
	
	reg [66:0] ucode [0:85];
		
	initial begin
	ucode[0]=67'd0;
	ucode[1]={3'b000,7'd2,57'd17592186044416};
	ucode[2]={3'b000,7'd3,57'd1073741826};
	ucode[3]={3'b100,7'd0,57'd36046400000000000};
	ucode[4]={3'b000,7'd5,57'd1073741826};
	ucode[5]={3'b000,7'd6,57'd70368744177664};
	ucode[6]={3'b000,7'd7,57'd1};
	ucode[7]={3'b000,7'd1,57'd128};
	ucode[8]={3'b000,7'd9,57'd1073741826};
	ucode[9]={3'b000,7'd10,57'd70368744177664};
	ucode[10]={3'b000,7'd11,57'd1};
	ucode[11]={3'b000,7'd1,57'd16};
	ucode[12]={3'b000,7'd13,57'd8796093022208};
	ucode[13]={3'b000,7'd14,57'd262144};
	ucode[14]={3'b000,7'd15,57'd512};
	ucode[15]={3'b000,7'd1,57'd4096};
	ucode[16]={3'b000,7'd17,57'd8796093022208};
	ucode[17]={3'b000,7'd18,57'd16777216};
	ucode[18]={3'b000,7'd19,57'd512};
	ucode[19]={3'b000,7'd20,57'd137438953472};
	ucode[20]={3'b000,7'd1,57'd134217728};
	ucode[21]={3'b000,7'd22,57'd8796093022208};
	ucode[22]={3'b000,7'd23,57'd262144};
	ucode[23]={3'b000,7'd24,57'd512};
	ucode[24]={3'b000,7'd25,57'd16777216};
	ucode[25]={3'b000,7'd26,57'd549755813888};
	ucode[26]={3'b000,7'd27,57'd137438953472};
	ucode[27]={3'b000,7'd28,57'd137438953472};
	ucode[28]={3'b000,7'd1,57'd32832};
	ucode[29]={3'b000,7'd30,57'd8796093022208};
	ucode[30]={3'b000,7'd31,57'd524288};
	ucode[31]={3'b000,7'd32,57'd4503600000000000};
	ucode[32]={3'b000,7'd33,57'd16384};
	ucode[33]={3'b000,7'd34,57'd8796093022208};
	ucode[34]={3'b000,7'd35,57'd9007200000000000};
	ucode[35]={3'b000,7'd36,57'd8388608};
	ucode[36]={3'b000,7'd37,57'd549755813888};
	ucode[37]={3'b000,7'd1,57'd72057600000000000};
	ucode[38]={3'b000,7'd39,57'd2097152};
	ucode[39]={3'b000,7'd40,57'd274877906944};
	ucode[40]={3'b000,7'd41,57'd512};
	ucode[41]={3'b000,7'd1,57'd1125900000000000};
	ucode[42]={3'b000,7'd43,57'd274877906944};
	ucode[43]={3'b000,7'd44,57'd34361835520};
	ucode[44]={3'b000,7'd45,57'd512};
	ucode[45]={3'b000,7'd1,57'd2251800000000000};
	ucode[46]={3'b000,7'd47,57'd1};
	ucode[47]={3'b000,7'd48,57'd1};
	ucode[48]={3'b000,7'd1,57'd2147483648};
	ucode[49]={3'b000,7'd50,57'd8589934592};
	ucode[50]={3'b000,7'd51,57'd1};
	ucode[51]={3'b000,7'd1,57'd2147483648};
	ucode[52]={3'b000,7'd53,57'd35184372088832};
	ucode[53]={3'b000,7'd54,57'd1};
	ucode[54]={3'b000,7'd1,57'd2147483648};
	ucode[55]={3'b000,7'd1,57'd8796093022208};
	ucode[56]={3'b000,7'd1,57'd33554432};
	ucode[57]={3'b000,7'd1,57'd67182592};
	ucode[58]={3'b000,7'd1,57'd16777216};
	ucode[59]={3'b000,7'd1,57'd262144};
	ucode[60]={3'b001,7'd62,57'd0};
	ucode[61]={3'b000,7'd1,57'd1130300000000000};
	ucode[62]={3'b000,7'd1,57'd4398046511104};
	ucode[63]={3'b000,7'd1,57'd512};
	ucode[64]={3'b000,7'd1,57'd549755813888};
	ucode[65]={3'b000,7'd1,57'd8};
	ucode[66]={3'b000,7'd67,57'd4295098368};
	ucode[67]={3'b000,7'd68,57'd4};
	ucode[68]={3'b000,7'd1,57'd1280};
	ucode[69]={3'b000,7'd70,57'd2};
	ucode[70]={3'b000,7'd1,57'd268435456};
	ucode[71]={3'b001,7'd74,57'd0};
	ucode[72]={3'b000,7'd73,57'd2};
	ucode[73]={3'b000,7'd1,57'd268435456};
	ucode[74]={3'b000,7'd1,57'd1073741824};
	ucode[75]={3'b000,7'd76,57'd35184372088832};
	ucode[76]={3'b000,7'd77,57'd1099511627776};
	ucode[77]={3'b000,7'd78,57'd4};
	ucode[78]={3'b000,7'd1,57'd1024};
	ucode[79]={3'b000,7'd1,57'd18014400000000000};
	ucode[80]={3'b000,7'd80,57'd281474976710656};
	ucode[81]={3'b000,7'd1,57'd8388608};
	ucode[82]={3'b000,7'd1,57'd16384};
	ucode[83]={3'b000,7'd1,57'd2199023255552};
	ucode[84]={3'b000,7'd1,57'd32};
	ucode[85]={3'b000,7'd1,57'd1125900000000000};
	end
	
	//reg reg_temp
	//condition = ucode[reg_temp][0]
	
	
	always @(reg_out)
		{BT, condition, jump_addr, OPs}= ucode[reg_out];
			
	
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

