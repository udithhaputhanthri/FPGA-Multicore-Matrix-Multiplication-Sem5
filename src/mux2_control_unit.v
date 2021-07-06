module mux2_control_unit(
	input z,
	input [1:0] select,
	output reg logic_in
);
	
always @(z or select)
	begin
		case(select)
			0:logic_in=1;
			1:logic_in=z;
			2:logic_in=~z;
			default:logic_in= 1;
		endcase
	end
				  
endmodule	