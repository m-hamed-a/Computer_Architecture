module MUPX(DataIn1 , DataIn2 , X , DataOut);
input [63:0]DataIn1;
input [63:0]DataIn2;
input X;
output[63:0] DataOut;
assign DataOut = (X) ? DataIn1 : DataIn2;
endmodule
