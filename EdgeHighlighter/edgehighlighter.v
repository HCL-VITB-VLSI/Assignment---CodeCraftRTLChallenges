module alert (
    input clk,
    input signal,          // Input signal to monitor for edges
    output reg on,         // Pulse on rising edge
    output reg off         // Pulse on falling edge
);

    reg prev_signal;       // Holds previous state of signal

    always @(posedge clk) begin
        // Store previous signal state
        prev_signal <= signal;

        // Default outputs
        on  <= 0;
        off <= 0;

        // Rising edge detection
        if (~prev_signal && signal)
            on <= 1;

        // Falling edge detection
        if (prev_signal && ~signal)
            off <= 1;
    end

endmodule
