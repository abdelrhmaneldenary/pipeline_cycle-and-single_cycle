module mux3(
    input [2:0] a,         // Input 0 (rt)
    input [2:0] b,         // Input 1 (rd)
    input sel,             // Select Signal (RegDst)
    output [2:0] y         // Output
);

    assign y = (sel == 1'b0) ? a : b;

endmodule