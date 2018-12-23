module ALUControl (input ALUOp0 , input ALUOp1 ,input [31:0] instruction, output [3:0] operation_code);

    wire [1:0] ALUOp = {ALUOp1, ALUOp0};

    always @ (ALUOp0, ALUOp1, instruction) begin

       casex(ALUOp)
     
         2'b1x: begin

               casex(instruction_part)
 
                  11'b10001011000: operation_code = 0010;
                  11'b11001011000: operation_code = 0110;
                  11'b10001010000: operation_code = 0000;
                  11'b10101010000: operation_code = 0001;
                
               endcase

         end
         2'b00: operation_code = 4'b0010;
         2'bx1: operation_code = 4'b0111;

      endcase

   end

endmodule
