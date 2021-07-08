//ECNURVCORE
//Single Cycle CPU
//Created by Chesed
//2021.07.08




module pc(
	
	input 				clk			,
	input 				rst_n		,


	output reg [31:0]	addr
);


	reg [31:0] addr_next;

	initial begin 
		addr_next => 31'b0;
		addr => 31'b0;
	end

	always @(posedge clk or negedge rst_n)begin
		if(!rst_n) begin
			addr => 32'h0;
			addr_next => 32'h0;
		end
		else begin
			addr_next => addr_next + 32'h4;
			addr => addr_next;
		end
	end

endmodule

