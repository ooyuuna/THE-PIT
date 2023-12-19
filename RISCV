
module RISCV(
input wire [31:0] Instruction,
input wire clk,
input wire cUnitclk,  //ALEX BULLSHIT
//control unit
output wire BrEq,
output wire BrLt,
output wire [3:0] ALUop,
//write enable
output wire ImmSel,
input wire BSel, 
output wire BrUn,
output wire ASel,
output wire PCSel,
output wire WBSel,
output wire MemRW,
//register
input wire [4:0] rs1In,
input wire [4:0] rs2In,
input wire [4:0] rd,
output wire resetReg,
output reg [31:0] RegDataIn,
output wire writeEnable,
output wire [31:0] rs1Out,
output wire [31:0] rs2Out,
//pcselect
output reg [31:0] PCVal,

//sign extender
output wire [31:0] signExtendedVal,
input wire [11:0] imm,

//ALU
output wire [31:0] ALUresult,
output reg [31:0] ALUin1,
output reg [31:0] ALUin2,

//memory
output wire resetMem

    );
   
    CU smog (cUnitclk,BrEq,BrLt,Instruction,ALUop,writeEnable,ImmSel,BSel,BrUn,ASel,PCSel,WBSel,MemRW);
    Reg boog (clk,rs1In,rs2In,rd,resetReg,RegDataIn,writeEnable,rs1Out,rs2Out);
    Bcomp oog (clk,rs1Out,rs2Out,BrUn,BrLt,BrEq);
    ALU blog (clk,ALUin1,ALUin2,ALUop,ALUresult);
    immSignExtender extend (clk,ImmSel,imm,signExtendedVal);
    dMemEightChip mem (clk, addr, dataIn, MemRW, resetMem, dataOut);
    initial begin 
    PCVal<=0; //pcselect
    end
    
    always @ (posedge clk)begin
    if(PCSel)begin PCVal <=PCVal+4; end//pcselect
    if(!PCSel)begin PCVal <= ALUresult; end
    
    if(!ASel)  begin ALUin1 <= rs1Out; end//Aselect
    if(ASel) begin ALUin1 <= PCVal; end
    
    
    if(!BSel)begin ALUin2 <= rs2Out; end//Bselect
    if(BSel)begin  ALUin2 <= signExtendedVal; end
    
    if(WBSel)begin RegDataIn <= ALUresult; end //writeback select
    if(!WBSel) begin RegDataIn <= dataOut; end
    
    
    end
    

   
endmodule
