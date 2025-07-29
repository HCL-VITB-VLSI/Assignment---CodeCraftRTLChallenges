module tb_ones_detector();

    reg [7:0] in;
    reg clk, reset;
    wire [7:0] out;

    // Instantiate the design under test (DUT)
    ones_detector dut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Generate clock signal
    initial clk = 0;
    always #1 clk = ~clk;

    initial begin
        reset = 1;
        #10;
        reset = 0;

        // Apply test inputs
        in = 8'b10101010;  // 4 ones
        #10;

        in = 8'b00011000;  // 2 ones
        #10;

        in = 8'b00101001;  // 4 ones
        #10;

        $finish;
    end

endmodule
