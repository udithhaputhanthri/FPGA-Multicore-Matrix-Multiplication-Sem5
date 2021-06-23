module reg_ac(
			clk,
			inc,
			inck,
         load_enable,
			reset,
			data_in,
			data_out		
);
			
        //Control signals
		input clk;
		input inc;
		input inck;
		input load_enable;
		input reset;

        input [15:0] data_in;
		output reg [15:0] data_out;
		
		localparam k=1000; // need to get this externally from memory
		
		always @(posedge clk)
            begin
                if (load_enable)
                    data_out <= data_in;
                else if (inc)
                    data_out <= data_in + 16'd1;
                else if (inck)
                    data_out <= data_in + k;
                if (reset)
                    data_out <= 16'b0;
            end
endmodule