
module Reg(
    input clk,
    input [4:0] rs1In,//determines where to pull information from
    input [4:0] rs2In,//allows for two values to pulled at once
    input [4:0] rd,//determines where the information is stored
    input reset,//sets all values in the register to zero
    input [31:0] data,//data that will be stored where rd determines
    input writeEnable,//determines if the register will give information or recieve it
    output reg [31:0] rs1Out,//the information in the requested register
    output reg [31:0] rs2Out
    );

	reg [31:0] r[0:31];
	
	integer i;
	
	initial begin
	
	for (i = 0; i < 32; i = i + 1) begin
			r[i] = 2*i;
			end
	end
	
	
	
	always @ (posedge clk) begin //always
		if (reset) begin
			for (i = 0; i < 32; i = i + 1) begin
			r[i] = 0;
			end
		end
		
		 if (!writeEnable) begin
		rs1Out <= r[rs1In];
		rs2Out <= r[rs2In];
		end
		
		else begin
		r[rd] <= data;
		end
		
		
		
	end //always
endmodule
