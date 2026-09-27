`timescale 1ns/1ps

module tb_ALU;

reg [31:0] A;
reg [31:0] B;
reg [3:0] ALUControl;

wire [31:0] Result;
wire Zero;
wire Negative;
wire CarryOut;
wire Overflow;

ALU uut(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Result(Result),
    .Zero(Zero),
    .Negative(Negative),
    .CarryOut(CarryOut),
    .Overflow(Overflow)
);

initial begin

    A = 10; B = 5;  ALUControl = 4'b0000; #10;
    A = 10; B = 5;  ALUControl = 4'b0001; #10;
    A = 8;  B = 8;  ALUControl = 4'b0001; #10;
    A = 12; B = 10; ALUControl = 4'b0010; #10;
    A = 12; B = 10; ALUControl = 4'b0011; #10;
    A = 12; B = 10; ALUControl = 4'b0100; #10;

    A = 4;  B = 1;  ALUControl = 4'b0101; #10;
    A = 8;  B = 1;  ALUControl = 4'b0110; #10;
    A = 5;  B = 9;  ALUControl = 4'b0111; #10;
    A = 12; B = 10; ALUControl = 4'b1000; #10;
    A = 12; B = 10; ALUControl = 4'b1001; #10;
    A = -8; B = 1;  ALUControl = 4'b1010; #10;

    A = 5;  B = 10; ALUControl = 4'b0001; #10;
    A = 32'hFFFFFFFF; B = 32'd1; ALUControl = 4'b0000; #10;
    A = 32'h7FFFFFFF; B = 32'd1; ALUControl = 4'b0000; #10;

    $stop;

end

endmodule
