module Mux(
	input wire [3:0] select,
	input wire [15:0] tp1,tp2,
	output wire [15:0] data_out
	);
	
	localparam TP1 = 4'd1;//..register gana anuwa issrhat 4 newei gana anuwa daganna puluwan methanadi 16k inouts puluwan mux ekata
	localparam TP2 = 4'd2;
				  
				  
	reg [15:0] data;
	assign data_out = data;
	
	always @(select or tp1 or tp2)
	
	begin
		case(select)
			TP1 : data = tp1;
			TP2 : data = tp2;
			default : data = 0;
			
		endcase
	end
				  
endmodule	