module rotator_unit (
    input clk,
    input reset,
    input in1,      // Rotate left if high
    input in2,      // Rotate right if high
    output reg [7:0] out
);

    // 3-bit current and next state to track the position of '1'
    reg [2:0] cs, ns;

    // Initial state encoding (0 to 7)
    parameter s0 = 3'd0,
              s1 = 3'd1,
              s2 = 3'd2,
              s3 = 3'd3,
              s4 = 3'd4,
              s5 = 3'd5,
              s6 = 3'd6,
              s7 = 3'd7;

    // State and output register update
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cs   <= s0;
            out  <= 8'b00000001; // Start with bit 0 active
        end else begin
            cs   <= ns;
            out  <= 8'b00000001 << ns; // Shift active bit
        end
    end

    // Next state logic: rotates left or right
    always @(*) begin
        ns = cs; // default to hold current state

        if (in1 && ~in2) begin // Rotate left
            case (cs)
                s0: ns = s1;
                s1: ns = s2;
                s2: ns = s3;
                s3: ns = s4;
                s4: ns = s5;
                s5: ns = s6;
                s6: ns = s7;
                s7: ns = s0; // wrap around
            endcase
        end else if (~in1 && in2) begin // Rotate right
            case (cs)
                s0: ns = s7;
                s1: ns = s0;
                s2: ns = s1;
                s3: ns = s2;
                s4: ns = s3;
                s5: ns = s4;
                s6: ns = s5;
                s7: ns = s6;
            endcase
        end
        // If both in1 and in2 are low or both are high, hold current state
    end

endmodule
