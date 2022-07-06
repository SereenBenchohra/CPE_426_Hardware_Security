`timescale 1ns / 1ps
 
module reg_file(
  input [3:0] RF_ADR1, RF_ADR2, RF_WA,
  input RF_EN, CLK,
  input [11:0] RF_WD,
  input [11:0] U_ID,
  output logic [15:0] RF_RS1, RF_RS2,
  output logic [11:0] RF_UID_OUT);
  
  logic [15:0] register [0:15];
    
  initial begin
    int i;  
      for (i=0; i < 16; i++) begin
        register[i] = 0;
      end
    end
    
    // Writing
    always_ff@(posedge CLK)
      begin
          if (RF_EN == 1 && RF_WA != 0)
            if (RF_WA < 13) 
              register[RF_WA] <= RF_WD;
            else if (U_ID[11])
              register[RF_WA] <= RF_WD;
      end 
      
    // Reading
    always @ (RF_ADR1, RF_ADR2)
      begin
        //Neither address is locked
        if (U_ID[11] || (RF_ADR1 < 13 && RF_ADR2 < 13)) begin
          RF_RS1 <= register[RF_ADR1];
          RF_RS2 <= register[RF_ADR2]; end
        //Only address 1 is locked
        else if (RF_ADR1 > 12 && RF_ADR2 < 13) begin
          RF_RS1 <= register[0];
          RF_RS2 <= register[RF_ADR2]; end
        //Only address 2 is locked
        else if (RF_ADR2 > 12 && RF_ADR1 < 13) begin
          RF_RS1 <= register[RF_ADR1];
          RF_RS2 <= register[0]; end
        //Both addresses are locked
        else begin
          RF_RS1 <= register[0];
          RF_RS2 <= register[0]; end
      end
    
    assign RF_UID_OUT = register[1];
    
endmodule
