module dMemBase(addr, clk, enable, dataIn, readwrite, reset, dataOut);

input [31:0] addr;
input clk, enable, readwrite, reset;
input [31:0] dataIn;
output reg [31:0] dataOut;

reg[7:0] storage [1023:0];

//read is 0, write is 1
integer i;
always @(posedge clk) begin
//reading
	if (reset) begin
		for (i = 0; i < 1024; i= i + 1) begin
		storage[i] = 0;
		end
	end

	else if (enable && !readwrite) begin
		dataOut <= {storage[addr + 3], storage[addr + 2], storage[addr + 1], storage[addr]};
	end
	
	else if (enable && readwrite) begin
		storage[addr] <= dataIn[7:0];
		storage[addr+1] <= dataIn[15:8];
		storage[addr+2] <= dataIn[23:16];
		storage[addr+3] <= dataIn[31:24];
	end
	
	//the addr being above 124 will overflow, and i'm not sure how that would affect anything.
end//always end



endmodule
