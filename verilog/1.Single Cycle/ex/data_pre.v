//ECNURVCORE
//Single Cycle CPU
//Created by Chesed
//2021.07.09

module data_pre(

	input	[6:0]		operation	,
	input 	[31:0]		data_rs1	,
	input 	[31:0]		data_rs2	,

	input	[11:0]		imm			,

	output  [31:0]		data_alu1	,
	output  [31:0]		data_alu2	,

);


	wire 	[31:0]	imm_ext;

	assign imm_ext = {{20{imm[11]}},imm[11:0]};

	assign data_alu1 = data_rs1;
	assign data_alu2 = operation[5] ? data_rs2 : imm_ext;

endmodule