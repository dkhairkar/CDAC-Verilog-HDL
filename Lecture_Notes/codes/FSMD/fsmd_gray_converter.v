module fsmd_gray_converter (
    input clk,
    input rst,
    input [3:0] binary_in,
    input start,
    output reg [3:0] gray_out,
    output reg done
);

  // FSM States
  parameter IDLE = 2'b00, CONVERT = 2'b01, DONE = 2'b10;
  reg [1:0] current_state, next_state;

  // FSM State Register
  always @(posedge clk or posedge rst) begin
    if (rst)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end

  // Datapath Logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      gray_out <= 0;
      done <= 0;
    end else begin
      case (current_state)
        IDLE: begin
          gray_out <= 0;
          done <= 0;
        end
        CONVERT: begin
          gray_out <= binary_in ^ (binary_in >> 1);
          done <= 0;
        end
        DONE: done <= 1;
      endcase
    end
  end

  // Next State Logic
  always @(*) begin
    case (current_state)
      IDLE: next_state = start ? CONVERT : IDLE;
      CONVERT: next_state = DONE;
      DONE: next_state = IDLE;
      default: next_state = IDLE;
    endcase
  end

endmodule
