module ALU#(parameter n = 64)(idata1 , data2 ,ALU_Select ,result ,zero);
input[n-1:0] data1;
input[n-1:0] data2;
input[3:0] ALU_Select;
output[n-1:0] result;
output zero;
assign output_zero = output_data == 0 ? 1 : 0;
	always @(*)
	begin
		case(ALU_Select)
		4'b0000: result = data1 & data2;
		4'b0001: result = data1 | data2;
		4'b0010: result = data1 + data2;
		4'b0110: result = data1 - data2;
		4'b0111: result = data2;
		4'b1100: result = ~(data1 | data2);
		endcase
	end
	assign c = temp[64];
	assign zero = (output_data == 0) ? 1 : 0;
endmodule
