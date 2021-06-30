module clock_corrector(trigger, clk, corrected_clk);

    input trigger;   
    input clk;
	output corrected_clk;
	
    reg start =  0;
	 
    always @(negedge clk)
	 
		 begin
			if (trigger) 
				start <= 1;
		 end
	 
    assign corrected_clk = (start && clk);

endmodule
