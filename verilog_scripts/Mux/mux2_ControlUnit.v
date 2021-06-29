
module mux2_ControlUnit(
	input z,
	input [1:0] select,
	output logic_in,
	output [2:0]test
	);
	
	
	reg out_tmp; 
	assign logic_in= out_tmp;
	
	
	always @(z or select)
	begin
		case(select)
			0:out_tmp=1;
			1:out_tmp=z;
			2:out_tmp=~z;
			default:out_tmp= 1;
		endcase
	end
	
	reg [2:0]test_temp;
	assign test= test_temp;
	
	always @(z or select)
		test_temp=5;
				  
endmodule	