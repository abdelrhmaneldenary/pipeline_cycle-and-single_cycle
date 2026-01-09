module data_memory (
    input clk,
    input mem_write,
    input mem_read,
    input [15:0] address,
    input [15:0] write_data,
    output reg [15:0] read_data
);

    // Internal storage for writing results (Stores, etc.)
    reg [15:0] ram [255:0];

    // --- READ LOGIC (Combinational) ---
    // This forces the ID values to exist even if simulation ignores 'initial' blocks
    always @(*) begin
        if (mem_read) begin
            if (address == 16'd0) 
                read_data = 16'h0253; // HARDCODED: ID Part 1 (Last 4 digits)
            else if (address == 16'd1) 
                read_data = 16'h2022; // HARDCODED: ID Part 2 (Middle 4 digits)
            else 
                read_data = ram[address]; // Read from RAM for all other addresses
        end else begin
            read_data = 16'h0000;
        end
    end

    // --- WRITE LOGIC (Sequential) ---
    always @(posedge clk) begin
        if (mem_write) begin
            ram[address] <= write_data;
            // Useful for debugging: prints to console when a store happens
            $display("Memory Write: Address %d = Data %h", address, write_data);
        end
    end

endmodule