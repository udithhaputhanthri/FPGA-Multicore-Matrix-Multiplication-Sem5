module ops_decoder(
	input wire [50:0] uOPs,
	input START, RESET,
	//Control signals
	output wire DREAD, IREAD, DWRITE, BUSMEM, MEMBUSD, MEMBUSI, TRBUS, DRBUS,  PCBUS, NBUS,  CBUS, JBUS, 
	output wire IDBUS, COUNTBUS,  TP1BUS, TP2BUS, TP3BUS, ICBUS, IBUS, IEBUS, TR2BUS, ACBUS, LDAR, 
	output wire LDTR, LDDR, LDPC, LDN, LDC, LDIR, LDTP1, LDTP2, LDTP3, LDIC, LDI, LDIE, LDTR2, 
	output wire LDAC, RSTAR, RSTTR, RSTDR, RSTPC, RSTN, RSTC, RSTIR, RSTJ, RSTID, RSTCOUNT, RSTTP1, 
	output wire RSTTP2, RSTTP3, RSTIC, RSTI, RSTIE, RSTTR2, RSTAC, RSTEND, INCPC, INCJ, INCCOUNT, 
	output wire INCTP1, INCTP2, INCI, INCAC, INCEND, ALU0, ALU1, ALU2, ADDKAC,
	output wire [1:0] new_OPs
	);
					  			  
	// reg [48:0] op_reg;

	// always @(uOPs)
	// 	op_reg <= uOPs;	  
	// assign cs1 = OPs[0];
    // assign cs2 = OPs[1] || OPs [2];

	//https://colab.research.google.com/drive/1Fp2aRdjv0eJiq6oBhC8xAu2FdQyix93R?usp=sharing

	// assign DREAD = uOPs[0];
	// assign IREAD = uOPs[1];
	// assign DWRITE = uOPs[10];
	// assign BUSMEM = uOPs[19];
	//assign MEMBUSD = uOPs[30];  //This has an isseu
	//assign MEMBUSI = uOPs[11];  //This has an issue


assign DREAD = uOPs[2];
assign IREAD = uOPs[3];
assign DWRITE = uOPs[12];
assign BUSMEM = uOPs[12];
assign MEMBUSD = uOPs[2];
assign MEMBUSI = uOPs[3];
assign TRBUS = uOPs[47]||uOPs[46]||uOPs[36]||uOPs[11]||uOPs[5];
assign DRBUS = uOPs[41]||uOPs[29]||uOPs[12];
assign PCBUS = uOPs[40];
assign NBUS = uOPs[39];
assign CBUS = uOPs[20];
assign JBUS = uOPs[23];
assign IDBUS = uOPs[35];
assign COUNTBUS = uOPs[14];
assign TP1BUS = uOPs[32];
assign TP2BUS = uOPs[31];
assign TP3BUS = uOPs[30];
assign ICBUS = uOPs[21];
assign IBUS = uOPs[19];
assign IEBUS = uOPs[38];
assign TR2BUS = uOPs[37]||uOPs[22];
assign ACBUS = uOPs[24]||uOPs[4];
assign LDAR = uOPs[41]||uOPs[40]||uOPs[32]||uOPs[31]||uOPs[30];
assign LDTR = uOPs[24]||uOPs[23]||uOPs[22]||uOPs[21]||uOPs[20]||uOPs[19]||uOPs[14];
assign LDDR = uOPs[4]||uOPs[3]||uOPs[2];
assign LDPC = uOPs[27];
assign LDN = uOPs[9];
assign LDC = uOPs[6];
assign LDIR = uOPs[49];
assign LDTP1 = uOPs[13];
assign LDTP2 = uOPs[26];
assign LDTP3 = uOPs[16];
assign LDIC = uOPs[50];
assign LDI = uOPs[43];
assign LDIE = uOPs[45];
assign LDTR2 = uOPs[15];
assign LDAC = uOPs[47]||uOPs[46]||uOPs[39]||uOPs[38]||uOPs[37]||uOPs[36]||uOPs[35]||uOPs[29]||uOPs[11]||uOPs[5];
assign RSTAR = RESET;
assign RSTTR = RESET;
assign RSTDR = RESET;
assign RSTPC = RESET;
assign RSTN = RESET;
assign RSTC = RESET;
assign RSTIR = RESET;
assign RSTJ = uOPs[48]||RESET;
assign RSTID = RESET;
assign RSTCOUNT = uOPs[8]||RESET;
assign RSTTP1 = RESET;
assign RSTTP2 = RESET;
assign RSTTP3 = RESET;
assign RSTIC = RESET;
assign RSTI = RESET;
assign RSTIE = RESET;
assign RSTTR2 = uOPs[18]||RESET;
assign RSTAC = RESET;
assign RSTEND = START||RESET;
assign INCPC = uOPs[28];
assign INCJ = uOPs[10];
assign INCCOUNT = uOPs[7];
assign INCTP1 = uOPs[17];
assign INCTP2 = uOPs[25];
assign INCI = uOPs[44];
assign INCAC = uOPs[33];
assign INCEND = uOPs[42];
assign ALU0 = uOPs[11]||uOPs[5]||uOPs[47];
assign ALU1 = uOPs[36]||uOPs[5];
assign ALU2 = uOPs[46]||uOPs[47];
assign ADDKAC = uOPs[34];
	
	assign new_OPs = uOPs[1:0];
	


	
endmodule

// wire ICAC, IRDR, JZ0, ISMOD, INTDIV, IEAC, IINC, IAC, ENDINC, ARDR, ARPC,
// wire ACN, ACIE, ACTR2, ADD, ACID, ADDK, ACINC, ARTP1, ARTP2, ARTP3, ACDR,
// wire PCINC, PCDR, TP2AC, TP2INC, TRAC, TRJ, TRTR2, TRIC, TRC, TRI, TR2Z0, TP1INC
// wire TP3AC, TR2AC, TRCOUNT, TP1AC, MDDR, MUL, JINC, NDR, COUNTZ0, COUNTINC
// wire CDR, SUB, DRAC, DRMI, DRMD


// DREAD, IREAD,DWRITE, BUSMEM, MEMBUSD, MEMBUSI, DRBUS,  PCBUS, NBUS,  CBUS, JBUS, 
// IDBUS, COUNTBUS,  TP1BUS, TP2BUS, TP3BUS, ICBUS, IBUS, IEBUS, TR2BUS, ACBUS, LDAR, 
// LDTR, LDDR, LDPC, LDN, LDC, LDIR, LDTP1, LDTP2, LDTP3, LDIC, LDI, LDIE, LDTR2, 
// LDAC, RSTAR, RSTTR, RSTDR, RSTPC, RSTN, RSTC, STIR, RSTJ, RSTID, RSTCOUNT, RSTTP1, 
// RSTTP2, RSTTP3, RSTIC, RSTI, RSTIE, RSTTR2, RSTAC, RSTEND, INCPC, INCJ, INCCOUNT, 
// INCTP1, INCTP2, INCI, INCAC, INCEND, ALU0, ALU1, ALU2, ADDKAC