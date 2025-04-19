`timescale 1ns/1ps

module dual_port_mem_tb;

  // Testbench signals
  reg Wr_en, Rd_en, Rst, Clk;
  reg [3:0] Wr_addr, Rd_addr;
  reg [31:0] Data_in;
  wire [31:0] Data_out;

  // Instantiate the memory module (replace with your module name)
  dual_port_memory dut (
    .Wr_en(Wr_en),
    .Rd_en(Rd_en),
    .Wr_addr(Wr_addr),
    .Rd_addr(Rd_addr),
    .Data_in(Data_in),
    .Data_out(Data_out),
    .Rst(Rst),
    .Clk(Clk)
  );

  // Clock generation: 100 MHz = 10 ns period
  initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
  end

  // Stimulus block
  initial begin
    // Initialize inputs
    Rst = 0;   // Active low reset
    Wr_en = 0;
    Rd_en = 0;
    Wr_addr = 0;
    Rd_addr = 0;
    Data_in = 0;

    // Hold reset
    #10 Rst = 1;

    // Wait a little
    #10;

    // Write some values
    repeat (4) begin
      @(negedge Clk);
      Wr_en = 1;
      Rd_en = 0;
      Wr_addr = Wr_addr + 1;
      Data_in = Data_in + 32'hAAAA_AAAA;
    end

    // Disable write
    @(negedge Clk);
    Wr_en = 0;

    // Read back values
    repeat (4) begin
      @(negedge Clk);
      Rd_en = 1;
      Rd_addr = Rd_addr + 1;
    end

    // Stop simulation
    @(negedge Clk);
    Rd_en = 0;

    #20 $finish;
  end

endmodule
