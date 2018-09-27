`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2018 01:20:33 PM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
input start,
input clk,
output [3:0]q
    );
wire q0,q1,q2;
FDRE #(.INIT(1'b0)) ringcounter0 (.C(clk), .R(1'b0), .CE(start), .D(q3), .Q(q0));
FDRE #(.INIT(1'b0)) ringcounter1 (.C(clk), .R(1'b0), .CE(start), .D(q0), .Q(q1));
FDRE #(.INIT(1'b1)) ringcounter2 (.C(clk), .R(1'b0), .CE(start), .D(q1), .Q(q2));
FDRE #(.INIT(1'b0)) ringcounter3 (.C(clk), .R(1'b0), .CE(start), .D(q2), .Q(q3));
assign q={q3,q2,q1,q0};


endmodule
