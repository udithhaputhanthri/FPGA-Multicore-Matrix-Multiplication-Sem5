module instruction_memory(
	input read,
	input [15:0] address,
	output [15:0] instruction_out
	); 
	
	reg [15:0] inst_memory [0:99];  //Depends on no of instructions    
	
    initial   // Add assembly code here
        begin
            inst_memory[0] = 0;      //SETN
            inst_memory[1] = 998 ;   //Address N
            inst_memory[2] = 1 ;     //SETC
            inst_memory[3] = 999;    //Address C
            inst_memory[4] = 5 ;     //RNGI
            inst_memory[5] = 7 ;     //ENDI
            inst_memory[6] = 6 ;     //STRTI
            inst_memory[7] = 24 ;    //RSTJ
            inst_memory[8] = 2  ;    //SETTP1
            inst_memory[9] = 3 ;     //SETTP2
            inst_memory[10] = 4 ;   //SETTP3
            inst_memory[11] = 8  ;  //LDACTP1
            inst_memory[12] = 12;    //MVACTR
            inst_memory[13] = 9 ;   //LDACTP2
            inst_memory[14] = 17 ;   //MUL
            inst_memory[15] = 26 ;   //MVTR2
            inst_memory[16] = 18 ;   //ADD
            inst_memory[17] = 27 ;   //MVACTR2
            inst_memory[18] = 13 ;   //MVCOUNT
            inst_memory[19] = 11 ;   //LDN
            inst_memory[20] = 19 ;   //SUB
            inst_memory[21] = 21;    //JNPZ
            inst_memory[22] = 11 ;   // 11
            inst_memory[23] = 28 ;   //LDTR2
            inst_memory[24] = 20 ;   //STAC
            inst_memory[25] = 14 ;   //MVJ
            inst_memory[26] = 11 ;   //LDN
            inst_memory[27] = 19 ;   //SUB
            inst_memory[28] = 21 ;   //JNPZ
            inst_memory[29] = 8 ;    //8
            inst_memory[30] = 16 ;   //MVIE
            inst_memory[31] = 15 ;   //MVI
            inst_memory[32] = 19 ;   //SUB
            inst_memory[33] = 21 ;   //JNPZ
            inst_memory[34] = 7  ;   //7
            inst_memory[35] = 25 ;   //END

        end
	
    assign instruction_out = inst_memory[address];
	// always @(address) 
    //     begin
    //         if (read) instruction_out = inst_memory[address];
    //     end
	
	
	
endmodule