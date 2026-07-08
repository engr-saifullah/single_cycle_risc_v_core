`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 10:23:13 PM
// Design Name: 
// Module Name: mux
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


module mux(

    input logic [31:0] a1,
    input logic [31:0] a2,
    input logic s,
    output logic [31:0] y

    );
    
    assign y = (s) ? a2 : a1 ;
    
endmodule
