`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 21:34:20
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module(input clk,rst);
//    input clk,
//    input rst,
//    input RegWrite,
//    input WE,
//    input[1:0] ImmSrc,
//    //input PCSrc,
//    //input [31:0] dummy_reg_wd3,
//    input [2:0] ALUControl,
//    output [31:0] PC,
//    output [31:0] PCNext,
//    //output [31:0] RD,
//    output [31:0] RD1,
//    output [31:0] RD2,
//    output [31:0] ALUResult,
//    output [31:0] ImmExt
//    );
//    //wire [31:0] PC;
//    wire [31:0] instr;
//    wire [31:0] ReadData;
//    wire [31:0] mux_plus4;
//    wire Zero;
//    wire [31:0] PCTarget;

    wire PCSrc;
    wire[31:0]PCTarget;
    wire[31:0]PCNext;
    wire [31:0]mux_plus4;
    wire [31:0]PC;
    wire [31:0]instr;
    wire RegWrite;
    wire [31:0]ReadData;
    wire [31:0]RD1,RD2;
    wire [4:0]ALUControl;
    wire Zero;
    wire [31:0]ALUResult;
    wire[2:0] ImmSrc;
    wire [31:0]ImmExt;
    wire WE;
    wire [1:0]ResultSrc;
    wire MemWrite;
    wire ALUSrc;
    wire [1:0]ALUOp;
    wire [31:0]SrcB;
    wire [31:0]WD3;
    wire Jump;
    wire PCTargetSrc;
    wire [31:0]PCSrcA;
    wire PCALUSrc;
    wire [31:0]SrcA;
    wire [1:0] StoreSRC;
    wire [31:0] WD;
    wire [2:0]LoadSRC;
    wire[31:0]Result;
    PCMux u_PCMux(
     .PCTarget(PCTarget),
     .PCPlus4(mux_plus4),
     .PCSrc(PCSrc),
     .PCNext(PCNext)
    );
    
    
    pc u_pc(
    .clk(clk),
    .rst(rst),
    .PCNext(PCNext),
    .PC(PC)
    );
    
    pc_next u_pc_next(
    .PC(PC),
    .PCPlus4(mux_plus4)
    );
    
   inst_mem u_inst_mem(
    .A(PC),
    .RD(instr)
    );
    
    register_file u_register_file(
    .clk(clk),
    .rst(rst),
    .A1(instr[19:15]),
    .A2(instr[24:20]),
    .A3(instr[11:7]),
    .WE3(RegWrite),
    .WD3(WD3),//check
    .RD1(RD1),
    .RD2(RD2)
    );
    
    
     extend u_extend(
    .instr(instr),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
     );
     
     mux_regtoalu u_mux_regtoalu(
    .ALUSrc(ALUSrc),
    .RD2(RD2),//rd2 is a wire
    .ImmExt(ImmExt),//wire
    .SrcB(SrcB)//output wire
    );
    
     
    alu u_alu(
    .ALUControl(ALUControl),
    .SrcA(SrcA),
    .Zero(Zero),
    .SrcB(SrcB),
    .ALUResult(ALUResult)
    );
    
     mux_store u_mux_store(.RD2(RD2),.StoreSRC(StoreSRC),.WriteData(WD));
    mux_load u_mux_load(.Result(Result),.LoadSRC(LoadSRC),.WD3(WD3));
    data_mem u_data_mem(
    .clk(clk),
    .rst(rst),
    .WE(MemWrite),
    .A(ALUResult),
    .WD(WD),
    .RD(ReadData)
    );
 
     
    mux_dmtoreg u_mux_dmtoreg(
    .ResultSrc(ResultSrc),
    .ALUResult(ALUResult),
    .ReadData(ReadData),
    .PCPlus4(mux_plus4),
    .Result(Result)//wire
    );
    
     pc_target u_PC_target(
    .PCSrcA(PCSrcA),
    .ImmExt(ImmExt),
    //.Zero(Zero),
    .PCTarget(PCTarget)
    );
    
/*
    maindecoder u_maindecoder(
    .opcode(instr[6:0]),
    .Zero(Zero),//wire
    .PCSrc(PCSrc),//wire
    .ResultSrc(ResultSrc),//wire
    .MemWrite(MemWrite),//wire
    .ALUSrc(ALUSrc),//wire
    .ImmSrc(ImmSrc),//wire
    .RegWrite(RegWrite),//wire
   // .ALUOp(ALUOp),//wire no use of the aluop as we changed the complete code of the alu decoder
    .Jump(Jump),
    .PCTargetSrc(PCTargetSrc),
    .PCALUSrc(PCALUSrc)
    );
  */  
    aludecoder u_aludecoder(
    .opcode(instr[6:0]),
    .funct7(instr[31:25]),
    .funct3(instr[14:12]),
    .ALUControl(ALUControl),//wire
    .Zero(Zero),//wire
    .PCSrc(PCSrc),//wire
    .ResultSrc(ResultSrc),//wire
    .MemWrite(MemWrite),//wire
    .ALUSrc(ALUSrc),//wire
    .ImmSrc(ImmSrc),//wire
    .RegWrite(RegWrite),//wire
   // .ALUOp(ALUOp),//wire no use of the aluop as we changed the complete code of the alu decoder
    .Jump(Jump),
    .PCTargetSrc(PCTargetSrc),
    .PCALUSrc(PCALUSrc),
    .StoreSRC(StoreSRC),
    .LoadSRC(LoadSRC)
    );
    
    reg_to_pctarget u_reg_to_pctarget( 
    .RD1(RD1),
    .PCTargetSrc(PCTargetSrc),
    .PC(PC),
    .PCSrcA(PCSrcA)
    );

    mux_pctoalu u_mux_pctoalu(
    .PC(PC),
    .RD1(RD1),
    .PCALUSrc(PCALUSrc),
    .SrcA(SrcA)
    );
endmodule
