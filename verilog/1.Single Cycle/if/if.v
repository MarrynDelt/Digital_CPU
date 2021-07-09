//ECNURVCORE
//Single Cycle CPU
//Created by Chesed
//2021.07.08


module if(

	input 				clk,
	input				rst_n,

	output [31:0]		instr_out
);

	wire addr_instr;

	pc if_pc(
		.clk(clk)			,
		.rst_n(rst_n)		,
		.addr(addr_instr)
	);

	instr if_instr_mem(
		.addr(addr_instr)	,
		.instr_out(instr_out)
	);

endmodule