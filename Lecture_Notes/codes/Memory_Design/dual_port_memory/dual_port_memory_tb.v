module tb_dual_port_memory();

    // Inputs
    reg Wr_en;
    reg Rd_en;
    reg [3:0] Wr_addr;
    reg [3:0] Rd_addr;
    reg [31:0] Data_in;
    reg Rst;
    reg Clk;

    // Output
    wire [31:0] Data_out;

    // Instantiate the Unit Under Test (UUT)
    dual_port_memory uut (
        .Wr_en(Wr_en),
        .Rd_en(Rd_en),
        .Wr_addr(Wr_addr),
        .Rd_addr(Rd_addr),
        .Data_in(Data_in),
        .Data_out(Data_out),
        .Rst(Rst),
        .Clk(Clk)
    );

    // Clock generation (negative edge triggered)
    always #5 Clk = ~Clk;

    initial begin
        // Initialize Inputs
        Clk = 0;
        Rst = 0;     // Assert reset (active low)
        Wr_en = 0;
        Rd_en = 0;
        Wr_addr = 4'd0;
        Rd_addr = 4'd0;
        Data_in = 32'd0;

        // Hold reset for some time
        #10 Rst = 1; // Deassert reset

        // Write some data
        #10;
        Wr_en = 1;
        Wr_addr = 4'd3;
        Data_in = 32'hA5A5A5A5;

        #10;
        Wr_addr = 4'd7;
        Data_in = 32'h12345678;

        #10 Wr_en = 0;

        // Read data back
        #10;
        Rd_en = 1;
        Rd_addr = 4'd3;

        #10;
        Rd_addr = 4'd7;

        #10;
        Rd_en = 0;

        // Simultaneous write and read
        #10;
        Wr_en = 1;
        Rd_en = 1;
        Wr_addr = 4'd4;
        Data_in = 32'hCAFEBABE;
        Rd_addr = 4'd3;

        #10;
        Wr_en = 0;
        Rd_en = 0;

        #20;
        $finish;
    end
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

endmodule
