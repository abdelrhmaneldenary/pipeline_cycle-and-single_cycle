module ID_EX(
    input clk, rst,
    input [15:0] d1_in, d2_in, imm_in,
    input [2:0] wreg_in,
    input [2:0] func_in,        // ADDED: Input for FuncCode
    input rwrite_in, mreg_in, mread_in, mwrite_in, asrc_in,
    input [1:0] aluop_in,
    output reg [15:0] d1_out, d2_out, imm_out,
    output reg [2:0] wreg_out,
    output reg [2:0] func_out,   // ADDED: Output for FuncCode
    output reg rwrite_out, mreg_out, mread_out, mwrite_out, asrc_out,
    output reg [1:0] aluop_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            {d1_out, d2_out, imm_out, wreg_out, func_out} <= 0;
            {rwrite_out, mreg_out, mread_out, mwrite_out, asrc_out, aluop_out} <= 0;
        end else begin
            d1_out <= d1_in; d2_out <= d2_in; imm_out <= imm_in;
            wreg_out <= wreg_in; rwrite_out <= rwrite_in;
            mreg_out <= mreg_in; mread_out <= mread_in;
            mwrite_out <= mwrite_in; asrc_out <= asrc_in;
            aluop_out <= aluop_in;
            func_out <= func_in; // ADDED: Passing the function code
        end
    end
endmodule