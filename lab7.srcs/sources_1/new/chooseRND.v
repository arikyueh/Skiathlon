`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2018 10:33:06 PM
// Design Name: 
// Module Name: chooseRND
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


module chooseRND(
input [15:0] Rndnum,
input run,LorR,clk,reset,
output [15:0]SelNum,
output direction
    );
    
FDRE #(.INIT(1'b0)) LR (.C(clk), .R(reset), .CE(run), .D(LorR), .Q(direction));

FDRE #(.INIT(1'b0)) bit[15:0] (.C({16{clk}}),.R({16{reset}}),.CE({16{run}}),.D(Rndnum),.Q(SelNum));
//FDRE #(.INIT(1'b0)) bit1 (.C(clk), .R(reset), .CE(run), .D(Rndnum[0]), .Q(SelNum[0]));
//FDRE #(.INIT(1'b0)) bit2 (.C(clk), .R(reset), .CE(run), .D(Rndnum[1]), .Q(SelNum[1]));
//FDRE #(.INIT(1'b0)) bit3 (.C(clk), .R(reset), .CE(run), .D(Rndnum[2]), .Q(SelNum[2]));
//FDRE #(.INIT(1'b0)) bit4 (.C(clk), .R(reset), .CE(run), .D(Rndnum[3]), .Q(SelNum[3]));
//FDRE #(.INIT(1'b0)) bit5 (.C(clk), .R(reset), .CE(run), .D(Rndnum[4]), .Q(SelNum[4]));
//FDRE #(.INIT(1'b0)) bit6 (.C(clk), .R(reset), .CE(run), .D(Rndnum[5]), .Q(SelNum[5]));
//FDRE #(.INIT(1'b0)) bit7 (.C(clk), .R(reset), .CE(run), .D(Rndnum[6]), .Q(SelNum[6]));
//FDRE #(.INIT(1'b0)) bit8 (.C(clk), .R(reset), .CE(run), .D(Rndnum[7]), .Q(SelNum[7]));
//FDRE #(.INIT(1'b0)) bit9 (.C(clk), .R(reset), .CE(run), .D(Rndnum[8]), .Q(SelNum[8]));
//FDRE #(.INIT(1'b0)) bit10 (.C(clk), .R(reset), .CE(run), .D(Rndnum[9]), .Q(SelNum[9]));
//FDRE #(.INIT(1'b0)) bit11 (.C(clk), .R(reset), .CE(run), .D(Rndnum[10]), .Q(SelNum[10]));
//FDRE #(.INIT(1'b0)) bit12 (.C(clk), .R(reset), .CE(run), .D(Rndnum[11]), .Q(SelNum[11]));
//FDRE #(.INIT(1'b0)) bit13 (.C(clk), .R(reset), .CE(run), .D(Rndnum[12]), .Q(SelNum[12]));
//FDRE #(.INIT(1'b0)) bit14 (.C(clk), .R(reset), .CE(run), .D(Rndnum[13]), .Q(SelNum[13]));
//FDRE #(.INIT(1'b0)) bit15 (.C(clk), .R(reset), .CE(run), .D(Rndnum[14]), .Q(SelNum[14]));
//FDRE #(.INIT(1'b0)) bit16 (.C(clk), .R(reset), .CE(run), .D(Rndnum[15]), .Q(SelNum[15]));

endmodule
