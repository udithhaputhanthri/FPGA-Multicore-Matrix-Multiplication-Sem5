`timescale 1 ns/10 ps 

module reg_rst_load_tb;
	
    reg clk;
    reg reset;
	reg load_enable;
    reg [15:0] data_in;
	wire [15:0] data_out;

	reg_rst_load register(
        .clk(clk),
        .reset(reset),
        .load_enable(load_enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
	
	initial begin
       #10 reset <= 0 ; load_enable <= 0; data_in <= 16'd2; 

       #10 reset <= 0 ; load_enable <= 1; data_in <= 16'd2;

       #10 reset <= 0 ; load_enable <= 1; data_in <= 16'd5;

       #10 reset <= 1 ; load_enable <= 1; data_in <= 16'd2;
        
	end

endmodule