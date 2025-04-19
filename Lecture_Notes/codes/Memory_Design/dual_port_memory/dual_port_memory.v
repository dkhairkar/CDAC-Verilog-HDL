module dual_port_memory (
    input wire Wr_en,              // Write Enable
    input wire Rd_en,              // Read Enable
    input wire [3:0] Wr_addr,      // 4-bit Write Address (16 locations)
    input wire [3:0] Rd_addr,      // 4-bit Read Address (16 locations)
    input wire [31:0] Data_in,     // 32-bit Data input
    output reg [31:0] Data_out,    // 32-bit Data output
    input wire Rst,                // Active-low asynchronous reset
    input wire Clk                 // Clock
);

    // Memory array: 16 locations of 32-bit each
    reg [31:0] memory [15:0];

    // Internal registers for address and control
    reg [3:0] wr_addr_reg;
    reg [3:0] rd_addr_reg;
    reg wr_en_reg;
    reg rd_en_reg;

    // Asynchronous reset
    always @(negedge Rst or negedge Clk) begin
        if (!Rst) begin
            wr_addr_reg <= 4'd0;
            rd_addr_reg <= 4'd0;
            wr_en_reg <= 1'b0;
            rd_en_reg <= 1'b0;
            Data_out <= 32'd0;
        end else begin
            // Store current control signals on negative clock edge
            wr_addr_reg <= Wr_addr;
            rd_addr_reg <= Rd_addr;
            wr_en_reg <= Wr_en;
            rd_en_reg <= Rd_en;

            // Write operation
            if (Wr_en) begin
                memory[Wr_addr] <= Data_in;
            end

            // Read operation
            if (Rd_en) begin
                Data_out <= memory[Rd_addr];
            end else begin
                Data_out <= 32'd0;
            end
        end
    end

endmodule
