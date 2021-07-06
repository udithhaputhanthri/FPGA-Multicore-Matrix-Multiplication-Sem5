module data_memory(
	input write,
	input read,
	input clk,
    input [15:0] address,
	input [15:0] data_in,
	output [15:0] data_out
	); 
	
	reg [15:0] memory [0:1000];  //16 bit memory with 100 locations
	
	//Implement this as a combinational logic (always at read)

	// assign data_out = read ? memory[address] : 16'bz; //Check this
	assign data_out = memory[address];
	// assign memory[address] = write ? data_in : 1'bz;

	initial   // Add assembly code here
        begin
memory[0] = 4;
memory[1] = 4;
memory[2] = 7;
memory[3] = 5;
memory[4] = 7;
memory[5] = 2;
memory[100] = 1;
memory[101] = 8;
memory[102] = 8;
memory[103] = 1;
memory[104] = 3;
memory[105] = 0;
memory[106] = 5;
memory[107] = 5;
memory[108] = 6;
memory[109] = 9;
memory[110] = 4;
memory[111] = 7;
memory[112] = 4;
memory[113] = 4;
memory[114] = 8;
memory[999] = 1;// save c 
memory[998] = 4298;// save n 

		end

	always @(posedge clk) 
    begin
		//if (read) data_out <= memory[address];
		if (write) memory[address] <= data_in;
	end

	// assign data_out = memory[address];
	// assign memory[address] = data_in;

	
	
endmodule