module ALUtest();
//input [31:0] rs1;
//input [31:0] rs2;
//input [3:0] ALUop; //signal sent in VIA the control unit
//input clk;

//output reg [31:0] result;
wire [31:0] result;
reg [31:0] rs1;
reg [31:0] rs2;
reg [3:0] ALUop;
reg clk;

ALU testALU(rs1, rs2, ALUop, clk, result);

always begin
	#5 clk <= ~clk;
end

initial begin
	clk = 1;
	
	#5;
	rs1 <= 12;
	rs2 <= 18;
	ALUop <= 4'b1001; //add
	
	#10;
	rs1 <= 18;
	rs2 <= 12;
	ALUop <= 4'b0001; //sub
	
	#10;
	
	ALUop <= 0010; //xor
	
	#10;
	
	ALUop <= 0011; //or
	
	#10;
	
	ALUop <= 0100; //and
	
	#10;
	
	rs2 <= 2;
	ALUop <= 0101; //shift left by 2
	
	#10;
	
	ALUop <= 1101; //shift right by 2.
	
	#10;
	
	ALUop <= 1111; //expecting a value of 0 to test detault
	
	#10;
	
end

endmodule
