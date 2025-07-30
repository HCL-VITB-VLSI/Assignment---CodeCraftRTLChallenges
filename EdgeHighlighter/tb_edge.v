module tb_alert;

    reg clk;
    reg signal;
    wire on, off;

    // Instantiate the Device Under Test (DUT)
    alert dut (
        .clk(clk),
        .signal(signal),
        .on(on),
        .off(off)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize input signal
        signal = 0;

        // Wait 10ns then trigger rising edge
        #12 signal = 1;

        // Wait 20ns then trigger falling edge
        #20 signal = 0;

        // Wait 15ns then another rising edge
        #15 signal = 1;

        // Wait 10ns then another falling edge
        #10 signal = 0;

        // Wait and finish simulation
        #20 $finish;
    end

    // Monitor changes
    initial begin
        $display("Time\tclk\tsignal\ton\toff");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, clk, signal, on, off);
    end

endmodule
