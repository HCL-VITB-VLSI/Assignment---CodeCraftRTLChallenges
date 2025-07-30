module tb_rotator_unit;

    // Declare inputs as regs and outputs as wires
    reg clk, reset, in1, in2;
    wire [7:0] out;

    // Instantiate Device Under Test (DUT)
    rotator_unit dut (
        .clk(clk),
        .reset(reset),
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    // Clock generation: 1 time unit period
    initial clk = 0;
    always #0.5 clk = ~clk;

    initial begin
        // Initialize inputs
        reset = 1;
        in1 = 0;
        in2 = 0;

        #10;
        reset = 0;

        // Rotate left: in1 = 1, in2 = 0
        in1 = 1;
        in2 = 0;
        #50;

        // Rotate right: in1 = 0, in2 = 1
        in1 = 0;
        in2 = 1;
        #50;

        // Stop simulation
        $finish;
    end

endmodule
