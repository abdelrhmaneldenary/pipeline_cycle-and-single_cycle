module MEM_WB(
    input clk, rst,
    input [15:0] mdata_in, alu_in,
    input [2:0] wreg_in,
    input rwrite_in, mreg_in,
    output reg [15:0] mdata_out, alu_out,
    output reg [2:0] wreg_out,
    output reg rwrite_out, mreg_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            {mdata_out, alu_out, wreg_out} <= 0;
            {rwrite_out, mreg_out} <= 0;
        end else begin
            mdata_out <= mdata_in; alu_out <= alu_in; wreg_out <= wreg_in;
            rwrite_out <= rwrite_in; mreg_out <= mreg_in;
        end
    end
endmodule