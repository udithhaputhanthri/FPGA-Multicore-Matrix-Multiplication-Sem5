`timescale 1 ns/10 ps 

module microcode_tb;

   reg [15:0] reg_out;
   wire [1:0] condition;
   wire BT;
   wire [58:0] OPs;
   wire [6:0] jump_addr;
	
   microcode micromemory(
      .reg_out(reg_out), 
      .condition(condition), 
      .BT(BT), 
      .OPs(OPs), 
      .jump_addr(jump_addr)
   );	
	
   initial begin
  
     #10 reg_out= 15'd0; 
     #10 reg_out= 15'd1; 
     #10 reg_out= 15'd2; 
     #10 reg_out= 15'd3; 
     #10 reg_out= 15'd4;
     #10 reg_out= 15'd5; 
     #10 reg_out= 15'd6; 
       
end
	
endmodule
