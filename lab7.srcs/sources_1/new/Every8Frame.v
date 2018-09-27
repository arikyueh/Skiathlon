`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2018 06:21:59 PM
// Design Name: 
// Module Name: Every8Frame
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


module Every8Frame(
input RTimer, qsec, clk,
output [3:0] Q
    );
wire [3:0]D;

assign D[0]=(Q[0]^qsec);
assign D[1]=(Q[1]^(qsec&Q[0]));
assign D[2]=(Q[2]^(qsec&Q[0]&Q[1]));
assign D[3]=(Q[3]^(qsec&Q[0]&Q[1]&Q[2]));

FDRE #(.INIT(1'b0)) ff_instance_1095 (.C(clk), .R(RTimer), .CE(qsec), .D(D[0]), .Q(Q[0]));
FDRE #(.INIT(1'b0)) ff_instance_1096 (.C(clk), .R(RTimer), .CE(qsec), .D(D[1]), .Q(Q[1]));
FDRE #(.INIT(1'b0)) ff_instance_1097 (.C(clk), .R(RTimer), .CE(qsec), .D(D[2]), .Q(Q[2]));
FDRE #(.INIT(1'b0)) ff_instance_1098 (.C(clk), .R(RTimer), .CE(qsec), .D(D[3]), .Q(Q[3]));
endmodule
