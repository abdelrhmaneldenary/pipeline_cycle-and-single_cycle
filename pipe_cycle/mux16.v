module mux16(
    input [15:0] a,        // Input 0
    input [15:0] b,        // Input 1
    input sel,             // Select Signal
    output [15:0] y        // Output
);

    // If sel is 0, output a. If sel is 1, output b.
    assign y = (sel == 1'b0) ? a : b;

endmodule