module PC(
    input clk,
    input reset,
    input [31:0] PCNext,
    output reg [31:0] PCOut
);

always @(posedge clk) begin
    if(reset)
        PCOut <= 32'b0;
    else
        PCOut <= PCNext;
end

endmodule