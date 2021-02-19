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
// CREATED		"Thu Feb 18 21:01:19 2021"

module check_reg(
	clk,
	inc,
	load_enable,
	reset,
	data_in,
	data_out
);


input wire	clk;
input wire	inc;
input wire	load_enable;
input wire	reset;
input wire	[15:0] data_in;
output wire	[15:0] data_out;






reg_RstIncLd	b2v_inst(
	.clk(clk),
	.inc(inc),
	.load_enable(load_enable),
	.reset(reset),
	.data_in(data_in),
	.data_out(data_out));


endmodule
