`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2018 04:08:37 PM
// Design Name: 
// Module Name: m2_1x8
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


module m2_1x8(
input [7:0] in,
input [7:0] in1,
input sel,
output [7:0] o
 );
assign o = (in & {8{~sel}}) | (in1 & {8{sel}});
endmodule
