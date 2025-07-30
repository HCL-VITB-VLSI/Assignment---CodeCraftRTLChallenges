
module debouncer_tb;

    reg clk;
    reg noisy_in;
    wire clean_out;

    // Instantiate DUT
    debouncer #(4) uut (
        .clk(clk),
        .noisy_in(noisy_in),
        .clean_out(clean_out)
    );

    // Generate clock (period = 10ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus to simulate noisy button press
    initial begin

        noisy_in = 0;
        #20 noisy_in = 1;   // start pressing
        #10 noisy_in = 0;   // bounce
        #10 noisy_in = 1;   // bounce
        #10 noisy_in = 0;   // bounce
        #10 noisy_in = 1;   // finally stable high

        #60 noisy_in = 0;   // release button
        #30 $finish;
    end

    // Monitor values
    initial begin
        $monitor("Time=%0t | noisy_in=%b | clean_out=%b | counter=%d",
                  $time, noisy_in, clean_out, uut.counter);
    end

endmodule
