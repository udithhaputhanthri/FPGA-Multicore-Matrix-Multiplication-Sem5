module reg_rst_load(
			clk,
			data_in, 
			data_out, 
			load_enable, 
			reset
	);

	input clk;
	input reset;
	input load_enable;
	input [15:0] data_in;
	output reg [15:0] data_out;
	
	always @(negedge clk)
        begin
            if (load_enable)
                data_out <= data_in;
            if (reset)
                data_out <= 16'b0;
        end
	
endmodule


//Data should be loaded at data_in
//When the load_enable signal is issued, data_in will be passed to data_out 
//Strored data in a register is always avalaiblae at 
//data_out and is connected to a multiplexer
//So we can select whuch register data should be written to the bus
