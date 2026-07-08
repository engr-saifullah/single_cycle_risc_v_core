`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 10:29:40 PM
// Design Name: 
// Module Name: datapath
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


module datapath (
    input logic clk, rst,
    input logic PCSrc , ResultSrc , MemWrite , AluSrc , RegWrite,
    input logic [2:0] AluControl ,
    input logic [1:0] ImmSrc ,
    output logic [31:0] Instr,
    output logic zero

);

    //internal wiring 
    logic [31:0] PCNext , PC , SrcA ,SrcB , AluResults , WriteData , ReadData , Results , ImmExt , PCPlus4 , PCTarget;
    
    
    //instantiation
    mux pc_muc(
        .a1(PCPlus4),
        .a2(PCTarget),
        .s(PCSrc),
        .y(PCNext)
        
    
    );
    
    program_counter prog_counter(
        .clk(clk),
        .rst(rst),
        .pc_next(PCNext),
        .PC(PC)
    
    );
    
    instruction_memory instr_mem(
        .pc(PC),
        .Instr(Instr)
    );  
    
    register_file reg_file(
        .clk(clk),
        .rst(rst),
        .we3(RegWrite),
        .a1(Instr[19:15]),
        .a2(Instr[24:20]),
        .a3(Instr[11:7]),
        .wd3(Results),
        .rd1(SrcA),
        .rd2(WriteData)
        
    
    );
    
    mux alu_srcB_mux(
        .a1(WriteData),
        .a2(ImmExt),
        .s(AluSrc),
        .y(SrcB)
    
    
    );
    
    alu alu_unit(
        .SrcA(SrcA),
        .SrcB(SrcB),
        .AluControl(AluControl),
        .zero(zero),
        .AluResults(AluResults)
    
    );
    
    data_memory data_mem(
        .AluResults(AluResults),
        .clk(clk),
        .rst(rst),
        .MemWrite(MemWrite),
        .WriteData(WriteData),
        .ReadData(ReadData)
    
    );
    
    mux results_mux(
        .a1(AluResults),
        .a2(ReadData),
        .s(ResultSrc),
        .y(Results)
        
    
    );
    
    extend extend_unit(
        .instr(Instr[31:7]),
        .imm_src(ImmSrc),
        .imm_ext(ImmExt)
        
    );
    adder pc_adder(
        .a(PC),
        .b(ImmExt),
        .y(PCTarget)
    
    );
    
    adder pc_plus4(
        .a(PC),
        .b(32'd4),
        .y(PCPlus4)
    );

endmodule
