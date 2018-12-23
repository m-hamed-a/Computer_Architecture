module PC (input clock , input reset , input [63 : 0] pcN , output [63: 0] pcO);

	always @ (posedge clock) begin
		
		if(reset)
			pcO = 0;
		else
			pcO = pcN;
	end

endmodule
