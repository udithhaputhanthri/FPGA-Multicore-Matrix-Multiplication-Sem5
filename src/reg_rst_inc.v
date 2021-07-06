module reg_rst_inc(
	input clk,
	input inc,
	input reset,

	output reg [15:0] data_out
);
			    
always @(posedge clk)
    begin        
        if (inc)
            data_out <= data_out + 16'd1;
        if (reset)
            data_out <= 16'b0;
    end

endmodule