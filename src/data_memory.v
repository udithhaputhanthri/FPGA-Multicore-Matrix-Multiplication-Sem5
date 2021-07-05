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

	 initial   // Add assembly code here
         begin
			
			memory[0] = 1;
			memory[1] = 2;
			memory[2] = 3;
			memory[3] = 4;
			memory[4] = 4;
			memory[5] = 4;
			memory[6] = 5;
			memory[7] = 6;
			memory[8] = 4;
			memory[9] = 4;
			memory[10] = 7;
			memory[11] = 8;
			memory[12] = 9;
			memory[13] = 3;
			memory[14] = 2;
			memory[15] = 7;
			memory[16] = 8;
			memory[17] = 9;
			memory[18] = 3;
			memory[19] = 2;
			memory[20] = 7;
			memory[21] = 8;
			memory[22] = 9;
			memory[23] = 3;
			memory[24] = 2;
			memory[332] = 1;
			memory[333] = 1;
			memory[334] = 1;
			memory[335] = 7;
			memory[336] = 7;
			memory[337] = 1;
			memory[338] = 8;
			memory[339] = 8;
			memory[340] = 8;
			memory[341] = 5;
			memory[342] = 1;
			memory[343] = 1;
			memory[344] = 1;
			memory[345] = 4;
			memory[346] = 9;
			memory[347] = 3;
			memory[348] = 3;
			memory[349] = 3;
			memory[350] = 4;
			memory[351] = 4;
			memory[352] = 1;
			memory[353] = 1;
			memory[354] = 2;
			memory[355] = 2;
			memory[356] = 2;
			memory[999] = 1;// save c 
			memory[998] = 5;// save n 
	// 		memory[0] = 1;
	// 		memory[1] = 2;
	// 		memory[2] = 3;
	// 		memory[3] = 4;
	// 		memory[4] = 5;
	// 		memory[5] = 6;
	// 		memory[6] = 7;
	// 		memory[7] = 8;
	// 		memory[8] = 9;
	// 		memory[100] = 10;
	// 		memory[101] = 13;
	// 		memory[102] = 16;
	// 		memory[103] = 11;
	// 		memory[104] = 14;
	// 		memory[105] = 17;
	// 		memory[106] = 12;
	// 		memory[107] = 15;
	// 		memory[108] = 18;
	// 		memory[999] = 1; // save c 
	// 		memory[998] = 3; // save n
	 	end

	always @(posedge clk) 
    begin
		//if (read) data_out <= memory[address];
		if (write) memory[address] <= data_in;
	end

	// assign data_out = memory[address];
	// assign memory[address] = data_in;


	
	
endmodule