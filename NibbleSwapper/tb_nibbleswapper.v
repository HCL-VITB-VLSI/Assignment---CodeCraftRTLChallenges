module tb_swapper();

    reg clk, reset, swap;
    reg [7:0] in;
    wire [7:0] out;

    // Instantiate the swapper module
    swapper dut (
        .clk(clk),
        .reset(reset),
        .swap(swap),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial clk = 0;
    always #0.5 clk = ~clk;

    initial begin
        reset = 1; swap = 0; in = 8'b00000000;
        #10;

        reset = 0; swap = 1; in = 8'b01101001;
        #10;

        in = 8'b01101011;  // Corrected to 8 bits
        #10;

        in = 8'b01101111;
        #10;

        in = 8'b01101001;
        #10;

        $finish;
    end

endmodule
