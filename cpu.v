module CPU();
	wire [4:0] l , m , n;
	wire [63:0] datal,datam,datan;
	wire clk,w;
	os os0(clk);
	testbench testbench0(l,m,n,w,clk,datan);
	regBank32x64 regBank0(l,m,n,w,datal,datam,datan,clk);


endmodule
