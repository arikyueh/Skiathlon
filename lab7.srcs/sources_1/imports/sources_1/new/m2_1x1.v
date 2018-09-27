`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 06:00:01 PM
// Design Name: 
// Module Name: m2_1x1
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


module m2_1x1(
input in,
input in1,
input sel,
output o
 );
assign o = (in & ~sel) | (in1 & sel);

endmodule
