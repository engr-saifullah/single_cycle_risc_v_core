`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 10:55:12 PM
// Design Name: 
// Module Name: riscv_tb
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




module riscv_tb();
    logic clk;
    logic rst;
    riscv_single_cycle uut (
        .clk (clk),
        .rst (rst)
    );
    always begin
        clk = 1'b0;
        #10;
        clk = 1'b1;
        #10;
    end
    initial begin
        rst = 1'b0;
        #25; // Hold reset through the first rising edge
        rst = 1'b1;
        #200;
        $finish;
    end
endmodule