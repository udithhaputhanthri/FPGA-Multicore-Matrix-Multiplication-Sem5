module clock_corrector_new(
    input start, 
    input clk,
	output corrected_clk
);


	
    reg p =  0;
	 
    always @(posedge clk)
	 
		 begin
			if (start) 
				p <= 1;
		 end
	 
    assign corrected_clk = p ? clk : 0;


endmodule
