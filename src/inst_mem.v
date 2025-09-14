`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 22:26:23
// Design Name: 
// Module Name: inst_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comm ents:
// 
//////////////////////////////////////////////////////////////////////////////////


module inst_mem(
input [31:0] A,
output [31:0] RD
    );
    reg [31:0] instr [31:0];
    initial
    begin
        $readmemh("instruction_memory.mem",instr);
    end
   
    
     assign RD=instr[A[6:2]];
    //always@(*)
    /*
    initial
    begin
        instr[0]=32'b000000000010_10101_000_10110_0010011;//addi x22,x21,2
//      instr[0]=32'b0000000_11001_10000_000_01101_0110011;//add x13,x16,x25
//      instr[1]=32'b0100000_00011_01000_000_00101_0110011;//sub x5,x8,x3
//      instr[2]=32'b0000000_00011_00010_111_00001_0110011;//and x1,x2,x3
//      instr[3]=32'b0000000_00110_00011_110_00100_0110011;//or x4,x3,x6
//      instr[4]=32'b0000000_00010_00011_010_00111_0110011;//slt x7,x3,x21
//      instr[5]=32'b0_000000_01001_01001_000_0110_0_1100011;//beq x9,x9.12
//      instr[6]=32'b000000001111_00010_010_01000_0000011;//lw x8,15(x2)
//      instr[7]=32'b0000000_01110_00110_010_01100_0100011;//sw 14,12(x6)
//      instr[0]=32'b0_00000011_0_0000000000_00001_1101111;//jal x1,20
//        instr[0]=32'b0000000_00101_00011_001_00100_0110011;// sll x4, x3, x5
    end
    */
endmodule

// in branch instruction , the label location PC must be divided by 4 to access the instruction
//if PC=12 then the instruction to be executed is instr[3]