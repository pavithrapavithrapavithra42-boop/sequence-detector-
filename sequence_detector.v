module sequence_detector(
    input clk,
    input reset,
    input din,
    output reg detected
);

reg [1:0] state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= S0;
        detected <= 1'b0;
    end
    else
    begin
        detected <= 1'b0;

        case (state)

            S0:
            begin
                if (din)
                    state <= S1;
                else
                    state <= S0;
            end

            S1:
            begin
                if (din)
                    state <= S1;
                else
                    state <= S2;
            end

            S2:
            begin
                if (din)
                    state <= S3;
                else
                    state <= S0;
            end

            S3:
            begin
                if (din)
                begin
                    detected <= 1'b1;
                    state <= S1;
                end
                else
                    state <= S2;
            end

            default:
                state <= S0;

        endcase
    end
end

endmodule