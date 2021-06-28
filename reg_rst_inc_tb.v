
`timescale 1 ns/10 ps 

module reg_rst_inc_tb;
	
    reg clk;
    reg reset;
    reg inc;

	wire [15:0] data_out;



	reg_rst_inc register(
        .clk(clk),
        .reset(reset),
        .inc(inc),
        .data_out(data_out)
    );

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
	
	
	initial begin
       #10 reset <= 1 ; inc <= 0; 

       #10 reset <= 0 ; inc <= 1; 

        #10 reset <= 0 ; inc <= 1; 

            

       
		
		
	end

endmodule