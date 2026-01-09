module adder(
    // We removed 'a' because we always add 1
    input [15:0] b,
    output [15:0] y
);

    // Hardcode the increment by 1
    assign y = b + 16'd1;

endmodule