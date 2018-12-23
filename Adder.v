module adder(DataIn1 , DataIn2 , DataOut);
input [63:0]DataIn1;
input [63:0]DataIn2;
output[63:0]DataOut;
	assign DataOut = DataIn1+DataIn2;
endmodule
