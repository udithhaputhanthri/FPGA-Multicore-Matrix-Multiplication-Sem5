
//Not finished

module memory_mux(
	input [15:0] map_addr,
	input [6:0] jump_addr,
	input [15:0] inc_addr,
	input [1:0] select,
	output reg [15:0] reg_in
	);

    // initial reg_in = 16'd1;
	
	always @(map_addr or jump_addr or inc_addr or select)
        begin
            case(select)
            
                    0:reg_in    <=   inc_addr;
                    1:reg_in    <=   jump_addr;
                    2:reg_in    <=   map_addr;//check what happens when select is 3
                default: reg_in <=   jump_addr;
                
            endcase
        end
				  
endmodule	