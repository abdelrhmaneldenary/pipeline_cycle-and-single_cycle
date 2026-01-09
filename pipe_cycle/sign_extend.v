module sign_extend(
    input [5:0] in,   // 6-bit immediate from instruction
    output [15:0] out
);
    // Pad the upper 10 bits with the sign bit (bit 5)
    assign out = {{10{in[5]}}, in};
endmodule