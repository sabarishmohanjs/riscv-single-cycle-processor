`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 11.08.2025 21:47:21
//// Design Name: 
//// Module Name: tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


module tb();
   reg clk=0;
   reg rst=0;
//    wire [31:0] PC;
//    reg [2:0] ALUControl=3'b000;
//    wire [31:0] PCNext;
//    reg RegWrite=1'b0;
//    reg [1:0] ImmSrc=2'b10;   
//    //reg PCSrc=1'b0;
//   // reg [31:0] dummy_reg_wd3=32'h0000abcd;
//    wire [31:0] RD1;
//    wire [31:0] RD2;
//    wire [31:0] ALUResult;
//    wire [31:0] ImmExt;
//    reg WE=1'b0;
    
   top_module dut(clk,rst);
   always #5 clk=~clk;
    
      initial
      begin
     // $monitor("Time=%0t | rst=%b | PC=%0h |PCNext=%0h |RD=%h |A1=%h|RD1=%h |RD2=%h| Aluresult=%h|WD=%h|destination mem=%h",$time,rst,PC,PCNext,dut.instr,dut.u_register_file.A1,RD1,RD2,ALUResult,dut.u_data_mem.WD,dut.u_data_mem.datamem[dut.u_data_mem.A]);
//       $monitor($time,"rst=%b | Pc=%0d | pcnext=%0d |instr=%0h |rd1=%0d | rd2=%0d|srca=%0d|srcb=%0d| ALUresult=%0h | resultsrc=%0b|result=%d |wd3=%0h|WE=%0d|imm=%0h|pctarget=%0d|pcalusrc=%0b",rst,dut.PC,dut.PCNext,dut.u_inst_mem.A,dut.u_inst_mem.RD,dut.u_register_file.A1, dut.u_register_file.A2,dut.u_register_file.RD1,dut.u_register_file.RD2,dut.u_alu.SrcA,dut.u_mux_regtoalu.SrcB,dut.u_mux_dmtoreg.ALUResult,dut.u_aludecoder.ResultSrc,dut.u_mux_dmtoreg.Result,dut.WD3,dut.u_data_mem.WE,dut.u_extend.ImmExt,dut.u_PC_target.PCTarget,dut.u_mux_pctoalu.PC);
       $monitor($time,"rst=%b | Pc=%0d | pcnext=%0d |instr=%0h |srca=%0d|srcb=%0d| ALUresult=%0h |wd3=%0h|",rst,dut.PC,dut.PCNext,dut.u_inst_mem.RD,dut.u_alu.SrcA,dut.u_mux_regtoalu.SrcB,dut.u_mux_dmtoreg.ALUResult,dut.WD3);

       #10; rst=1;
       #500;
        
    //    //$monitor("read data=%h",dut.u_data_mem.RD);
    //    //$monitor("destination register=%h",dut.u_register_file.register[6]);
       $stop;      
            
       end
    
endmodule
