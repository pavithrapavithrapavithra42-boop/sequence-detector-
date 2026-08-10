module alu_8bit(
    input [7:0] A,
    input [7:0] B,
    input [3:0] ALU_Sel,
    input Enable,
    output reg [7:0] Result,
    output reg Carry
);

always @(*)
begin

    Result = 8'b00000000;
    Carry = 1'b0;

    if (Enable)
    begin
        case (ALU_Sel)

            // Addition
            4'b0000:
            begin
                {Carry, Result} = A + B;
            end

            // Subtraction
            4'b0001:
            begin
                Result = A - B;
            end

            // AND
            4'b0010:
            begin
                Result = A & B;
            end

            // OR
            4'b0011:
            begin
                Result = A | B;
            end

            // XOR
            4'b0100:
            begin
                Result = A ^ B;
            end

            // NOT
            4'b0101:
            begin
                Result = ~A;
            end

            // Shift Left
            4'b0110:
            begin
                Result = A << 1;
            end

            // Shift Right
            4'b0111:
            begin
                Result = A >> 1;
            end

            default:
            begin
                Result = 8'b00000000;
                Carry = 1'b0;
            end

        endcase
    end

end

endmodule