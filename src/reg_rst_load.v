module reg_rst_load(
	input clk,
	input reset,
	input load_enable,
	input [15:0] data_in,

	output reg [15:0] data_out
);

always @(posedge clk)
    begin
        if (load_enable)
            data_out <= data_in;
        if (reset)
            data_out <= 16'b0;
    end
	
endmodule
