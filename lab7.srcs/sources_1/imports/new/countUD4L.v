`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2018 03:27:37 PM
// Design Name: 
// Module Name: countUD4L
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


module countUD4L(
input Up, Dw, LD, clk,
input [3:0] sw,
output [3:0] Q,
output UTC, DTC
    );
wire t1;
wire [3:0]D;

assign D[0]=((Q[0]^((Up)|(~Up&Dw))))&~LD |LD&sw[0];
assign D[1]=((Q[1]^((Up&Q[0])|(~Up&Dw&~Q[0]))))&~LD |LD&sw[1];
assign D[2]=((Q[2]^((Up&Q[0]&Q[1])|(~Up&Dw&~Q[0]&~Q[1]))))&~LD |LD&sw[2];
assign D[3]=((Q[3]^((Up&Q[0]&Q[1]&Q[2])|(~Up&Dw&~Q[0]&~Q[1]&~Q[2]))))&~LD |LD&sw[3];

assign t1=(LD|Up|Dw);
assign UTC=Q[0]&Q[1]&Q[2]&Q[3];
assign DTC=~Q[0]&~Q[1]&~Q[2]&~Q[3];
FDRE #(.INIT(1'b0)) ff_instance_1095 (.C(clk), .R(1'b0), .CE(t1), .D(D[0]), .Q(Q[0]));
FDRE #(.INIT(1'b0)) ff_instance_1096 (.C(clk), .R(1'b0), .CE(t1), .D(D[1]), .Q(Q[1]));
FDRE #(.INIT(1'b0)) ff_instance_1097 (.C(clk), .R(1'b0), .CE(t1), .D(D[2]), .Q(Q[2]));
FDRE #(.INIT(1'b0)) ff_instance_1098 (.C(clk), .R(1'b0), .CE(t1), .D(D[3]), .Q(Q[3]));
endmodule
