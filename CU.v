module CU(
input clk,
input BrEq,
input BrLt,
input [31:0] I,
output reg [3:0] ALUop,
output reg wEn,
output reg ImmSel,
output reg BSel,
output reg BrUn,
output reg ASel,
output reg PCSel,
output reg WBSel,
output reg MemRW
    );
    //opcode
always @ (posedge clk)begin

    case (I[6:0])
	 7'b0000011: begin//LW
	 wEn <= 0; //stay 0
    ImmSel <= 1;
    BSel <= 1;
    BrUn <= 0;
    ASel <= 0; //control for branch comparator
    PCSel <= 0; //will only be one for branching when branch taken.
	 WBSel <= 0; //picking from dmem; (doesn't matter here)
	 MemRW <= 0; //  reading from mem
	  ALUop <= 4'b1001; //add
	 end
	 
	 7'b0100011: begin//SW
	wEn <= 0; //stay 0
    ImmSel <= 1;
    BSel <= 1;
    BrUn <= 0;
    ASel <= 0; //control for branch comparator
    PCSel <= 0; //will only be one for branching when branch taken.
	 WBSel <= 0; //picking from dmem;
	 MemRW <= 1; //  writing into dmem
	 ALUop <= 4'b1001; // add
	 end
	 
    7'b0110011: begin //R TYPE  JAKE IF THIS BREAKS MAKE IT ACTUALLY BINARY
    wEn <= 0; //a delay will need to be written for this to enable for writeback
    ImmSel <= 0;
    BSel <= 0;
    BrUn <= 0;
    ASel <= 0; //control for branch comparator
    PCSel <= 0; //will only be one for branching when branch taken.
	 WBSel <= 1; //picking from ALU;
	 MemRW <= 0; // 0 is read
	 
		case (I[14:12]) //ALUOP stuff
		3'b100: ALUop <= 4'b0010; //xor
		3'b110: ALUop <= 4'b0011; //or
		3'b111: ALUop <= 4'b0100; //and
		3'b001: ALUop <= 4'b0101; //SLL
		3'b101: ALUop <= 4'b1101; //SRL
		
		3'b000: begin
			if (I[30]) begin //I changed the I instruction from 26 to 30
				ALUop <= 4'b0001; //SUB
			end
			else begin
				ALUop <= 4'b1001; //ADD
			end
		end
		default: ALUop <= 4'b0000; //nothing its just to not break this.
		endcase
		
	 
	 
    end
     
     7'b0010011: begin //I TYPE
    wEn <= 0; //a delay will need to be written for this to enable for writeback
    ImmSel <= 1;
    BSel <= 1;//one when imm only
    BrUn <= 0; //always zero
    ASel <= 0; //control for branch comparator
    PCSel <= 0; //will only be one for branching when branch taken.
	 WBSel <= 1; //picking from ALU;
	 MemRW <= 0; // 0 is read
	 
	 case (I[14:12])
		3'b100: ALUop <= 4'b0010; //xor
		3'b110: ALUop <= 4'b0011; //or
		3'b111: ALUop <= 4'b0100; //and
		3'b001: ALUop <= 4'b0101; //SLL
		3'b101: ALUop <= 4'b1101; //SRL
		3'b000: ALUop <= 4'b1001; //ADD
		default: ALUop <= 4'b0000; //nothing its just to not break this.
		endcase
	 
	 
    end
    
    7'b1100011:begin //branching
    wEn <= 0; 
    ImmSel <= 1;
    BSel <= 1;//one when imm only
    BrUn <= 0; //always zero
    ASel <= 1; //control for branch comparator
    ALUop <= 4'b1001; //addition for branching.
	 WBSel <= 1; //picking from ALU;
	 MemRW <= 0; // 0 is read
        case (I[14:12])
        000:begin //equal
        if (BrEq)
        PCSel <= 1;
        
        else 
        PCSel <=0;
        end
        
        001:begin //not equal //is this number right i mightve hypothetically deleted it.
        if (!BrEq)
        PCSel <= 1;
        
        else 
        PCSel <=0;
        end
        
        004:begin //less than
        if (BrLt)
        PCSel <= 1;
        
        else 
        PCSel <=0;
        end 
        
        005:begin //greater than or equal
        if (!BrLt)
        PCSel <= 1;
        
        else 
        PCSel <=0;
        end 
        
        endcase
        end
    endcase
    end
    
    
endmodule
