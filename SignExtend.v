module SignExtend(DataIn , DataOut);
	input [31:0] DataIn;
	output [63:0] DataOut;
	assign DataOut = {{32{DataIn[31]}},DataIn[31:0]};
endmodule
