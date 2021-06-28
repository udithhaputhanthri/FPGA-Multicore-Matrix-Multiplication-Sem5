module ops_decoder(
	input wire [48:0] uOPs,
	input START, RESET,
	//Control signals
	output wire DREAD, IREAD, DWRITE, BUSMEM, MEMBUSD, MEMBUSI, TRBUS, DRBUS,  PCBUS, NBUS,  CBUS, JBUS, 
	output wire IDBUS, COUNTBUS,  TP1BUS, TP2BUS, TP3BUS, ICBUS, IBUS, IEBUS, TR2BUS, ACBUS, LDAR, 
	output wire LDTR, LDDR, LDPC, LDN, LDC, LDIR, LDTP1, LDTP2, LDTP3, LDIC, LDI, LDIE, LDTR2, 
	output wire LDAC, RSTAR, RSTTR, RSTDR, RSTPC, RSTN, RSTC, RSTIR, RSTJ, RSTID, RSTCOUNT, RSTTP1, 
	output wire RSTTP2, RSTTP3, RSTIC, RSTI, RSTIE, RSTTR2, RSTAC, RSTEND, INCPC, INCJ, INCCOUNT, 
	output wire INCTP1, INCTP2, INCI, INCAC, INCEND, ALU0, ALU1, ALU2, ADDKAC
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

		
	assign DREAD = uOPs[0];
	assign IREAD = uOPs[1];
	assign DWRITE = uOPs[10];
	assign BUSMEM = uOPs[10];
	assign MEMBUSD = uOPs[0];
	assign MEMBUSI = uOPs[1];
	assign TRBUS = uOPs[45]||uOPs[44]||uOPs[34]||uOPs[9]||uOPs[3];
	assign DRBUS = uOPs[39]||uOPs[27]||uOPs[10];
	assign PCBUS = uOPs[38];
	assign NBUS = uOPs[37];
	assign CBUS = uOPs[18];
	assign JBUS = uOPs[21];
	assign IDBUS = uOPs[33]; //This has an issue
	assign COUNTBUS = uOPs[12];
	assign TP1BUS = uOPs[30];
	assign TP2BUS = uOPs[29];
	assign TP3BUS = uOPs[28];
	assign ICBUS = uOPs[19];
	assign IBUS = uOPs[17];
	assign IEBUS = uOPs[36];
	assign TR2BUS = uOPs[35]||uOPs[20];
	assign ACBUS = uOPs[22]||uOPs[2];
	assign LDAR = uOPs[39]||uOPs[38]||uOPs[30]||uOPs[29]||uOPs[28];
	assign LDTR = uOPs[22]||uOPs[21]||uOPs[20]||uOPs[19]||uOPs[18]||uOPs[17]||uOPs[12];
	assign LDDR = uOPs[2]||uOPs[1]||uOPs[0];
	assign LDPC = uOPs[25];
	assign LDN = uOPs[7];
	assign LDC = uOPs[4];
	assign LDIR = uOPs[47];
	assign LDTP1 = uOPs[11];
	assign LDTP2 = uOPs[24];
	assign LDTP3 = uOPs[14];
	assign LDIC = uOPs[48];
	assign LDI = uOPs[41];
	assign LDIE = uOPs[43];
	assign LDTR2 = uOPs[13];
	assign LDAC = uOPs[45]||uOPs[44]||uOPs[37]||uOPs[36]||uOPs[35]||uOPs[34]||uOPs[33]||uOPs[27]||uOPs[9]||uOPs[3];
	assign RSTAR = RESET;
	assign RSTTR = RESET;
	assign RSTDR = RESET;
	assign RSTPC = RESET;
	assign RSTN = RESET;
	assign RSTC = RESET;
	assign RSTIR = RESET;
	assign RSTJ = uOPs[46]||RESET;
	assign RSTID = 0; // Check thi
	assign RSTCOUNT = uOPs[6]||RESET;
	assign RSTTP1 = RESET;
	assign RSTTP2 = RESET;
	assign RSTTP3 = RESET;
	assign RSTIC = RESET;
	assign RSTI = RESET;
	assign RSTIE = RESET;
	assign RSTTR2 = uOPs[16]||RESET;
	assign RSTAC = RESET;
	assign RSTEND = START||RESET;
	assign INCPC = uOPs[26];
	assign INCJ = uOPs[8];
	assign INCCOUNT = uOPs[5];
	assign INCTP1 = uOPs[15];
	assign INCTP2 = uOPs[23];
	assign INCI = uOPs[42];
	assign INCAC = uOPs[31];
	assign INCEND = uOPs[40];
	assign ALU0 = uOPs[9]||uOPs[3]||uOPs[45];
	assign ALU1 = uOPs[34]||uOPs[3];
	assign ALU2 = uOPs[44]||uOPs[45];
	assign ADDKAC = uOPs[32];

	
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