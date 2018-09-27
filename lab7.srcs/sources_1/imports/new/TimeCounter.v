`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2018 03:36:42 PM
// Design Name: 
// Module Name: TimeCounter
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


module TimeCounter(
input RTimer, qsec, clk,
output [15:0] Q
    );
wire [15:0]D;

assign D[0]=(Q[0]^qsec);
assign D[1]=(Q[1]^(qsec&Q[0]));
assign D[2]=(Q[2]^(qsec&Q[0]&Q[1]));
assign D[3]=(Q[3]^(qsec&Q[0]&Q[1]&Q[2]));
assign D[4]=(Q[4]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]));
assign D[5]=(Q[5]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]));
assign D[6]=(Q[6]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]));
assign D[7]=(Q[7]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]));
assign D[8]=(Q[8]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]));
assign D[9]=(Q[9]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]&Q[8]));
assign D[10]=(Q[10]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]&Q[8]&Q[9]));
assign D[11]=(Q[11]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]&Q[8]&Q[9]&Q[10]));
assign D[12]=(Q[12]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]&Q[8]&Q[9]&Q[10]&Q[11]));
assign D[13]=(Q[13]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]&Q[8]&Q[9]&Q[10]&Q[11]&Q[12]));
assign D[14]=(Q[14]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]&Q[8]&Q[9]&Q[10]&Q[11]&Q[12]&Q[13]));
assign D[15]=(Q[15]^(qsec&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]&Q[8]&Q[9]&Q[10]&Q[11]&Q[12]&Q[13]&Q[14]));

FDRE #(.INIT(1'b0)) ff_instance_1095 (.C(clk), .R(RTimer), .CE(qsec), .D(D[0]), .Q(Q[0]));
FDRE #(.INIT(1'b0)) ff_instance_1096 (.C(clk), .R(RTimer), .CE(qsec), .D(D[1]), .Q(Q[1]));
FDRE #(.INIT(1'b0)) ff_instance_1097 (.C(clk), .R(RTimer), .CE(qsec), .D(D[2]), .Q(Q[2]));
FDRE #(.INIT(1'b0)) ff_instance_1098 (.C(clk), .R(RTimer), .CE(qsec), .D(D[3]), .Q(Q[3]));
FDRE #(.INIT(1'b0)) ff_instance_1099 (.C(clk), .R(RTimer), .CE(qsec), .D(D[4]), .Q(Q[4]));
FDRE #(.INIT(1'b0)) ff_instance_1100 (.C(clk), .R(RTimer), .CE(qsec), .D(D[5]), .Q(Q[5]));
FDRE #(.INIT(1'b0)) ff_instance_1101 (.C(clk), .R(RTimer), .CE(qsec), .D(D[6]), .Q(Q[6]));
FDRE #(.INIT(1'b0)) ff_instance_1102 (.C(clk), .R(RTimer), .CE(qsec), .D(D[7]), .Q(Q[7]));
FDRE #(.INIT(1'b0)) ff_instance_1111 (.C(clk), .R(RTimer), .CE(qsec), .D(D[8]), .Q(Q[8]));
FDRE #(.INIT(1'b0)) ff_instance_1112 (.C(clk), .R(RTimer), .CE(qsec), .D(D[9]), .Q(Q[9]));
FDRE #(.INIT(1'b0)) ff_instance_1161 (.C(clk), .R(RTimer), .CE(qsec), .D(D[10]), .Q(Q[10]));
FDRE #(.INIT(1'b0)) ff_instance_1142 (.C(clk), .R(RTimer), .CE(qsec), .D(D[11]), .Q(Q[11]));
FDRE #(.INIT(1'b0)) ff_instance_1119 (.C(clk), .R(RTimer), .CE(qsec), .D(D[12]), .Q(Q[12]));
FDRE #(.INIT(1'b0)) ff_instance_1181 (.C(clk), .R(RTimer), .CE(qsec), .D(D[13]), .Q(Q[13]));
FDRE #(.INIT(1'b0)) ff_instance_1189 (.C(clk), .R(RTimer), .CE(qsec), .D(D[14]), .Q(Q[14]));
FDRE #(.INIT(1'b0)) ff_instance_1187 (.C(clk), .R(RTimer), .CE(qsec), .D(D[15]), .Q(Q[15]));

endmodule
