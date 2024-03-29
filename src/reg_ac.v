module reg_ac(
	input clk,
	input inc,
	input inck,
	input load_enable,
	input reset,

    input [15:0] data_in,
	output reg [15:0] data_out
);
						
localparam k=332; 
		
always @(posedge clk)
    begin
        if (load_enable)
            data_out <= data_in;
        if (inc)
            data_out <= data_out + 16'd1;
        if (inck)
            data_out <= data_out + k;
        if (reset)
            data_out <= 16'b0;
    end

endmodule