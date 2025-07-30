module tb_bin_gray();

    reg [3:0] a;        // Binary input
    wire [3:0] b;       // Gray code output

    // Instantiate the Unit Under Test (UUT)
    bin_gray dut (
        .a(a),
        .b(b)
    );

    initial begin
        // Apply test vector
        a = 4'b0110;
        #10; // Wait to observe output
        $finish;
    end

endmodule
