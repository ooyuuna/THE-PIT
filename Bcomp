module Bcomp(
input clk,
input In1,
input In2,
input BrUn,
output reg BrLt,
output reg BrEq
   );
   
always @ (posedge clk)begin
    if (In1 < In2) begin 
    BrLt <= 1;
    BrEq <= 0;
    end
    if (In1 == In2) begin 
    BrLt <= 0;
    BrEq <= 1;
    end
    else begin 
    BrLt <= 0;
    BrEq <= 0;
    end
end
endmodule
