
module mux1_ControlUnit(
	input wire[15:0] map_addr,
	input wire[15:0] jump_addr,
	input wire[15:0] inc_addr,
	input wire[1:0] select,
	output wire[15:0] reg_in
	);
	
	reg[15:0]out_tmp; 
	assign reg_in= out_tmp;
	
	always @(map_addr or jump_addr or inc_addr or select)
	begin
		case(select)
			0:out_tmp=inc_addr;
			1:out_tmp=jump_addr;
			2:out_tmp=map_addr;
			default: out_tmp=jump_addr;
		endcase
	end
				  
endmodule	