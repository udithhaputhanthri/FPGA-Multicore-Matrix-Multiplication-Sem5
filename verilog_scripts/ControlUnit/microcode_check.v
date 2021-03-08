module microcode_check(reg_out, condition, BT, OPs, jump_addr); //.in_addr(reg_out), .condition(condition), .BT(BT), .Ops(OPs), .out_addr(jump_addr)
	//total reg length : 57 + 7+ 2+ 1
	
	input [15:0] reg_out;
	output [1:0] condition;
	output BT;
	output reg [50:0] OPs=0;
	output [15:0] jump_addr;
	
	
	reg [66:0] ucode [0:85];
		
	assign condition=0;
	assign BT=0;
	assign jump_addr=0;
	
	initial begin
	ucode[0]=67'd0;
	ucode[1]=67'd17592186044416;
	ucode[2]=67'd1073741826;
	ucode[3]=67'd36046400000000000;
	ucode[4]=67'd1073741826;
	ucode[5]=67'd70368744177664;
	ucode[6]=67'd1;
	ucode[7]=67'd128;
	ucode[8]=67'd1073741826;
	ucode[9]=67'd70368744177664;
	ucode[10]=67'd1;
	ucode[11]=67'd16;
	ucode[12]=67'd8796093022208;
	ucode[13]=67'd262144;
	ucode[14]=67'd512;
	ucode[15]=67'd4096;
	ucode[16]=67'd8796093022208;
	ucode[17]=67'd16777216;
	ucode[18]=67'd512;
	ucode[19]=67'd137438953472;
	ucode[20]=67'd134217728;
	ucode[21]=67'd8796093022208;
	ucode[22]=67'd262144;
	ucode[23]=67'd512;
	ucode[24]=67'd16777216;
	ucode[25]=67'd549755813888;
	ucode[26]=67'd137438953472;
	ucode[27]=67'd137438953472;
	ucode[28]=67'd32832;
	ucode[29]=67'd8796093022208;
	ucode[30]=67'd524288;
	ucode[31]=67'd4503600000000000;
	ucode[32]=67'd16384;
	ucode[33]=67'd8796093022208;
	ucode[34]=67'd9007200000000000;
	ucode[35]=67'd8388608;
	ucode[36]=67'd549755813888;
	ucode[37]=67'd72057600000000000;
	ucode[38]=67'd2097152;
	ucode[39]=67'd274877906944;
	ucode[40]=67'd512;
	ucode[41]=67'd1125900000000000;
	ucode[42]=67'd274877906944;
	ucode[43]=67'd34361835520;
	ucode[44]=67'd512;
	ucode[45]=67'd2251800000000000;
	ucode[46]=67'd1;
	ucode[47]=67'd1;
	ucode[48]=67'd2147483648;
	ucode[49]=67'd8589934592;
	ucode[50]=67'd1;
	ucode[51]=67'd2147483648;
	ucode[52]=67'd35184372088832;
	ucode[53]=67'd1;
	ucode[54]=67'd2147483648;
	ucode[55]=67'd8796093022208;
	ucode[56]=67'd33554432;
	ucode[57]=67'd67182592;
	ucode[58]=67'd16777216;
	ucode[59]=67'd262144;
	ucode[60]=67'd0;
	ucode[61]=67'd1130300000000000;
	ucode[62]=67'd4398046511104;
	ucode[63]=67'd512;
	ucode[64]=67'd549755813888;
	ucode[65]=67'd8;
	ucode[66]=67'd4295098368;
	ucode[67]=67'd4;
	ucode[68]=67'd1280;
	ucode[69]=67'd2;
	ucode[70]=67'd268435456;
	ucode[71]=67'd0;
	ucode[72]=67'd2;
	ucode[73]=67'd268435456;
	ucode[74]=67'd1073741824;
	ucode[75]=67'd35184372088832;
	ucode[76]=67'd1099511627776;
	ucode[77]=67'd4;
	ucode[78]=67'd1024;
	ucode[79]=67'd18014400000000000;
	ucode[80]=67'd281474976710656;
	ucode[81]=67'd8388608;
	ucode[82]=67'd16384;
	ucode[83]=67'd2199023255552;
	ucode[84]=67'd32;
	ucode[85]=67'd1125900000000000;
	
	end
	
	//reg reg_temp
	//condition = ucode[reg_temp][0]
	
	
	always @(reg_out)
		//case reg_out=1	
		BT=ucode[reg_out][66];
		condition = ucode[reg_out][65:64];
		next_addr= ucode[reg_out][63:57];
		OPs= ucode[reg_out][56:0];
	
			
	
		
		
	



endmodule

