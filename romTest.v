`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 09:10:37 AM
// Design Name: 
// Module Name: ROMtb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ROMtb();

//input[31:0] addr;
//input enable, clk;
//output reg [31:0] out;

wire [31:0] out;
reg [31:0] addr;
reg enable, clk;

//instant
ROM testRom(addr, enable, clk, out);

always begin
	#5; clk <= 0;
	#5; clk <= 1;
end

initial begin

//load first word
addr <= 0;
enable <= 1;
#5;

//enable <= 0;
#5;
//second word
enable <= 1;
addr <= 4;
#5;

//enable <= 0;
#5;
//third word
enable <= 1;
addr <=8;
#5;

//enable <= 0;
#5;
//fourth word
enable <= 1;
addr <= 12;
#5;
//enable <= 0;
end

endmodule
