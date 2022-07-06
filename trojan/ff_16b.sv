`timescale 1ns / 1ps

module ff_16b(
  input [15:0] d,
  input g,
  output reg [15:0] q);
  
  always@(posedge g)
  begin
    q <= d;
  end
  
endmodule
