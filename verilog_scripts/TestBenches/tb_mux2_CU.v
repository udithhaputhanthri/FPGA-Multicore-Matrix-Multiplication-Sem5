`timescale 1 ns/10 ps 

module tb_mux2_CU;
	reg z;
	reg [1:0] select;
	wire logic_in;
	wire [2:0]test;
	
	mux2_ControlUnit mux2_CU(.z(z),.select(select),.logic_in(logic_in), .test(test));
	
	initial begin
	z=0; select= 0; #10;
	z=0; select= 1; #10;
	z=0; select= 2; #10;
	z=0; select= 3; #10;
	end
	
endmodule
