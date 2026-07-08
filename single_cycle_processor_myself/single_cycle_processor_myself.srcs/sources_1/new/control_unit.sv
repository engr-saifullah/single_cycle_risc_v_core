`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 10:51:58 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit (
    
    input logic [6:0] op,
    input logic [2:0] funct3,
    input logic funct7b5,
    input logic zero,
    output logic PCSrc , ResultSrc , MemWrite , AluSrc , RegWrite,
    output logic [2:0] AluControl,
    output logic [1:0] ImmSrc
    

);
    
    logic [1:0] alu_op;
    logic       branch;
    logic       jump;

  always_comb begin
       
        RegWrite  = 1'b0;
        ImmSrc    = 2'b00;
        AluSrc    = 1'b0;
        MemWrite  = 1'b0;
        ResultSrc = 2'b00;
        branch    = 1'b0;
        jump      = 1'b0;
        alu_op    = 2'b00;
        case (op)
            7'b0110011: begin
                RegWrite  = 1'b1;
                AluSrc    = 1'b0;
                ResultSrc = 2'b00;
                alu_op    = 2'b10; 
            end
            // I-type ALU (addi, andi, ori, etc.)
            7'b0010011: begin
                RegWrite  = 1'b1;
                ImmSrc    = 2'b00;
                AluSrc    = 1'b1;
                ResultSrc = 2'b00;
                alu_op    = 2'b10; 
            end
            // I-type Load (lw)
            7'b0000011: begin
                RegWrite  = 1'b1;
                ImmSrc    = 2'b00;
                AluSrc    = 1'b1;
                ResultSrc = 2'b01; 
                alu_op    = 2'b00; 
            end
            // S-type Store (sw)
            7'b0100011: begin
                ImmSrc    = 2'b01;
                AluSrc    = 1'b1;
                MemWrite  = 1'b1;
                alu_op    = 2'b00; 
            end
            // B-type Branch (beq)
            7'b1100011: begin
                ImmSrc    = 2'b10;
                AluSrc    = 1'b0;
                branch    = 1'b1;
                alu_op    = 2'b01; 
            end
            // J-type Jump (jal)
            7'b1101111: begin
                RegWrite  = 1'b1;
                ImmSrc    = 2'b11;
                ResultSrc = 2'b10; 
                jump      = 1'b1;
            end
            default: ; 
        endcase
    end
  always_comb begin
        case (alu_op)
            2'b00: AluControl = 3'b000; 
            2'b01: AluControl = 3'b001; 
            
            2'b10: begin // R-type & I-type choices dependent on funct codes
                case (funct3)
                    3'b000: begin
                     if (op[5] && funct7b5) 
                            AluControl = 3'b001; // SUB
                        else                   
                            AluControl = 3'b000; // ADD / ADDI
                    end
                    3'b111: AluControl = 3'b010; // AND / ANDI
                    3'b110: AluControl = 3'b011; // OR / ORI
                    3'b100: AluControl = 3'b100; // XOR / XORI
                    3'b001: AluControl = 3'b101; // SLL / SLLI
                    3'b101: AluControl = 3'b110; // SRL / SRLI
                    default: AluControl = 3'b000;
                endcase
            end        
            default: AluControl = 3'b000;
        endcase
    end
  assign PCSrc = jump || (branch && zero);

endmodule
