module reg_rst_load_inc(
			clk,
			inc,
            load_enable,
			reset,
			data_in,
			data_out		
);
			
        //Control signals
		input clk;
		input inc;
		input load_enable;
		input reset;

        input [15:0] data_in;
		output reg [15:0] data_out;
		
		always @(posedge clk)
            begin
                if (load_enable)
                    data_out <= data_in;
                else if (inc)
                    data_out <= data_in + 16'd1;
                if (reset)
                    data_out <= 16'b0;
            end
endmodule