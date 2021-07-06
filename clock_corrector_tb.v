`timescale 1 ns/10 ps 

module clock_corrector_tb;

    reg start;   
    reg clk;
	wire corrected_clk;

    clock_corrector_module clock_corrector(
        .start(start), 
        .clk(clk), 
        .corrected_clk(corrected_clk)
    );

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    initial 
        begin 
            #20 start <= 1 ;      
        end
	
endmodule