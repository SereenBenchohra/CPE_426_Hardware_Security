`timescale 1ns / 1ps

module rf_wrapper(
    input btnC, btnU, btnD, clk,
    input [15:0] sw,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an);
    
    wire sseg_en, mux_uid_sel;
    wire [11:0] rf_uid;
    wire [15:0] ff_uid_out;
    wire [11:0] rf_wd, rf_uid_out;
    wire [15:0] rf_rs1, rf_rs2;
    wire [15:0] to_seg;
    
    reg_file reg_file(
      .RF_ADR1(sw[7:4]),
      .RF_ADR2(sw[11:8]),
      .RF_WA(sw[3:0]),
      .U_ID(rf_uid),
      .RF_EN(btnC),
      .CLK(clk),
      .RF_WD(rf_wd),
      .RF_RS1(rf_rs1),
      .RF_RS2(rf_rs2),
      .RF_UID_OUT(rf_uid_out));
      
    ff_16b ff_uid(
      .d(sw[11:0]),
      .g(btnD),
      .q(ff_uid_out[11:0]));
      
    ff_16b ff_wd(
      .d(sw[11:0]),
      .g(btnU),
      .q(rf_wd));
    
    assign led = rf_wd;
    
    mux_4_1 mux_display(
      .sel(sw[15:14]),
      .d0(rf_rs1),
      .d1(rf_rs2),
      .d2(rf_uid),
      .d3(rf_uid),
      .out(to_seg));
          
    mux_2_1 mux_uid(
      .sel(sseg_en),
      .d0(ff_uid_out),
      .d1(rf_uid_out),
      .out(rf_uid));
    
    sseg_des sseg_des(
      .COUNT(to_seg),
      .CLK(clk),
      .VALID(1'b1),
      .DISP_EN(an),
      .SEGMENTS(seg));
    
endmodule