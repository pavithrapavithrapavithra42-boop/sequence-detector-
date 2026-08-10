`timescale 1ns/1ps

module alu_8bit_tb;

reg [7:0] A;
reg [7:0] B;
reg [3:0] ALU_Sel;
reg Enable;

wire [7:0] Result;
wire Carry;

alu_8bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Enable(Enable),
    .Result(Result),
    .Carry(Carry)
);

initial
begin

    $display("------------------------------------------------------");
    $display(" A        B        Sel    Enable    Result    Carry");
    $display("------------------------------------------------------");

    $monitor("%b  %b   %b      %b       %b      %b",
             A, B, ALU_Sel, Enable, Result, Carry);

    Enable = 1;

    // ADD: 15 + 5 = 20
    A = 8'd15;
    B = 8'd5;
    ALU_Sel = 4'b0000;
    #10;

    // SUB: 15 - 5 = 10
    ALU_Sel = 4'b0001;
    #10;

    // AND
    A = 8'b10101010;
    B = 8'b11001100;
    ALU_Sel = 4'b0010;
    #10;

    // OR
    ALU_Sel = 4'b0011;
    #10;

    // XOR
    ALU_Sel = 4'b0100;
    #10;

    // NOT
    ALU_Sel = 4'b0101;
    #10;

    // Shift Left
    A = 8'b00001111;
    ALU_Sel = 4'b0110;
    #10;

    // Shift Right
    ALU_Sel = 4'b0111;
    #10;

    // Disable ALU
    Enable = 0;
    #10;

    $finish;

end

endmodule