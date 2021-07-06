`timescale 1 ns/10 ps 

module reg_ac_tb;
	
    reg clk;
    reg inc;
	 reg inck;
    reg load_enable;
    reg reset;
	
    reg [15:0] data_in;
	wire [15:0] data_out;

	reg_ac register(
        .clk(clk),
        .inc(inc),
		.inck(inck),
        .load_enable(load_enable),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
	
	
	initial begin
       #10 reset <= 0 ; load_enable <= 0; data_in <= 16'd2; inc <= 0; inck <= 0;

       #10 reset <= 0 ; load_enable <= 1; data_in <= 16'd2; inc <= 0; inck <= 0;

       #10 reset <= 0 ; load_enable <= 0; data_in <= 16'd2; inc <= 1; inck <= 0;

       #10 reset <= 1 ; load_enable <= 0; data_in <= 16'd2; inc <= 1; inck <= 0;
		 
	   #10 reset <= 0 ; load_enable <= 0; data_in <= 16'd2; inc <= 0; inck <= 1;
		 	
	end

endmodule