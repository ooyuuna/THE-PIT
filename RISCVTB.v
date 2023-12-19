
module RISCVtb();
reg [31:0] I;
reg clk;
reg cUnitclk;
wire [31:0] rs1Out;
wire [31:0] rs2Out;
wire [31:0] RegDataIn;
wire [31:0] ALUresult;
wire [31:0] ALUin1;
wire [31:0] ALUin2;
wire [31:0] PCVal;

    RISCV thing (I,clk, cUnitclk, BrEq, BrLt, ALUop, ImmSel, BSel, BrUn, ASel, PCSel,
     WBSel, MemRW, I[19:15]/*rs1 */, I[24:20]/*rs2 */, I[11:7]/*rd */, resetReg, RegDataIn, writeEnable,rs1Out,rs2Out,PCVal, 
     signExtendedVal,I[31:20],ALUresult,ALUin1,ALUin2,resetMem);
     
     integer i = 0;
 always begin
 for (i = 0; i < 10; i = i + 1) begin
 case (i) 
 0: begin clk <= 0; cUnitclk <= 0; end
 1: clk <= 1;
 2: clk <= 0;
 3: clk <= 1;
 4: clk <= 0;
 5: begin clk <= 1; cUnitclk <= 1; end
 6: clk <= 0;
 7: clk <= 1;
 8: clk <= 0;
 9: begin clk <= 1; i <= -1; end
 default: clk <= 0;
 endcase
 #5;
 end //loop end
 
 end //always end
     
    initial begin 
   clk <= 0;
   cUnitclk <= 0;
#10;

 
      //|----Im----||rs1||3||-rd||-op--|
I<= 32'b00000000010000011100000010010011;//I type xor
//      31   26          1412   7     0
 #200; //|----Im----||rs1||3||-rd||-op--|
I<= 32'b000000000000000011100000010010011;//or
//      31   26          1412   7     0
 #200; //|----Im----||rs1||3||-rd||-op--|
I<= 32'b00000000000000001111000010010011;//and
//      31   26          1412   7     0
 #200; //|----Im----||rs1||3||-rd||-op--|
I<= 32'b00000000000000001001000010010011;//SLL
//      31   26          1412   7     0
 #200; //|----Im----||rs1||3||-rd||-op--|
I<= 32'b00000000000000001101000010010011;//SRL
//      31   26          1412   7     0
 #200; //|----Im----||rs1||3||-rd||-op--|
I<= 32'b00000000110000001000000010010011;//add
//      31   26          1412   7     0
 #200;
 
      //|--f7-||rs2||rs1||3||-rd||-op--|
I<= 32'b00000000000000001100000010110011;//R type xor
//      31   26          1412   7     0
 #200; //|--f7-||rs2||rs1||3||-rd||-op--|
I<= 32'b00000000000000001110000010110011;//or
//      31   26          1412   7     0
 #200; //|--f7-||rs2||rs1||3||-rd||-op--|
I<= 32'b00000000000000001111000010110011;//and
//      31   26          1412   7     0
 #200; //|--f7-||rs2||rs1||3||-rd||-op--|
I<= 32'b00000000000000001001000010110011;//SLL
//      31   26          1412   7     0
 #200; //|--f7-||rs2||rs1||3||-rd||-op--|
I<= 32'b00000000000000001101000010110011;//SRL
//      31   26          1412   7     0
 #200; //|--f7-||rs2||rs1||3||-rd||-op--|
I<= 32'b00000000000000001000000010110011;//add
//      31   26          1412   7     0
 #200; //|--f7-||rs2||rs1||3||-rd||-op--|
I<= 32'b01000000000000001000000010110011;//sub
//      31   26          1412   7     0
 #200;

     end
     
     
endmodule
