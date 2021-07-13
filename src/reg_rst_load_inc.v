module reg_rst_load_inc(
	input clk,
	input inc,
	input load_enable,
	input reset,
    input [15:0] data_in,
		
    output reg [15:0] data_out	
);
			
always @(posedge clk)
    begin
        if (load_enable)
            data_out <= data_in;
        else if (inc)
            data_out <= data_out + 16'd1;   // load_enable and inc doesnt happen at the same time
        
        if (reset)
            data_out <= 16'b0;  //reset is considered in both load_enable and inc
    end
    
endmodule