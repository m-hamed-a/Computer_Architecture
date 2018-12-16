module testbench(l,m,n,w,clk,datan);
	output reg [4:0] l,m,n;
	output reg w ;
	output reg [63:0] datan;
	input clk;

	initial begin
		w = 0;
		l = 5'd0;
		m = 5'd1;
		n = 5'd2;
		datan = 64'd0;
	end
	always @(posedge clk)
	begin

		w = ~w;
		datal = datal + 64'd32;
		l = l + 5'b00001;
		m = m + 5'b00001;
		n = n + 5'b00001;

	end
endmodule
