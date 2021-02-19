// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Thu Feb 18 21:17:44 2021"

module check_data_split(
	in1,
	in2,
	in3,
	out2,
	out5,
	out4,
	out1,
	out3
);


input wire	[3:0] in1;
input wire	[3:0] in2;
input wire	[1:0] in3;
output wire	out2;
output wire	out5;
output wire	out4;
output wire	[2:0] out1;
output wire	[3:0] out3;

wire	[3:0] kkk;

assign	out3 = in2;



assign	out2 = kkk[3];
assign	kkk = in1;
assign	out5 = kkk[1];
assign	out4 = kkk[0];
assign	out1[2:0] = kkk[2:0];
assign	kkk[1:0] = in3;

endmodule
