
`timescale 1 ns/10 ps 

module reg_pc_tb;
	
    reg clk;
    reg inc;
    reg load_enable;
    reg reset;
    
    wire [15:0] data_in;
	wire [15:0] data_out;



	reg_pc register(
        .clk(clk),
        .reset(reset),
        .load_enable(load_enable),
        .inc(inc),
        .data_in(data_in),
        .data_out(data_out)
    );

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
	
	
	initial begin
       #50 reset <= 0 ; inc <= 1; data_in <= 0; load_enable = 0; 

       #10 reset <= 0 ; inc <= 0; data_in <= 0; load_enable = 0; 

       #10 reset <= 1 ; inc <= 0; data_in <= 0; load_enable = 0;  

            

       
		
		
	end

endmodule