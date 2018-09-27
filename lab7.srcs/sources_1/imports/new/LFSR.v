`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2018 02:21:17 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
input run,clk,
output [7:0] D
    );  

FDRE #(.INIT(1'b1)) bit1 (.C(clk), .R(1'b0), .CE(run), .D(D[0]^D[5]^D[6]^D[7]), .Q(D[0]));
//assign rnd[0]=D[1];

FDRE #(.INIT(1'b0)) bit2 (.C(clk), .R(1'b0), .CE(run), .D(D[0]), .Q(D[1]));
//assign rnd[1]=D[2];

FDRE #(.INIT(1'b0)) bit3 (.C(clk), .R(1'b0), .CE(run), .D(D[1]), .Q(D[2]));
//assign rnd[2]=D[3];

FDRE #(.INIT(1'b0)) bit4 (.C(clk), .R(1'b0), .CE(run), .D(D[2]), .Q(D[3]));
//assign rnd[3]=D[4];

FDRE #(.INIT(1'b0)) bit5 (.C(clk), .R(1'b0), .CE(run), .D(D[3]), .Q(D[4]));
//assign rnd[4]=D[5];

FDRE #(.INIT(1'b0)) bit6 (.C(clk), .R(1'b0), .CE(run), .D(D[4]), .Q(D[5]));
//assign rnd[5]=D[6];

FDRE #(.INIT(1'b0)) bit7 (.C(clk), .R(1'b0), .CE(run), .D(D[5]), .Q(D[6]));
//assign rnd[6]=D[7];
FDRE #(.INIT(1'b0)) bit8 (.C(clk), .R(1'b0), .CE(run), .D(D[6]), .Q(D[7]));

endmodule

