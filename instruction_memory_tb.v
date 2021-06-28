`timescale 1 ns/10 ps 

module instruction_memory_tb;
   
    reg read;
    reg [15:0] address;
    wire [15:0] instruction_out;


    instruction_memory IM(.read(read), .address(address), .instruction_out(instruction_out));


    initial 
        begin
        #10 read <= 1 ; address <= 0;
        #10 read <= 1 ; address <= 1;
        #10 read <= 1 ; address <= 2;
        #10 read <= 1 ; address <= 3;
        #10 read <= 1 ; address <= 4;
        #10 read <= 1 ; address <= 5;
        #10 read <= 1 ; address <= 6;
        #10 read <= 1 ; address <= 7;
        #10 read <= 1 ; address <= 8;
        #10 read <= 1 ; address <= 9;
        #10 read <= 1 ; address <= 10;
        #10 read <= 1 ; address <= 11;
        #10 read <= 1 ; address <= 12;
        #10 read <= 1 ; address <= 13;
        #10 read <= 1 ; address <= 14;
        #10 read <= 1 ; address <= 15;
        #10 read <= 1 ; address <= 16;
        #10 read <= 1 ; address <= 17;
        #10 read <= 1 ; address <= 18;
        #10 read <= 1 ; address <= 19;
        #10 read <= 1 ; address <= 20;
        #10 read <= 1 ; address <= 21;
        #10 read <= 1 ; address <= 22;
        #10 read <= 1 ; address <= 23;
        #10 read <= 1 ; address <= 24;
        #10 read <= 1 ; address <= 25;
        #10 read <= 1 ; address <= 26;
        #10 read <= 1 ; address <= 27;
        #10 read <= 1 ; address <= 28;
        #10 read <= 1 ; address <= 29;
        #10 read <= 1 ; address <= 30;
        #10 read <= 1 ; address <= 31;
        #10 read <= 1 ; address <= 32;
        #10 read <= 1 ; address <= 33;
        #10 read <= 1 ; address <= 34;
        #10 read <= 1 ; address <= 35;
        
        

            
        end
	
	
endmodule