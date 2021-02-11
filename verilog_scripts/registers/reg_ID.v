module reg_ID(
			clk,
			data_out,
			reset
			);
			
			output data_out;
			input clk;
			input reset;
			
			reg [15:0] data=16'b0;
			assign data_out= data;
			
			
endmodule