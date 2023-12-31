module CUtb(
output reg clk,
output reg BrEq,
output reg BrLt,
output reg [31:0] I,
wire [3:0] ALUop,
wire wEn,
wire ImmSel,
wire BSel,
wire BrUn,
wire ASel,
wire PCSel,
wire WBSel,
wire MemRW
    );
    CU testcu(clk,BrEq,BrLt,I,ALUop,wEn,ImmSel,BSel,BrUn,ASel,PCSel, WBSel, MemRW);
  
    always begin
#5; clk <= 0;
#5; clk <= 1;

end
 
 initial begin
I<= 32'b00000000000000000000000000000011; //Load word
//      32   26          1412   7     0
 #20;
I<= 32'b00000000000000000000000000100011;//store word
//      32   26          1412   7     0
 #20;
 
 
I<= 32'b0000000000000000010000000110011;//R type xor
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000011000000110011;//or
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000011100000110011;//and
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000000100000110011;//SLL
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000010100000110011;//SRL
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000000000000110011;//add
//      32   26          1412   7     0
 #20;
I<= 32'b0000010000000000010100000110011;//sub
//      32   26          1412   7     0
 #20;
 
I<= 32'b0000010000000000010100000010011;//I type xor
//      32   26          1412   7     0
 #20
I<= 32'b0000000000000000011000000010011;//or
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000011100000010011;//and
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000000100000010011;//SLL
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000010100000010011;//SRL
//      32   26          1412   7     0
 #20;
I<= 32'b0000000000000000000000000010011;//add
//      32   26          1412   7     0
 #20;
;
 
 end
endmodule

