`timescale 1 ns/10 ps 

module data_memory_tb;


    reg write;   
    reg read;
	reg clk;
    reg [15:0] address;
    reg [15:0] data_in;
    wire [15:0] data_out;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    data_memory DM(.write(write), .read(read), .clk(clk), .address(address),
    .data_in(data_in), .data_out(data_out)
    );


    initial 
        begin
        #11 write <= 0 ; read <= 1 ; address <= 0; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 1; data_in <= 0; 
        #10 write <= 0 ; read <= 1 ; address <= 2; data_in <= 0; 
        #10 write <= 0 ; read <= 1 ; address <= 3; data_in <= 0; 
        #10 write <= 0 ; read <= 1 ; address <= 4; data_in <= 0; 
        #10 write <= 0 ; read <= 1 ; address <= 5; data_in <= 0; 
        #10 write <= 0 ; read <= 1 ; address <= 6; data_in <= 0; 
        #10 write <= 0 ; read <= 1 ; address <= 7; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 8; data_in <= 0; 


        #10 write <= 0 ; read <= 1 ; address <= 100; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 101; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 102; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 103; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 104; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 105; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 106; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 107; data_in <= 0;

        #10 write <= 0 ; read <= 1 ; address <= 999; data_in <= 0;
        #10 write <= 0 ; read <= 1 ; address <= 998; data_in <= 0;

            
        end
	
	
endmodule