module ones_detector(in, clk, reset, out);

    input [7:0] in;
    input clk, reset;
    output reg [7:0] out;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            out <= 0;                     // Clear output on reset
        end
        else begin
            // Count number of ones in input vector
            out <= in[0] + in[1] + in[2] + in[3] + 
                   in[4] + in[5] + in[6] + in[7];
        end
    end

endmodule
