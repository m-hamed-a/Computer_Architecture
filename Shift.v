module Shift(DataIn , DataOut);
	input [63:0] DataIn;
        output [63:0] DataOut;

	    assign DataOut = DataIn << 2;
endmodule
