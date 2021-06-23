module instruction_memory(
	input read,
	input [15:0] address,
	output reg [15:0] instruction_out
	); 
	
	reg [15:0] inst_memory [0:99];  //Depends on no of instructions    
	
    initial   // Add assembly code here
        begin
            inst_memory[0] = 16'd1;
            inst_memory[1] = 16'd2;
            inst_memory[2] = 16'd3;
        end
	
	always @(address) 
        begin
            if (read) instruction_out = inst_memory[address];
        end
	
	
	
endmodule