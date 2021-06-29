module buffer(data_in, select, data_out); 
	input wire [15:0]data_in;
	input select;
	output wire [15:0]data_out; 
	
	reg [15:0]data_temp;
	
	assign data_out=data_temp;
	
	always @(data_in or select)
	begin
	if (select)	
		data_temp=data_in;		
	end
		
endmodule 