module buffer(data_in, select, data_out); 
	input data_in, select; 
	output data_out; 
	
	reg data_temp;
	
	assign data_out=data_temp;
	
	always @(data_in)
	begin
	if (select)	
		data_temp=data_in;		
	end
		
endmodule 