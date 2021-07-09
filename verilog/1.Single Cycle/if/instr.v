//ECNURVCORE
//Single Cycle CPU
//Created by Chesed
//2021.07.08




module instr(

	input 				addr,

	output reg [31:0]	instr_out
);

	always@(addr) begin
		case(addr)

			/*here is the instr*/

			default:	begin
							instr_out <= 32'h0;
						end
		endcase
	end
endmodule