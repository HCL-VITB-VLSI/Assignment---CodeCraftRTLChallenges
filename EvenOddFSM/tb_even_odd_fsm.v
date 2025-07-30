module tb_even_odd_fsm();
reg clk,reset;
reg [2:0] in;
wire even,odd;
even_odd_fsm dut(.clk(clk),.reset(reset),.in(in),.even(even),.odd(odd));
initial clk=0;
always #1 clk=~clk;
initial begin
reset=1;in=3'b000;
#10;
reset=0;in=3'b110;
#10;
reset=0;in=3'b011;
#10;
$finish();
end
endmodule
