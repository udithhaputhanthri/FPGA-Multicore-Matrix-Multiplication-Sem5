module data_memory(
	input write,
	input read,
	input clk,
    input [15:0] address,
	input [15:0] data_in,
	output [15:0] data_out
	); 
	
	reg [15:0] memory [0:999];  //16 bit memory with 100 locations
	
	//Implement this as a combinational logic (always at read)

	// assign data_out = read ? memory[address] : 16'bz; //Check this
	assign data_out = memory[address];
	// assign memory[address] = write ? data_in : 1'bz;

//	initial   // Add assembly code here
//        begin
//memory[0] = 10;
//memory[1] = 55;
//memory[2] = 28;
//memory[3] = 77;
//memory[4] = 76;
//memory[5] = 92;
//memory[6] = 12;
//memory[7] = 82;
//memory[8] = 14;
//memory[9] = 99;
//memory[10] = 13;
//memory[11] = 19;
//memory[12] = 76;
//memory[13] = 33;
//memory[14] = 28;
//memory[15] = 2;
//memory[16] = 45;
//memory[17] = 88;
//memory[18] = 15;
//memory[19] = 3;
//memory[20] = 89;
//memory[21] = 44;
//memory[22] = 7;
//memory[23] = 11;
//memory[24] = 44;
//memory[25] = 80;
//memory[26] = 83;
//memory[27] = 98;
//memory[28] = 48;
//memory[29] = 19;
//memory[30] = 7;
//memory[31] = 84;
//memory[32] = 94;
//memory[33] = 45;
//memory[34] = 37;
//memory[35] = 17;
//memory[36] = 83;
//memory[37] = 55;
//memory[38] = 44;
//memory[39] = 3;
//memory[40] = 9;
//memory[41] = 22;
//memory[42] = 86;
//memory[43] = 6;
//memory[44] = 77;
//memory[45] = 99;
//memory[46] = 63;
//memory[47] = 78;
//memory[48] = 32;
//memory[49] = 49;
//memory[50] = 71;
//memory[51] = 33;
//memory[52] = 75;
//memory[53] = 1;
//memory[54] = 38;
//memory[55] = 48;
//memory[56] = 79;
//memory[57] = 75;
//memory[58] = 78;
//memory[59] = 26;
//memory[60] = 46;
//memory[61] = 7;
//memory[62] = 37;
//memory[63] = 82;
//memory[64] = 78;
//memory[65] = 9;
//memory[66] = 6;
//memory[67] = 41;
//memory[68] = 52;
//memory[69] = 45;
//memory[70] = 63;
//memory[71] = 5;
//memory[72] = 80;
//memory[73] = 59;
//memory[74] = 89;
//memory[75] = 32;
//memory[76] = 95;
//memory[77] = 73;
//memory[78] = 3;
//memory[79] = 89;
//memory[80] = 33;
//memory[100] = 57;
//memory[101] = 53;
//memory[102] = 2;
//memory[103] = 68;
//memory[104] = 11;
//memory[105] = 72;
//memory[106] = 5;
//memory[107] = 12;
//memory[108] = 54;
//memory[109] = 69;
//memory[110] = 18;
//memory[111] = 16;
//memory[112] = 79;
//memory[113] = 86;
//memory[114] = 94;
//memory[115] = 19;
//memory[116] = 36;
//memory[117] = 23;
//memory[118] = 52;
//memory[119] = 61;
//memory[120] = 64;
//memory[121] = 51;
//memory[122] = 53;
//memory[123] = 15;
//memory[124] = 5;
//memory[125] = 97;
//memory[126] = 62;
//memory[127] = 4;
//memory[128] = 31;
//memory[129] = 36;
//memory[130] = 44;
//memory[131] = 57;
//memory[132] = 13;
//memory[133] = 58;
//memory[134] = 77;
//memory[135] = 5;
//memory[136] = 55;
//memory[137] = 47;
//memory[138] = 88;
//memory[139] = 36;
//memory[140] = 68;
//memory[141] = 12;
//memory[142] = 68;
//memory[143] = 99;
//memory[144] = 59;
//memory[145] = 92;
//memory[146] = 36;
//memory[147] = 38;
//memory[148] = 82;
//memory[149] = 81;
//memory[150] = 85;
//memory[151] = 86;
//memory[152] = 92;
//memory[153] = 85;
//memory[154] = 5;
//memory[155] = 84;
//memory[156] = 86;
//memory[157] = 49;
//memory[158] = 17;
//memory[159] = 48;
//memory[160] = 84;
//memory[161] = 58;
//memory[162] = 29;
//memory[163] = 73;
//memory[164] = 18;
//memory[165] = 91;
//memory[166] = 59;
//memory[167] = 90;
//memory[168] = 8;
//memory[169] = 86;
//memory[170] = 48;
//memory[171] = 96;
//memory[172] = 11;
//memory[173] = 12;
//memory[174] = 84;
//memory[175] = 7;
//memory[176] = 58;
//memory[177] = 74;
//memory[178] = 44;
//memory[179] = 56;
//memory[180] = 16;
//memory[999] = 1;// save c 
//memory[998] = 9;// save n 
//		end

	always @(posedge clk) 
    begin
		//if (read) data_out <= memory[address];
		if (write) memory[address] <= data_in;
	end

	// assign data_out = memory[address];
	// assign memory[address] = data_in;
	
	initial
		begin
		$readmemb("E:/fpga/MatrixMultiplierProject/io_txt_files/in_ram.txt", memory);
		end
			
	

	
	
endmodule