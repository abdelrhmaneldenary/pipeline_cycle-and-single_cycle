// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Wed Dec 24 10:42:57 2025"

module singleCycle(
	clk,
	rst,
	test_alu,
	test_inst,
	test_pc
);


input wire	clk;
input wire	rst;
output wire	[15:0] test_alu;
output wire	[15:0] test_inst;
output wire	[15:0] test_pc;

wire	[15:0] inst;
wire	mem_to_reg;
wire	[15:0] pc;
wire	[15:0] read_data2;
wire	[15:0] result;
wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	[2:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	[1:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_12;





adder	b2v_adder(
	.b(pc),
	.y(SYNTHESIZED_WIRE_12));


control_unit	b2v_control_unit(
	.opcode(inst[15:12]),
	.reg_dst(SYNTHESIZED_WIRE_6),
	.reg_write(SYNTHESIZED_WIRE_3),
	.alu_src(SYNTHESIZED_WIRE_0),
	.mem_write(SYNTHESIZED_WIRE_11),
	.mem_to_reg(mem_to_reg),
	.alu_op(SYNTHESIZED_WIRE_10));


mux16	b2v_inst10(
	.sel(SYNTHESIZED_WIRE_0),
	.a(read_data2),
	.b(SYNTHESIZED_WIRE_1),
	.y(SYNTHESIZED_WIRE_9));


mux16	b2v_inst11(
	.sel(mem_to_reg),
	.a(result),
	.b(SYNTHESIZED_WIRE_2),
	.y(SYNTHESIZED_WIRE_4));


instruction_memory	b2v_inst2(
	.pc(pc),
	.instruction(inst));


register_block	b2v_inst4(
	.clk(clk),
	.rst(rst),
	.reg_write(SYNTHESIZED_WIRE_3),
	.read_reg1(inst[11:9]),
	.read_reg2(inst[8:6]),
	.write_data(SYNTHESIZED_WIRE_4),
	.write_reg(SYNTHESIZED_WIRE_5),
	.read_data1(SYNTHESIZED_WIRE_7),
	.read_data2(read_data2));


sign_extend	b2v_inst5(
	.in(inst[5:0]),
	.out(SYNTHESIZED_WIRE_1));


mux3	b2v_inst6(
	.sel(SYNTHESIZED_WIRE_6),
	.a(inst[8:6]),
	.b(inst[5:3]),
	.y(SYNTHESIZED_WIRE_5));


alu	b2v_inst7(
	.a(SYNTHESIZED_WIRE_7),
	.alu_cntrl(SYNTHESIZED_WIRE_8),
	.b(SYNTHESIZED_WIRE_9),
	
	.result(result));


alu_control	b2v_inst8(
	.ALUOp(SYNTHESIZED_WIRE_10),
	.FuncCode(inst[2:0]),
	.ALU_Cntrl(SYNTHESIZED_WIRE_8));


data_memory	b2v_inst9(
	.clk(clk),
	.mem_write(SYNTHESIZED_WIRE_11),
	.address(result),
	.write_data(read_data2),
	.read_data(SYNTHESIZED_WIRE_2));


program_counter	b2v_program_counter_block(
	.clk(clk),
	.rst(rst),
	.pc_next(SYNTHESIZED_WIRE_12),
	.pc(pc));

assign	test_alu = result;
assign	test_inst = inst;
assign	test_pc = pc;

endmodule
