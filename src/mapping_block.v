module mapping_block(
	input [15:0] IR,   
    output reg [15:0] map_addr
);

//Instructions
localparam SETN = 0;
localparam SETC = 1;
localparam SETTP1 = 2;
localparam SETTP2 = 3;
localparam SETTP3 = 4;
localparam RNGI = 5;
localparam STRTI = 6;
localparam ENDI = 7;
localparam LDACTP1 = 8;
localparam LDACTP2 = 9;
localparam LDACTP3 = 10;
localparam LDN = 11;
localparam LDTR2 = 28;
localparam MVACTR = 12;
localparam MVACTR2 = 27;
localparam MVCOUNT = 13;
localparam MVJ = 14;
localparam MVI = 15;
localparam MVIE = 16;
localparam MVTR2 = 26;
localparam STAC = 20;
localparam JNPZ = 21;
localparam JNPZY = 22;
localparam JNPZN = 23;
localparam RSTJ = 24;
localparam END = 25;
localparam MUL_ = 17;
localparam ADD_ = 18;
localparam SUB_ = 19;
localparam NEW_ = 30; // added new

//Mapping algorithm
always @(IR)
	begin
		case(IR)
			SETN: map_addr <= 3;
			SETC: map_addr <= 7;
			SETTP1: map_addr <= 11;
			SETTP2: map_addr <= 15;
			SETTP3: map_addr <= 20;
			RNGI: map_addr <= 28;
			STRTI: map_addr <= 37;
			ENDI: map_addr <= 41;
			LDACTP1: map_addr <= 45;
			LDACTP2: map_addr <= 48;
			LDACTP3: map_addr <= 51;
			LDN: map_addr <= 54;
			LDTR2: map_addr <= 55;
			MVACTR: map_addr <= 56;
			MVACTR2: map_addr <= 57;
			MVCOUNT: map_addr <= 58;
			MVJ: map_addr <= 59;
			MVI: map_addr <= 60;
			MVIE: map_addr <= 61;
			MVTR2: map_addr <= 62;
			STAC: map_addr <= 63;
			JNPZ: map_addr <= 66;
			JNPZY: map_addr <=67;
			JNPZN: map_addr <= 69;
			RSTJ: map_addr <= 70;
			END: map_addr <= 71;
			MUL_: map_addr <= 72;
			ADD_: map_addr <= 73;
			SUB_: map_addr <= 74;
			NEW_: map_addr <= 75; //added new
		endcase
	end

endmodule