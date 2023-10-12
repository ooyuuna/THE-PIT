module rom(addr, enable, clk, out);

reg[7:0] storage [127:0];

input[31:0] addr;
input enable, clk;
output reg [31:0] out;

integer i;

initial begin

	//initializing the entire ROM to zero to begin.
	for (i = 0; i < 128; i = i + 1) begin
			storage[i] = 0;
			end
			
		//FOR TESTBENCH VALUES
	for (i = 0; i < 16; i = i + 1) begin
		storage[i] = i;
		end
			
			
	end //initial end

always @(posedge clk) begin
//reading
	if (enable && addr <= 124) begin
		out <= {storage[addr + 3], storage[addr + 2], storage[addr + 1], storage[addr]};
	end

	//the addr being above 124 will overflow, and i'm not sure how that would affect anything.
end//always end
endmodule
