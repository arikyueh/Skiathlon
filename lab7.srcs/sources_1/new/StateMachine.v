`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2018 01:03:16 PM
// Design Name: 
// Module Name: StateMachine
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


module StateMachine(
input btnC,Foursec,btnL, btnR, clk, BoundHitL,BoundHitR,gameover,GG,
output IDLE,Start,GoLeft,GoRight,add1,sub1,YAY,CRASH,BothBtns
    );
wire [6:0] D;
assign D[0]=(~btnC&IDLE);
assign D[1]=(btnC&(IDLE|YAY|CRASH))|(~Foursec&Start);
assign D[2]=(btnR&~btnL&(GoLeft|BothBtns))|(~btnL&~BoundHitR&~GG&~gameover&GoRight)|
(BoundHitL&GoLeft)|(Foursec&Start);
assign D[3]=(btnL&~btnR&(GoRight|BothBtns))|(~btnR&~BoundHitL&~GG&~gameover&GoLeft)|
(BoundHitR&GoRight);
assign D[4]=(GG&(GoLeft|GoRight|BothBtns))|(~btnC&YAY);
assign D[5]=(gameover&(GoRight|GoLeft|BothBtns)|(~btnC&CRASH));
assign D[6]=((GoLeft|GoRight)&btnL&btnR)|(btnL&btnR&BothBtns);

assign add1=(GG&(GoLeft|GoRight));
assign sub1=(gameover&(GoRight|GoLeft));

FDRE #(.INIT(1'b1)) Q0 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[0]), .Q(IDLE));
FDRE #(.INIT(1'b0)) Q1 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[1]), .Q(Start));
FDRE #(.INIT(1'b0)) Q2 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[2]), .Q(GoRight));
FDRE #(.INIT(1'b0)) Q3 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[3]), .Q(GoLeft));
FDRE #(.INIT(1'b0)) Q4 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[4]), .Q(YAY));
FDRE #(.INIT(1'b0)) Q5 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[5]), .Q(CRASH));
FDRE #(.INIT(1'b0)) Q6 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[6]), .Q(BothBtns));

endmodule
