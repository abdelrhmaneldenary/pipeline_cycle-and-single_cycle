module IF_ID(
    input clk, rst,
    input [15:0] inst_in,
    output reg [15:0] inst_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) inst_out <= 16'h0000;
        else inst_out <= inst_in;
    end
endmodule