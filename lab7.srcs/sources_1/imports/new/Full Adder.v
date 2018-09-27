`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2018 03:37:14 PM
// Design Name: 
// Module Name: Full Adder
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


module FullAdder(
    input a0,
    input b0,
    input cin,
    output c1,
    output s0
    );
    assign s0=(~a0 & ~b0 & cin) | (~a0 & b0 & ~cin) | (a0 & ~b0 & ~cin) | (a0 & b0 & cin);
    assign c1= (~a0 & b0 & cin) | (a0 & ~b0 & cin) | (a0 & b0 & ~cin) | (a0 & b0 & cin);
endmodule
