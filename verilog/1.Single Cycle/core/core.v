//ECNURVCORE
//Single Cycle CPU
//Created by Chesed
//2021.07.09

module core(
	input	clk		,
	input	rst_n	,

);

wire [31:0] 	instr;
wire [6:0]		operation;
wire [4:0]		addr_rd;
wire [4:0]		addr_rs1;
wire [4:0]		addr_rs2;
wire [2:0]		funct3;
wire [6:0]		funct7;

wire [11:0]		imm;
wire [31:0]		jmp;
wire [31:0]		jmp_to;

wire [31:0]		data_rs1;
wire [31:0]		data_rs2;

wire [31:0]		data_out;
wire [31:0]		data_wr;

wire 			jmp_en;
wire 			jmpr_en;
wire 			jmpb_en;


wire 			wr_en;
wire			shift_ctrl;
wire			sub_ctrl;

if cpu_if(

	.clk		(clk),
	.rst_n		(rst_n),
	.jmp_en		(jmp_en	),
	.jmpr_en	(jmpr_en),
	.jmpj_en	(jmpb_en),
	.jmp_to		(jmp_to	),

	.instr_out	(instr)
);


id cpu_id(
	.instr_in	(instr),

	.operation	(operation),
	.rd			(addr_rd),
	.funct3		(funct3),	
	.rs1		(addr_rs1),
	.rs2		(addr_rs2),
	.funct7		(funct7),

	.imm		(imm),
	.jmp		(jmp),

);

reg general_reg(
	.clk		(clk),
	.rst_n		(rst_n),

	.wr_en		(wr_en),

	.addr_wr	(addr_rd),
	.addr_rd1	(addr_rs1),
	.addr_rd2	(addr_rs2),
	.data_wr	(data_wr),


	.data_rd1	(data_rs1),
	.data_rd2	(data_rs2)

);

ex cpu_ex(
	
	.operation	(operation),
	.data_rs1	(data_rs1),
	.data_rs2	(data_rs2),
	.jmp		(jmp),

	.imm		(imm),

	.funct3		(funct3),
	.shift_ctrl	(shift_ctrl),
	.sub_ctrl	(sub_ctrl),

	.data_out	(data_out),
	.jmp_to 	(jmp_to)
);

ctrl cpu_ctrl(

	.data_rs1	(data_rs1),
	.data_rs2	(data_rs2),
	.operation	(operation),


	.funct3		(funct3),
	.funct7		(funct7),


	.load_en	()	,
	.store_en	(),
	.wr_en		(wr_en),

	.jmp_en		(jmp_en),
	.jmpr_en	(jmpr_en)	,
	.jmpb_en	(jmpb_en)	,

	.shift_ctrl	(shift_ctrl),
	.sub_ctrl	(sub_ctrl)

);

module wb(
	.data_out	(data_out),
	.data_addr	(),
	.data_mem	(),
	.operation	(operation),

	.data_wr	(data_wr)
);


endmodule