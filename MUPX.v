module MUPX #(parameter n = 63)(DataIn1 , DataIn2 , X , DataOut);
  input [n:0]DataIn1;
  input [n:0]DataIn2;
  input x;
  output[n:0] DataOut;
  assign DataOut = (x) ? DataIn1 : DataIn2;
endmodule
