module dMemEightChip(addr, clk, dataIn, readWrite, reset, dataOut);

input [31:0] addr;
input clk, readWrite, reset;
input [31:0] dataIn;
output reg [31:0] dataOut;

reg enable[7:0];

wire [31:0] data0;
wire [31:0] data1;
wire [31:0] data2;
wire [31:0] data3;
wire [31:0] data4;
wire [31:0] data5;
wire [31:0] data6;
wire [31:0] data7;

reg [31:0] editedAddr;

dMemBase chip0 (editedAddr, clk, enable[0], dataIn, readwrite, reset, data0);
dMemBase chip1 (editedAddr, clk, enable[1], dataIn, readwrite, reset, data1);
dMemBase chip2 (editedAddr, clk, enable[2], dataIn, readwrite, reset, data2);
dMemBase chip3 (editedAddr, clk, enable[3], dataIn, readwrite, reset, data3);
dMemBase chip4 (editedAddr, clk, enable[4], dataIn, readwrite, reset, data4);
dMemBase chip5 (editedAddr, clk, enable[5], dataIn, readwrite, reset, data5);
dMemBase chip6 (editedAddr, clk, enable[6], dataIn, readwrite, reset, data6);
dMemBase chip7 (editedAddr, clk, enable[7], dataIn, readwrite, reset, data7);

always @(posedge clk) begin
editedAddr = {22'b0000000000000000000000, addr[9:0]};
	//reset should be taken care of chip level

case (addr[12:10])
	3'b000: begin
		enable = 8'b00000001;
		dataOut = data0;
		end
	3'b001: begin
		enable = 8'b00000010;
		dataOut = data1;
		end 
	3'b010: begin
		enable = 8'b00000100;
		dataOut = data2;
		end
	3'b011: begin
		enable = 8'b00001000;
		dataOut = data3;
		end
	3'b100: begin
		enable = 8'b00010000;
		dataOut = data4;
		end
	3'b101: begin
		enable = 8'b00100000;
		dataOut = data5;
		end
	3'b110: begin
		enable = 8'b01000000;
		dataOut = data6;
		end
	3'b111: begin
		enable = 8'b10000000;
		dataOut = data7;
		end
		
		default: dataOut = 0;
		
endcase




end //end always




endmodule
