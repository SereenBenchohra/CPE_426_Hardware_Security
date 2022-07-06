`timescale 1ns / 1ps

module mux_4_1(
    input [1:0] sel,
    output reg [15:0] out,
    input [15:0] d0,
    input [15:0] d1,
    input [15:0] d2,
    input [15:0] d3);
    
    always @ (*) begin
      case(sel)
          2'b00 : out <= d0;
          2'b01 : out <= d1;
          2'b10 : out <= d2;
          2'b11 : out <= d3;
      endcase
    end
endmodule
