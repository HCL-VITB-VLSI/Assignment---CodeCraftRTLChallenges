module tb three bit();

reg clk, reset, signal; wire flag;

three bit dut (

.clk(clk),

.reset(reset), .signal(signal),

.flag(flag)

);


initial clk = 0;

always #1 clk = ~clk;


initial begin

end

// Initialize signals

reset = 1;

signal = 0;

// Hold reset for a few clock cycles #5; reset = 0:

// Rising edge #2

// Stimulate rising edges on signal

#2 signal = 1; // Rising edge #1

#2 signal = 0;

#2 signal = 1;

#2 signal = 0;

#2 signal = 1; // Rising edge #3 (should set 'on' if logic correct)

#2 signal

// Wait some time to observe 'on' signal #10;

$finish;

endmodule
