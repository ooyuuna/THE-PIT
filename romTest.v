module romTest();

//input[31:0] addr;
//input enable, clk;
//output reg [31:0] out;

wire [31:0] out;
reg [31:0] addr;
reg enable, clk;

//instant
rom testRom(addr, enable, ck, out);

always begin
	#5 clk <= ~clk;
end

initial begin

//load first word
addr <= 0;
enable <= 1;
#5

enable <= 0;
#5
//second word
enable <= 1
addr <= 4
#5

enable <= 0;
#5
//third word
enable <= 1
addr <=8
#5

enable <= 0;
#5
//fourth word
enable <= 1
addr <= 12
#5
enable <= 0;
end

endmodule
