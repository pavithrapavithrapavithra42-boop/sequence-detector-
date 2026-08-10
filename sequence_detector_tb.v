`timescale 1ns/1ps

module sequence_detector_tb;

reg clk;
reg reset;
reg din;

wire detected;

sequence_detector uut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .detected(detected)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    din = 0;

    #10;
    reset = 0;

    // Input sequence: 1011
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    // Extra bits
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    // Another 1011
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    #10;

    $finish;
end

initial
begin
    $display("-------------------------------------");
    $display("Time\tReset\tDin\tDetected");
    $display("-------------------------------------");

    $monitor("%0t\t%b\t%b\t%b",
             $time, reset, din, detected);
end

endmodule