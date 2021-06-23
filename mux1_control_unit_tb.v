`timescale 1 ns/10 ps 

module mux1_control_unit_tb;
	
    reg [15:0] map_addr;
	reg [6:0] jump_addr;
    reg [15:0] inc_addr;
    reg [1:0] select;
	wire [15:0] reg_in;
	
	mux1_control_unit mux1_control_unit(
        .map_addr(map_addr),
        .jump_addr(jump_addr),
        .inc_addr(inc_addr),
        .select(select),
        .reg_in(reg_in)
    );
	
	
	initial begin
        #10 map_addr=1 ; jump_addr= 45; inc_addr= 3 ; select= 0 ;
		#10 map_addr=1 ; jump_addr= 45; inc_addr= 3 ; select= 1 ; 
		#10 map_addr=1 ; jump_addr= 45; inc_addr= 3 ; select= 2 ;
		
	end

endmodule