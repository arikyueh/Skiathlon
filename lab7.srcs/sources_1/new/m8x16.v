`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2018 04:16:56 PM
// Design Name: 
// Module Name: m8x16
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


module m8x16(
input [15:0]in0,in1,in2,in3,in4,in5,in6,in7,
input [2:0] sel,
output [15:0]o
    );
assign o=(in0 & {16{(~sel[2] & ~sel[1] & ~sel[0])}}) | (in1 & {16{(~sel[2] & ~sel[1] & sel[0])}}) | (in2 & {16{(~sel[2] & sel[1] & ~sel[0])}}) | (in3 & {16{(~sel[2] & sel[1] & sel[0])}})|
(in4 & {16{(sel[2] & ~sel[1] & ~sel[0])}}) | (in5 & {16{(sel[2] & ~sel[1] & sel[0])}}) | (in6 & {16{(sel[2] & sel[1] & ~sel[0])}}) | (in7 & {16{(sel[2] & sel[1] & sel[0])}});

endmodule
