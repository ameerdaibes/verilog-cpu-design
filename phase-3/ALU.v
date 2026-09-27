`timescale 1ns/1ps

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUControl,
    output reg [31:0] Result,
    output Zero,
    output Negative,
    output reg CarryOut,
    output reg Overflow
);

reg [32:0] temp;

always @(*) begin
    CarryOut = 1'b0;
    Overflow = 1'b0;
    temp = 33'b0;

    case(ALUControl)
        4'b0000: begin
            temp = {1'b0, A} + {1'b0, B};
            Result = temp[31:0];
            CarryOut = temp[32];
            Overflow = (~A[31] & ~B[31] & Result[31]) | (A[31] & B[31] & ~Result[31]);
        end
        4'b0001: begin
            Result = A - B;
            Overflow = (~A[31] & B[31] & Result[31]) | (A[31] & ~B[31] & ~Result[31]);
        end
        4'b0010: Result = A & B;
        4'b0011: Result = A | B;
        4'b0100: Result = A ^ B;
        4'b0101: Result = A << B[4:0];
        4'b0110: Result = A >> B[4:0];
        4'b0111: Result = (A < B) ? 32'd1 : 32'd0;
        4'b1000: Result = ~(A | B);
        4'b1001: Result = ~(A & B);
        4'b1010: Result = $signed(A) >>> B[4:0];
        default: Result = 32'b0;
    endcase
end

assign Zero = (Result == 32'b0);
assign Negative = Result[31];

endmodule