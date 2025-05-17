`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2025 11:03:29
// Design Name: 
// Module Name: 4bit_adder
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


module adder_4bit (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire c1, c2, c3;

    full_adder FA0 (.a(a[0]), .b(b[0]), .c(cin), .sumf(sum[0]), .carryf(c1));
    full_adder FA1 (.a(a[1]), .b(b[1]), .c(c1), .sumf(sum[1]), .carryf(c2));
    full_adder FA2 (.a(a[2]), .b(b[2]), .c(c2), .sumf(sum[2]), .carryf(c3));
    full_adder FA3 (.a(a[3]), .b(b[3]), .c(c3), .sumf(sum[3]), .carryf(cout));
endmodule
