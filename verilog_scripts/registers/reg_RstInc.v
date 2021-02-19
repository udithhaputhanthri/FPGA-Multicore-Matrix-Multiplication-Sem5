module reg_RstInc(
			clk,
			inc,
			data_out,
			reset
			);
			
		input clk;
		input inc;
		input reset;
		output [15:0] data_out;
		
		reg [15:0] data=16'b0;
		assign data_out = data;
		
		always @(posedge clk)
		begin
			if (inc)
				data = data + 16'd1;
			else if (reset)
				data = 16'b0;
		end
endmodule