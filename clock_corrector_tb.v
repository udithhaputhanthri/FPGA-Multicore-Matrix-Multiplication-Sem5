`timescale 1 ns/10 ps 

module clock_corrector_tb;


    reg trigger;   
    reg clk;
	wire corrected_clk;

    clock_corrector clock_corrector(.trigger(trigger), .clk(clk), .corrected_clk(corrected_clk));

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    initial 
        begin
		  
        #25 trigger <= 1 ;
            
        end
	
	
endmodule