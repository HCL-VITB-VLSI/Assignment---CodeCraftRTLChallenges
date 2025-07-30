module three_bit(
    input clk,
    input reset,
    input signal,
    output reg flag
);

    // Internal registers
    reg [2:0] clk_count;       // Counts clock cycles in the detection window
    reg [2:0] edge_count;      // Counts rising edges
    reg window_active;         // Indicates if edge-detection window is active
    reg prev_signal;           // For edge detection

    wire rising_edge = (~prev_signal) & signal; // Detect rising edge of 'signal'

    // Main sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset everything
            prev_signal   <= 0;
            clk_count     <= 0;
            edge_count    <= 0;
            window_active <= 0;
            flag          <= 0;
        end else begin
            prev_signal <= signal;

            if (window_active) begin
                clk_count <= clk_count + 1;

                if (rising_edge)
                    edge_count <= edge_count + 1;

                // If 3 edges are detected, assert flag
                if (edge_count == 3)
                    flag <= 1;

                // Close window after 5 clock cycles
                if (clk_count == 5) begin
                    window_active <= 0;
                    clk_count     <= 0;
                    edge_count    <= 0;
                    // Optionally reset the flag here if needed
                    // flag <= 0;
                end
            end else begin
                // Open window on first rising edge
                if (rising_edge) begin
                    window_active <= 1;
                    clk_count     <= 1;
                    edge_count    <= 1;
                end
            end
        end
    end

endmodule
