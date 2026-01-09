module EX_MEM(
    input clk, rst,
    input [15:0] alu_in, d2_in,
    input [2:0] wreg_in,
    input rwrite_in, mreg_in, mread_in, mwrite_in,
    output reg [15:0] alu_out, d2_out,
    output reg [2:0] wreg_out,
    output reg rwrite_out, mreg_out, mread_out, mwrite_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            {alu_out, d2_out, wreg_out} <= 0;
            {rwrite_out, mreg_out, mread_out, mwrite_out} <= 0;
        end else begin
            alu_out <= alu_in; d2_out <= d2_in; wreg_out <= wreg_in;
            rwrite_out <= rwrite_in; mreg_out <= mreg_in;
            mread_out <= mread_in; mwrite_out <= mwrite_in;
        end
    end
endmodule