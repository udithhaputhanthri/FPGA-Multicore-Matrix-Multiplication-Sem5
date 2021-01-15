module write_to_reg(
						reg_select,
						tp1,
						tp2, 
						ac
						);
						
						
	input [3:0] reg_select;  //input should be given by Control unit
	output tp1, tp2, ac;  //output is the chosen register and it should be conneted to load enable of that particular register

	
	localparam TP1 = 4'd1;
	localparam TP2 = 4'd2;
	localparam AC = 4'd3;
				  
				  
				   
	assign tp1 = (reg_select == TP1)? 1'b1 : 0;
	assign tp2 = (reg_select == TP2)? 1'b1 : 0;
	assign ac = (reg_select == AC)? 1'b1 : 0;
	
	
endmodule