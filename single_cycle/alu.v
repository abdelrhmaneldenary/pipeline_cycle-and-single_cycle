module alu(
    input [15:0] a,          // Input A
    input [15:0] b,          // Input B
    input [3:0] alu_cntrl,   // CHANGED: 4-bit Control (Matches your list)
    output reg [15:0] result,// Result
    output zero              // Zero Flag
);

    always @(*)
    begin
        case(alu_cntrl)
            // Your Specified List:
            4'b0000: result = a & b;       // AND
            4'b0001: result = a | b;       // OR
            4'b0010: result = a + b;       // ADD
            4'b0110: result = a - b;       // SUBTRACT
            4'b0111: result = (a < b) ? 16'd1 : 16'd0; // SET-ON-LESS-THAN
            
            // Default Case (Safety)
            default: result = a + b;
        endcase
    end

    assign zero = (result == 16'd0) ? 1'b1 : 1'b0;

endmodule