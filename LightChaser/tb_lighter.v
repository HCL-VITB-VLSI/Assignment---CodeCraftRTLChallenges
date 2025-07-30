module tb_lighter();

    // Declare testbench signals
    reg clk, reset, enable;
    wire [4:0] l;

    // Instantiate the DUT (Device Under Test)
    lighter dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .l(l)
    );

    // Clock generation: toggles every 1 time unit
    initial clk = 0;
    always #1 clk = ~clk;

    // Test sequence
    initial begin
        // Initial conditions
        enable = 0;
        reset = 1;

        // Wait 10 time units before releasing reset
        #10;
        reset = 0;
        enable = 1;

        // Run simulation for 100 time units
        #100;

        // End simulation
        $finish;
    end

endmodule
