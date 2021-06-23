`timescale 1 ns/10 ps 

module controller_tb;


    reg clk; 
    reg [15:0] IR;  //Bit number will vary according to the number of instructions
    reg z;
	wire [56:0] OPs;

    localparam CLK_PERIOD = 10;

    controller controller(.clk(clk), .IR(IR), .z(z), .OPs(OPs));

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end


    initial begin
       #10 IR <= 0 ; z <= 0; 
       #10 IR <= 71 ; z <= 1;   //will not change according to IR..Will change values with the clock only
       #10 IR <= 71 ; z <= 1;   //will not change according to IR
       #10 IR <= 71 ; z <= 1;   //will not change according to IR

            
		
	end
	
	
endmodule