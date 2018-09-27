`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2018 03:20:54 PM
// Design Name: 
// Module Name: TurkeyCounter
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


module TurkeyCounter(
input Up, Dw, clk,
output [7:0] Q
    );
wire [7:0]D;
wire t1;

assign t1=Up|Dw;

assign D[0]=((Q[0]^((Up)|(~Up&Dw))));
assign D[1]=((Q[1]^((Up&Q[0])|(~Up&Dw&~Q[0]))));
assign D[2]=((Q[2]^((Up&Q[0]&Q[1])|(~Up&Dw&~Q[0]&~Q[1]))));
assign D[3]=((Q[3]^((Up&Q[0]&Q[1]&Q[2])|(~Up&Dw&~Q[0]&~Q[1]&~Q[2]))));
assign D[4]=((Q[4]^((Up&Q[0]&Q[1]&Q[2]&Q[3])|(~Up&Dw&~Q[0]&~Q[1]&~Q[2]&~Q[3]))));
assign D[5]=((Q[5]^((Up&Q[0]&Q[1]&Q[2]&Q[3]&Q[4])|(~Up&Dw&~Q[0]&~Q[1]&~Q[2]&~Q[3]&~Q[4]))));
assign D[6]=((Q[6]^((Up&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5])|(~Up&Dw&~Q[0]&~Q[1]&~Q[2]&~Q[3]&~Q[4]&~Q[5]))));
assign D[7]=((Q[7]^((Up&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6])|(~Up&Dw&~Q[0]&~Q[1]&~Q[2]&~Q[3]&~Q[4]&~Q[5]&~Q[6]))));

FDRE #(.INIT(1'b0)) ff_instance_1095 (.C(clk), .R(1'b0), .CE(t1), .D(D[0]), .Q(Q[0]));
FDRE #(.INIT(1'b0)) ff_instance_1096 (.C(clk), .R(1'b0), .CE(t1), .D(D[1]), .Q(Q[1]));
FDRE #(.INIT(1'b0)) ff_instance_1097 (.C(clk), .R(1'b0), .CE(t1), .D(D[2]), .Q(Q[2]));
FDRE #(.INIT(1'b0)) ff_instance_1098 (.C(clk), .R(1'b0), .CE(t1), .D(D[3]), .Q(Q[3]));
FDRE #(.INIT(1'b0)) ff_instance_1094 (.C(clk), .R(1'b0), .CE(t1), .D(D[4]), .Q(Q[4]));
FDRE #(.INIT(1'b0)) ff_instance_1093 (.C(clk), .R(1'b0), .CE(t1), .D(D[5]), .Q(Q[5]));
FDRE #(.INIT(1'b0)) ff_instance_1092 (.C(clk), .R(1'b0), .CE(t1), .D(D[6]), .Q(Q[6]));
FDRE #(.INIT(1'b0)) ff_instance_1091 (.C(clk), .R(1'b0), .CE(t1), .D(D[7]), .Q(Q[7]));

//assign TC= &(~Q[7:0]);
endmodule
