module data_memory(
    input clk,
    input mem_write,
    input [15:0] address,
    input [15:0] write_data,
    output [15:0] read_data
);

    reg [15:0] ram [0:255];
    integer i;

    initial begin
        // 1. Clear memory
        for (i = 0; i < 256; i = i + 1) ram[i] = 16'h0000;

        // 2. Load Student ID parts in HEX (as per manual)
        ram[0] = 16'h0253; // Part 1
        ram[1] = 16'h2022; // Part 2
        
        // 3. Initialize remaining with random values
        for (i = 9; i < 15; i = i + 1) ram[i] = i * 16'hA;
    end

    // Combinational Read
    assign read_data = ram[address[7:0]];

    // Sequential Write
    always @(posedge clk) begin
        if (mem_write) begin
            ram[address[7:0]] <= write_data;
        end
    end
endmodule