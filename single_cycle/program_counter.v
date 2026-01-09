module program_counter(
    input clk,
    input rst,
    input [15:0] pc_next,
    output reg [15:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 16'd0;
        else
            pc <= pc_next;
    end

endmodule