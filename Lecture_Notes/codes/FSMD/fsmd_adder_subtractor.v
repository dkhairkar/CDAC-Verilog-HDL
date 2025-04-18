// Example FSMD: Simple Adder/Subtractor

module fsmd_adder_subtractor (
    input clk,
    input reset,
    input [1:0] operation, // 00: Add, 01: Subtract
    input [7:0] a,
    input [7:0] b,
    output reg [8:0] result
);

  // State Definitions
  parameter IDLE = 2'b00;
  parameter CALCULATE = 2'b01;
  parameter DONE = 2'b10;

  reg [1:0] current_state, next_state;
  reg [8:0] temp_result; // Internal register for calculation

  // Datapath
  always @(posedge clk) begin
    if (reset) begin
      temp_result <= 9'b0;
    end else if (current_state == CALCULATE) begin
      if (operation == 2'b00) begin // Addition
        temp_result <= {1'b0, a} + {1'b0, b};
      end else if (operation == 2'b01) begin // Subtraction
        temp_result <= {1'b0, a} - {1'b0, b};
      end
    end else if (current_state == DONE) begin
      result <= temp_result;
    end
  end

  // Control Unit (FSM)
  always @(posedge clk) begin
    if (reset) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin
    case (current_state)
      IDLE: begin
        if (operation != 2'b11) begin // If operation is valid
          next_state = CALCULATE;
        end else begin
          next_state = IDLE;
        end
      end
      CALCULATE: begin
        next_state = DONE;
      end
      DONE: begin
        next_state = IDLE;
      end
      default: begin
        next_state = IDLE;
      end
    endcase
  end

endmodule