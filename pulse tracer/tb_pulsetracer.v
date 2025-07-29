module tb_noise();
reg clk,signal;
wire clean;
noise dut(.clk(clk),.signal(signal),.clean(clean));
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin

    signal = 0;
    #20;

    // Glitch: short high pulse (< 6 cycles) --> should NOT trigger clean
    signal = 1;
    #15;    
    signal = 0;
    #30;

    // Valid pulse: high for 6+ cycles --> should trigger clean = 1
    signal = 1;
    #70;    
    signal = 0;
    #30;

    // Another valid pulse
    signal = 1;
    #60;    // 6 cycles
    signal = 0;
    #30;

    $finish;
end

endmodule
