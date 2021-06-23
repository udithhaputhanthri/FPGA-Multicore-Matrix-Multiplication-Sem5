module data_memory(
	input write,
	input read,
    input [15:0] address,
	input [15:0] data_in,
	output reg [15:0] data_out
	); 
	
	reg [15:0] memory [0:99];  //16 bit memory with 100 locations
	
	
	always @(address or data_in) 
    begin
		if (read) data_out <= memory[address];
		else if (write) memory[address] <= data_in;
	end
	
	
endmodule