module register_block(
    input clk,
    input rst,                 // We use this to reset everything
    input reg_write,           // Control signal: 1 = Write
    input [2:0] read_reg1,     // Source 1 (rs)
    input [2:0] read_reg2,     // Source 2 (rt)
    input [2:0] write_reg,     // Destination (rd)
    input [15:0] write_data,   // Data to save
    output [15:0] read_data1,  // Output 1
    output [15:0] read_data2   // Output 2
);

    // 8 Registers of 16-bits each
    reg [15:0] registers [0:7];
    integer i;

    // --- CRITICAL FIX: Initialize everything to 0 ---
    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            registers[i] = 16'd0;
        end
    end

    // Sequential Write (happens on clock edge)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers to 0
            for (i = 0; i < 8; i = i + 1) begin
                registers[i] <= 16'd0;
            end
        end
        else if (reg_write && (write_reg != 3'd0)) begin
            // Write data ONLY if it's not Register 0
            registers[write_reg] <= write_data;
            
            // Debug message to help you see what's happening
            $display("Register Write: Reg[%d] = %h", write_reg, write_data);
        end
    end

    // Combinational Read (happens instantly)
    // Note: Register 0 is hardcoded to always be 0
    assign read_data1 = (read_reg1 == 0) ? 16'd0 : registers[read_reg1];
    assign read_data2 = (read_reg2 == 0) ? 16'd0 : registers[read_reg2];

endmodule