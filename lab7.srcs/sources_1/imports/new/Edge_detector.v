`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2018 04:34:45 PM
// Design Name: 
// Module Name: Edge_detector
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


module Edge_detector(
input btnC,clk,
output check
    );
wire q1,q2;
FDRE #(.INIT(1'b0)) Bit1 (.C(clk), .R(1'b0), .CE(1'b1), .D(btnC), .Q(q1));
//FDRE #(.INIT(1'b0)) Bit2 (.C(clk), .R(1'b0), .CE(1'b1), .D(q1), .Q(q2));
assign check=(~btnC & q1);
endmodule
