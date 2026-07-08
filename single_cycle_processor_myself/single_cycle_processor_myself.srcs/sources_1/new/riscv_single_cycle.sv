`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 10:54:00 PM
// Design Name: 
// Module Name: riscv_single_cycle
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


module riscv_single_cycle (
    input  logic clk,
    input  logic rst  
);
    logic        PCSrc;
    logic        ResultSrc;
    logic        MemWrite;
    logic [2:0]  AluControl;
    logic        ALUSrc;
    logic [1:0]  ImmSrc;
    logic        RegWrite;
    logic        zero;
    logic [31:0] Instr;

    control_unit controller (
        .op         (Instr[6:0]),
        .funct3     (Instr[14:12]),
        .funct7b5   (Instr[30]),
        .zero       (zero),
        .PCSrc      (PCSrc),
        .ResultSrc  (ResultSrc),
        .MemWrite   (MemWrite),
        .AluControl (AluControl),
        .AluSrc     (ALUSrc),
        .ImmSrc     (ImmSrc),
        .RegWrite   (RegWrite)
    );
   datapath cpu_datapath (
        .clk        (clk),
        .rst        (rst),
        .PCSrc      (PCSrc),
        .ResultSrc  (ResultSrc),
        .MemWrite   (MemWrite),
        .AluControl (AluControl),
        .AluSrc     (ALUSrc),
        .ImmSrc     (ImmSrc),
        .RegWrite   (RegWrite),
        .zero       (zero),
        .Instr      (Instr)
    );
endmodule