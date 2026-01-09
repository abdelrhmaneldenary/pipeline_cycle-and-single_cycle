module sign_extend(
    input [5:0] in,          // 6-bit Immediate from Instruction
    output [15:0] out        // 16-bit Extended Output
);

    // Concatenate the MSB (in[5]) 10 times to fill the upper bits
    assign out = {{10{in[5]}}, in};

endmodule