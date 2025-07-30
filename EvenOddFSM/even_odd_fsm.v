module even_odd_fsm(in,clk,reset,even,odd);
input [2:0] in;
input clk,reset;
output reg even,odd;
reg [1:0] cs,ns;
parameter s1=2'b00,s2=2'b01,s3=2'b10;
always @(posedge clk or posedge reset)begin
if(reset)begin
even<=0;
odd<=0;
cs<=s1;
end
else begin
cs<=ns;
end
end
always @(*)begin
if(in%2==0)begin
even<=1;
odd<=0;
ns<=s2;
end
else if(in[0]==1)begin
even<=0;
odd<=1;
ns<=s3;
end
end
endmodule
