`timescale 1 ns/10 ps 

module tb_mux2_CU;
	//reg z;
	//reg [1:0] select;
	//wire logic_in;
	
	//mux2_ControlUnit mux2_CU(.z(z),.select(select),.logic_in(logic_in));
	
	
	//initial begin
	//z=0; select= 0; #10;
	//z=0; select= 1; #10;
	//z=0; select= 2; #10;
	//z=0; select= 3; #10;
	//end
	
	

	reg [15:0] reg_out;
	wire [1:0] condition;
	wire BT;
	wire [50:0] OPs=0;
	wire [15:0] jump_addr;
	
	microcode micromemory(.reg_out(reg_out), .condition(condition), .BT(BT), .OPs(OPs), .jump_addr(jump_addr));	
	
	initial begin
	reg_out=0; #10;
	reg_out=1; #10;
	reg_out=2; #10;
	reg_out=3; #10;
	reg_out=4; #10;
	reg_out=5; #10;
	reg_out=6; #10;
	reg_out=7; #10;

	end
	
endmodule
