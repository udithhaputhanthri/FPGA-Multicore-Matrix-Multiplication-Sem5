module increment_register_16bit(
			clk,
			inc,
			data_in,
			data_out,
			load_enable,
			reset
			);
			
		input clk;
		input inc;
		input [15:0] data_in;
		input load_enable;
		input reset;
		output data_out;
		
		reg [15:0] data;
		assign data_out = data;
		
		always @(posedge clk)
		begin
			if (load_enable)
				data = data_in;
			else if (inc)
				data = data + 16'd1;
			else if (reset)
				data = 16'b0;
		end
endmodule