module clock_corrector_new(
    input start, 
    input clk,
    input end_signal,
	output corrected_clk
);


	
    reg p =  0;
	 
    always @(posedge clk)
	 
		 begin
			if (start) 
				p <= 1;
		 end
	 
    assign corrected_clk = (p && !end_signal) ? clk : 0;


endmodule
