module reg_pc(
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
                if (inc)
                    data_out <= data_out + 16'd1;
                if (reset)
                    data_out <= 16'b0;
            end
        initial begin
            data_out = 0;
        end
endmodule