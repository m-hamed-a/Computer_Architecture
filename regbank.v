module regBank32x64(input [4:0] l ,input [4:0] m ,input [4:0] n ,input w ,output reg [63:0] datal ,output reg [63:0] datam ,input [63:0] datan ,input clk);
	reg [63:0] regbank [0:31];


	always @(posedge clk) begin
		datal = regbank[l];
		datam = regbank[m];

		if (w==1) regbank[n] = datan;
	end
endmodule
