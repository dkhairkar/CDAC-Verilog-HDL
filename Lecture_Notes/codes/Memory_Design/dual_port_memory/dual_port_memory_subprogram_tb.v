module dual_port_memory (
    input Wr_en,
    input Rd_en,
    input [3:0] Wr_addr,
    input [3:0] Rd_addr,
    input [31:0] Data_in,
    output reg [31:0] Data_out,
    input Rst,           // Active-low async reset
    input Clk,           // Write operations (on negative edge)
    input Clk2,          // Read operations (on negative edge)
    input clr            // When high, clear all memory to 0
);

  // Memory Declaration
  reg [31:0] mem [15:0];  // 16 locations, 32-bit each
  integer i;

  // Asynchronous Reset or Clear
  always @(negedge Rst or posedge clr) begin
    if (!Rst || clr) begin
      for (i = 0; i < 16; i = i + 1)
        mem[i] <= 32'b0;
    end
  end

  // Write Operation on Negative Edge of Clk
  always @(negedge Clk) begin
    if (Wr_en && Rst && !clr)
      write_data(Wr_addr, Data_in);
  end

  // Read Operation on Negative Edge of Clk2
  always @(negedge Clk2) begin
    if (Rd_en && Rst && !clr)
      read_data(Rd_addr);
  end

  // Subprogram: Write Task
  task write_data;
    input [3:0] addr;
    input [31:0] data;
    begin
      mem[addr] = data;
    end
  endtask

  // Subprogram: Read Task
  task read_data;
    input [3:0] addr;
    begin
      Data_out = mem[addr];
    end
  endtask

endmodule


/*Summary of Changes:

Feature	Description
task write_data	Handles writing a 32-bit word at given address
task read_data	Handles reading from memory and assigning to Data_out
Clk2	Separate clock used only for read operations
clr	Synchronously clears all memory contents to 0
Rst	Still used as asynchronous active-low reset*/