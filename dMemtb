module dMemtb();
//module dMemEightChip(addr, clk, dataIn, readWrite, reset, dataOut);
reg [31:0] addr;
reg clk, readWrite, reset;
reg [31:0] dataIn;
wire [31:0] dataOut;


dMemEightChip testModule(addr, clk, dataIn, readWrite, reset, dataOut);
//input [31:0] addr;
//input clk, readWrite, reset;
//input [31:0] dataIn;
//output reg [31:0] dataOut;

always begin
#5; clk <= 0;
#5; clk <= 1;
end

initial begin
//read 0 write 1
clk = 1;
#5;

dataIn <= 20;
readWrite <= 1;
addr <= 7; //should use chip 0 for addr 7.

#10;

readWrite = 0;
addr <= 7;

#10;

dataIn <= 32;
readWrite <= 1;
addr <= 3587; //should use chip 7 for addr 3.

#10;

readWrite = 0;
addr <= 3587;

#10;


addr <= 7;

#10;

reset <= 1;


//20
//00000000000000000000

end


endmodule
