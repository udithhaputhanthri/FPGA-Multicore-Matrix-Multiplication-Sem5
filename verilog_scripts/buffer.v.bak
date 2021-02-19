module buffer(data_in, select, data_out); 
	input wire data_in, select; 
	output wire data_out; 
	
	reg data_temp;
	
	assign data_out=data_temp;
	
	always @(data_in or select)
	begin
	if (select)	
		data_temp=data_in;		
	end
		
endmodule 