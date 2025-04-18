module fsmd_up_down_counter (
    input clk,
    input rst,
    input up,           // If 1: count up; If 0: count down
    output reg [3:0] count
);

  // FSM States
  parameter IDLE = 2'b00, COUNT = 2'b01, HOLD = 2'b10;
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
    if (rst)
      count <= 4'b0000;
    else begin
      case (current_state)
        IDLE: count <= count;
        COUNT: count <= up ? count + 1 : count - 1;
        HOLD: count <= count;
      endcase
    end
  end

  // Next State Logic
  always @(*) begin
    case (current_state)
      IDLE: next_state = COUNT;
      COUNT: next_state = HOLD;
      HOLD: next_state = COUNT;
      default: next_state = IDLE;
    endcase
  end

endmodule
