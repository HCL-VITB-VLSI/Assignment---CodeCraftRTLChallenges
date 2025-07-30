module debouncer (
    input  clk,
    input  noisy_in,
    output reg clean_out
);
    parameter STABLE_CYCLES = 4;  // Number of stable cycles required
    reg [$clog2(STABLE_CYCLES):0] counter;  // Counter for stability tracking
    reg prev_in;

    initial begin
        clean_out = 0;
        counter   = 0;
        prev_in   = 0;
    end

    always @(posedge clk) begin
        // If input is high and same as previous, increment counter
        if (noisy_in == prev_in) begin
            if (counter < STABLE_CYCLES)
                counter <= counter + 1;
        end else begin
            counter <= 0; // Reset counter if input toggles
        end

        // Update clean_out only after stable high
        if (counter == STABLE_CYCLES && noisy_in == 1)
            clean_out <= 1;
        else if (noisy_in == 0)
            clean_out <= 0;

        prev_in <= noisy_in;
    end
endmodule
