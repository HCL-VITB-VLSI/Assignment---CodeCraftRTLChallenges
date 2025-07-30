module swapper(in, swap, clk, reset, out);

    input [7:0] in;
    input clk, reset;
    input swap;
    output reg [7:0] out;

    always @(posedge clk) begin
        if (reset) begin
            out <= 0;                         // Clear output on reset
        end
        else if (swap) begin
            out <= {in[3:0], in[7:4]};        // Swap upper and lower 4 bits
        end
    end

endmodule
