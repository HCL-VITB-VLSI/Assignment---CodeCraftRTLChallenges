module lighter(clk, reset, enable, l);

    input clk, reset, enable;
    output reg [4:0] l;

    // State definitions
    parameter s1 = 3'b000,
              s2 = 3'b001,
              s3 = 3'b010,
              s4 = 3'b011,
              s5 = 3'b100;

    parameter delayticks = 4; // Delay in clock cycles

    reg [2:0] state, next_state; // Current and next FSM state
    reg [5:0] counter;           // Delay counter

    // State and counter update logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= s1;
            counter <= 0;
        end else if (enable) begin
            if (counter >= delayticks) begin
                state <= next_state;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // Next state transition logic
    always @(*) begin
        case (state)
            s1: next_state = s2;
            s2: next_state = s3;
            s3: next_state = s4;
            s4: next_state = s5;
            s5: next_state = s1; // Wrap around
            default: next_state = s1;
        endcase
    end

    // Output pattern logic based on current state
    always @(*) begin
        case (state)
            s1: l = 5'b00001;
            s2: l = 5'b00010;
            s3: l = 5'b00100;
            s4: l = 5'b01000;
            s5: l = 5'b10000;
            default: l = 5'b00000;
        endcase
    end

endmodule
