`timescale 1 ns/10 ps 

module data_memory_multi_port_tb;

    reg [15:0] data_in_1;
	reg [15:0] data_in_2;
	reg [15:0]data_in_3;
	reg [15:0]data_in_4;
	reg [15:0] addr_1;
	reg [15:0] addr_2;
	reg [15:0]addr_3;
	reg [15:0]addr_4;
	reg we_1; 
	reg we_2;
	reg we_3; 
	reg we_4; 
	reg clk;
	wire [15:0] data_out_1;
	wire [15:0] data_out_2;
	wire [15:0] data_out_3;
	wire [15:0] data_out_4;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;   
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    data_memory_multi_port multiport_mem(
        .data_in_1(data_in_1),
        .data_in_2(data_in_2),
        .data_in_3(data_in_3),
        .data_in_4(data_in_4),
        .addr_1(addr_1),
        .addr_2(addr_2),
        .addr_3(addr_3),
        .addr_4(addr_4),
        .we_1(we_1),
        .we_2(we_2),
        .we_3(we_3),
        .we_4(we_4),
        .clk(clk),
        .data_out_1(data_out_1),
        .data_out_2(data_out_2),
        .data_out_3(data_out_3),
        .data_out_4(data_out_4)
    );

initial begin

    #10 we_1 = 1;  we_2 = 0; we_3 = 0; we_4 = 0; data_in_1= 1; addr_1 = 10; data_in_2= 0; addr_2 = 0; data_in_3= 0; addr_3 = 0; data_in_4= 0; addr_4 = 0;
        
    #10 we_1 = 1;  we_2 = 1; we_3 = 1; we_4 = 1; data_in_1= 1; addr_1 = 10; data_in_2= 2; addr_2 = 20; data_in_3= 3; addr_3 = 30; data_in_4= 4; addr_4 = 40;

    #10 we_1 = 0;  we_2 = 0; we_3 = 0; we_4 = 0; data_in_1= 0; addr_1 = 20; data_in_2= 2; addr_2 = 20; data_in_3= 3; addr_3 = 30; data_in_4= 4; addr_4 = 40;
       
end
			  
endmodule	