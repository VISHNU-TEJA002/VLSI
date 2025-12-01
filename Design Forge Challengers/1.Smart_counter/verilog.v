`timescale 1ns/1ps
module smartcounter (
    input         clk,
    input         reset,     // synchronous reset to 0
    input         enable,    // count when high
    input         load,      // load 'data_in' when high
    input  [7:0]  data_in,   // value to load
    output reg [7:0] count   // current count value
);

    always @(posedge clk) begin
        if (reset) begin
            count <= 8'd0;
        end else if (load) begin
            count <= data_in;
        end else if (enable) begin
            count <= count + 1'b1;
        end
    end

endmodule
