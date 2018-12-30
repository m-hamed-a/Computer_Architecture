module CPU ();

    wire clock, zero_alu, reg_to_loc, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op_1, alu_op_0;
    wire [3 : 0] alu_opcode;
    wire [4 : 0] output_register_bank_multiplexer;
    wire [31 : 0] instruction;
    wire [63 : 0] old_pc, new_pc, output_pc_adder, output_data_memory, output_alu, reg_data_1, reg_data_2, output_alu_multiplexer, input_data_register, output_sign_extend, output_shift_unit, output_shift_unit_adder;

    reg pc_reset;

    initial begin
        pc_reset = 1; 
        #100 pc_reset = 0;
    end

    Clock clock_1(clock);



    Multiplexer pc_multiplexer (
        .input_data_1(output_pc_adder),
        .input_data_2(output_shift_unit_adder),
        .input_select(branch & zero_alu),
        .output_data(new_pc)
    );

    Register pc_1 (   
        .clock(clock),
        .reset(pc_reset),
        .new_output(new_pc),
        .old_output(old_pc)
    );

    Adder pc_adder (
        .DataIn1(old_pc),
        .DataIn2(64'b100),
        .DataOut(output_pc_adder)
    );

    InstructionMemory instruction_memory (
        .input_address(old_pc), 
        .output_data(instruction)
    );



    ControlUnit control_unit (
        .instruction_part(instruction[31 : 21]),
        .Reg2Loc(reg_to_loc), 
        .ALUSrc(alu_src), 
        .MemtoReg(mem_to_reg), 
        .RegWrite(reg_write),
        .MemRead(mem_read), 
        .MemWrite(mem_write), 
        .Branch(branch), 
        .ALUOp1(alu_op_1),
        .ALUOp0(alu_op_0)
    );

    Multiplexer # (.n(5)) register_bank_multiplexer (
        .input_data_1(instruction[20 : 16]),
        .input_data_2(instruction[4 : 0]),
        .input_select(reg_to_loc),
        .output_data(output_register_bank_multiplexer)
    );

    regBank32x64 register_bank (
        .clock(clock),
        .write(reg_write),
        .input_address_1(instruction[9 : 5]),
        .input_address_2(output_register_bank_multiplexer),
        .input_address_3(instruction[4 : 0]),
        .input_data(input_data_register),
        .output_data_1(reg_data_1),
        .output_data_2(reg_data_2)
    );

    SignExtend sign_extend (
        .instruction(instruction), 
        .output_data(output_sign_extend)
    );



    ALUControl alu_control_unit (
        .ALUOp0(alu_op_0),
        .ALUOp1(alu_op_1),
        .instruction(instruction[31 : 21]),
        .operation_code(alu_opcode)
    );

    MUPX alu_multiplexer(
        .DataIn1(reg_data_2),
        .DataIn2(output_sign_extend),
        .x(alu_src),
        .DataOut(output_alu_multiplexer)
    );

    ALU alu (
        .data1(reg_data_1),
        .data2(output_alu_multiplexer),
        .ALU_Select(alu_opcode),
        .result(output_alu),
        .zero(zero_alu)
    );

    Shift shift_unit (
        .DataIn(output_sign_extend), 
        .DataOut(output_shift_unit)
    );

    adder shift_unit_adder(
        .DataIn1(old_pc),
        .DataIn2(output_shift_unit),
        .DataOut(output_shift_unit_adder)
    );



    DataMemory data_memory (
        .clock(clock), 
        .write(mem_write), 
        .read(mem_read), 
        .input_address(output_alu), 
        .input_data(reg_data_2),
        .output_data(output_data_memory)
    );

    

    Multiplexer data_memory_multiplexer (
        .DataIn1(output_alu),
        .DataIn2(output_data_memory),
        .x(mem_to_reg),
        .DataOut(input_data_register)
    );

endmodule
