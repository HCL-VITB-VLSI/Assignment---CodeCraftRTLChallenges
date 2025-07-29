module noise(clk, signal, clean);
    input clk, signal;
    output reg clean;

    reg [2:0] counter = 0;      
    reg prev_signal = 0;       
    reg pulse_started = 0;      

    parameter k = 6;            

    always @(posedge clk) begin
        // Detect rising edge of signal
        if (~prev_signal & signal) begin
            pulse_started <= 1;
            counter <= 1;
        end

        // If pulse is ongoing and signal remains high
        if (pulse_started && signal) begin
            if (counter < k) begin
                counter <= counter + 1;
                clean <= 0;     // Wait until pulse is long enough
            end
            else begin
                counter <= 0;
                clean <= 1;     // Valid pulse detected
                pulse_started <= 0;
            end
        end
        // If signal goes low, reset tracking
        else if (~signal) begin
            pulse_started <= 0;
            counter <= 0;
        end

        // Update previous signal state
        prev_signal <= signal;
    end
endmodule
