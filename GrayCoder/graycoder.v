module bin_gray(a, b);

    input  [3:0] a;      // 4-bit binary input
    output [3:0] b;      // 4-bit Gray code output

    // Gray code logic
    assign b[0] = a[0];              // MSB remains the same
    assign b[1] = a[0] ^ a[1];       // XOR with next bit
    assign b[2] = a[1] ^ a[2];       // Continue XOR chain
    assign b[3] = a[2] ^ a[3];       // LSB transformation

endmodule
