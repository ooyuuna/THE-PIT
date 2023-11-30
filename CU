module CU(
input clk,
input BrEq,
input BrLt,
input [0:31] I,
output reg [0:3] ALUop,
output reg wEn,
output reg ImmSel,
output reg BSel,
output reg BrUn,
output reg ASel,
output reg PCSel
    );
    //opcode
always @ (posedge clk)begin
    case (I[0:6])
    0110011: begin //add sub type stuff
    wEn <= 0; //a delay will need to be written for this to enable for writeback
    ImmSel <= 0;
    BSel <= 0;
    BrUn <= 0;
    ASel <= 0; //control for branch comparator
    PCSel <= 0; //will only be one for branching when branch taken.
    end
     
     0010011: begin //immediate
    wEn <= 0; //a delay will need to be written for this to enable for writeback
    ImmSel <= 1;
    BSel <= 1;//one when imm only
    BrUn <= 0; //always zero
    ASel <= 0; //control for branch comparator
    PCSel <= 0; //will only be one for branching when branch taken.
    end
    
    1100011:begin //branching
    wEn <= 0; 
    ImmSel <= 1;
    BSel <= 1;//one when imm only
    BrUn <= 0; //always zero
    ASel <= 1; //control for branch comparator
    
        case (I[12:14])
        000:begin //equal
        if (BrEq)
        PCSel <= 1;
        
        else 
        PCSel <=0;
        end
        
        001:begin //not equal
        if (!BrEq)
        PCSel <= 0;
        
        else 
        PCSel <=1;
        end
        
        004:begin //less than
        if (BrLt)
        PCSel <= 1;
        
        else 
        PCSel <=0;
        end 
        
        005:begin //greater than or equal
        if (!BrLt)
        PCSel <= 0;
        
        else 
        PCSel <=1;
        end 
        
        endcase
        end
    endcase
    end
    
    
endmodule

