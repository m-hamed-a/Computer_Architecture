module shift2(DataIn , DataOut);
	input [63:0]DataIn;
  output[63:0] DataOut;
  wire [1:0] X = 2'b0;
	assign DataOut = {DataIn[63:0] , X};
endmodule
