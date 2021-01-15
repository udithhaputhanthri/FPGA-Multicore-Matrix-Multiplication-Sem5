module Register_8bit(
			clk,
			data_in, 
			data_out, 
			load_enable, 
			reset
			);

	input clk;
	input reset;
	input load_enable;
	input [7:0] data_in;
	output [7:0] data_out;
	
	reg [7:0] data;
	assign data_out = data;
	
	always @(posedge clk)
	
	begin
	
	if (load_enable)
		data = data_in;
	else if (reset)
		data = 8'b0;
	end
	
endmodule

//Strored data in a register is always avalaiblae at 
//data_out and is connected to a multiplexer
//So we can select whuch register data should be written to the bus

