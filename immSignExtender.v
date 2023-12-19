module immSignExtender(clk, flag, imm, out);
input clk;
input flag; //this is your "ImmSel" flag
input [11:0] imm;
output reg [31:0] out;



always @(posedge clk) begin
if (flag) begin
	if (imm[11]) begin //FIll with 1's
		out <= {20'b11111111111111111111, imm[11:0]};
	end
	else begin //fill with 0's
	out <= {20'b00000000000000000000, imm[11:0]};
			// {20'b11111111111111111111, imm[11:0]};
	end
end
end
endmodule
