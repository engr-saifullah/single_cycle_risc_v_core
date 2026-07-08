`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 12:56:40 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input logic [31:0] pc,
    output logic [31:0] Instr
    );   
    logic [31:0] ROM [0:63]; 
    assign Instr = ROM[pc[31:2]]; 
    initial begin 
        $readmemh("program.txt" , ROM);
        end 
endmodule
