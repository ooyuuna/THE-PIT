//module dMemBase(addr, clk, enable, dataIn, readwrite, reset, dataOut);

module baseTB();

reg [31:0] addr;
reg clk, enable, readwrite, reset;
reg [31:0] dataIn;
wire [31:0] dataOut;

dMemBase testBase(addr, clk, enable, dataIn, readwrite, reset, dataOut);

always begin
#5; clk <= 0;
#5; clk <= 1;
end

initial begin
//read 0 write 1
clk = 1;
#5;

enable <= 1;
 #10;
 
 reset <= 1;
 
 #10;
 
 reset <= 0;
 #5;


dataIn <= 20;
readWrite <= 1;
addr <= 7; //should use chip 0 for addr 7.

#10;

readWrite <= 0;

#10;


endmodule
