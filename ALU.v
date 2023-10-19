module ALU (rs1, rs2, ALUop, clk, result);
//might want signals for the output
input [31:0] rs1;
input [31:0] rs2;
input [3:0] ALUop; //signal sent in VIA the control unit
input clk;

output reg [31:0] result;

always @(posedge clk) begin //always
	case (ALUop)
	//everything is bit-wise
	4'b1001:  result <= rs1 + rs2; //ADD
	4'b0001:  result <= rs1 - rs2; //SUB
	4'b0010:  result <= rs1 ^ rs2; //XOR
	4'b0011:  result <= rs1 | rs2; //OR
	4'b0100:  result <= rs1 & rs2; //AND
	4'b0101:  result <= rs1 << rs2;  //SLL
	4'b1101:  result <= rs1 >> rs2; //SRL
	default : result <= 0;

	endcase
end //end always
endmodule
