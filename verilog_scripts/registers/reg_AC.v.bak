module reg_AC(
			clk,
			inc,
			inck,
			data_in,
			data_out,
			load_enable,
			reset
			);
			
		input clk;
		input inc;
		input inck;
		input [15:0] data_in;
		input load_enable;
		input reset;
		output data_out;
		
		localparam k=1000; // need to get this externally from memory
		
		reg [15:0] data;
		assign data_out = data;
		
		always @(posedge clk)
		begin
			if (load_enable)
				data = data_in;
			else if (inc)
				data = data + 16'd1;
			else if (inck)
				data = data + k;
			else if (reset)
				data = 16'b0;
		end
endmodule