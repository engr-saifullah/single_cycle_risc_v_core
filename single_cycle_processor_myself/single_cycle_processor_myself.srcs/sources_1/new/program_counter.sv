`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 12:43:34 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input logic clk , rst, 
    input logic [31:0] pc_next,
    output logic [31:0] PC
    );
    always_ff @(posedge clk)begin
    if (!rst) begin
        PC <= 32'h0000_0000;
        end else begin
                PC <= pc_next ;
                end
         end
endmodule
