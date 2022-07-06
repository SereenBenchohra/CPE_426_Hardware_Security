`timescale 1ns / 1ps

module mux_2_1(
    input sel,
    output reg [15:0] out,
    input [15:0] d0,
    input [15:0] d1);
    
    always @ (*) begin
      case(sel)
          1'b0 : out <= d0;
          1'b1 : out <= d1;
      endcase
    end
endmodule
