`timescale 1 ns/10 ps 

module alu_tb;

	reg [15:0] in_bus;
	reg [15:0] in_AC;
	reg [2:0] operation;
	wire [15:0] data_out;
	
	alu alu_test(.in_bus(in_bus), 
    .in_AC(in_AC), 
    .operation(operation), 
    .data_out(data_out)
    );	
	
	initial begin
		#100 in_bus=15'd2 ; in_AC= 15'd5; operation=0 ;
		#100 in_bus=15'd2 ; in_AC= 15'd5; operation=1 ; 
		#100 in_bus=15'd2 ; in_AC= 15'd5; operation=2 ;
		#100 in_bus=15'd2 ; in_AC= 15'd5; operation=3 ;
		#100 in_bus=15'd2 ; in_AC= 15'd5; operation=4 ;
		#100 in_bus=15'd2 ; in_AC= 15'd5; operation=5 ; 

	end
	
endmodule
