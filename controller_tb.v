`timescale 1 ns/10 ps 

module controller_tb;


    reg clk; 
    reg [15:0] IR;  
    reg z;
	wire [48:0] OPs;

    localparam CLK_PERIOD = 10;

    controller controller(.clk(clk), .IR(IR), .z(z), .OPs(OPs));

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end


    initial begin
       #10 IR <= 0 ; z <= 0; 
       #10 IR <= 21 ; z <= 0;   
       #10 IR <= 21 ; z <= 0;   
       #10 IR <= 21 ; z <= 0;   
	
	end
	
	
endmodule