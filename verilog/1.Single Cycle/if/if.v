//ECNURVCORE
//Single Cycle CPU
//Created by Chesed
//2021.07.08


module if(

	input 				clk,
	input				rst_n,
	input				jmp_en		,
	input				jmpr_en		,
	input				jmpj_en		,

	input  [31:0]		jmp_to		,

	output [31:0] 		addr_instr	,

	output [31:0]		instr_out
);


	pc if_pc(
		.clk(clk)			,
		.rst_n(rst_n)		,
		.jmp_en	(jmp_en	)	,
		.jmpr_en(jmpr_en)	,
		.jmpb_en(jmpb_en)	,
		.jmp_to	(jmp_to	)	,
		.addr(addr_instr)
	);

	instr if_instr_mem(
		.addr(addr_instr)	,
		.instr_out(instr_out)
	);

endmodule