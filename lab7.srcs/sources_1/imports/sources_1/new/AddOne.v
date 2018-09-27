`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 02:46:13 PM
// Design Name: 
// Module Name: AddOne
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


module AddOne(
//input Add,
input [7:0] Turkeys,
output [7:0] Q

   );
wire [7:0]t;
//    input a0,
//    input b0,
//    input cin,
//    output c1,
//    output s0
FullAdder q1 (.a0(Turkeys[0]),.b0(1'b1),.cin(1'b0),.c1(t[0]),.s0(Q[0]));
FullAdder q2 (.a0(Turkeys[1]),.b0(1'b0),.cin(t[0]),.c1(t[1]),.s0(Q[1]));
FullAdder q3 (.a0(Turkeys[2]),.b0(1'b0),.cin(t[1]),.c1(t[2]),.s0(Q[2]));
FullAdder q4 (.a0(Turkeys[3]),.b0(1'b0),.cin(t[2]),.c1(t[3]),.s0(Q[3]));
FullAdder q5 (.a0(Turkeys[4]),.b0(1'b0),.cin(t[3]),.c1(t[4]),.s0(Q[4]));
FullAdder q6 (.a0(Turkeys[5]),.b0(1'b0),.cin(t[4]),.c1(t[5]),.s0(Q[5]));
FullAdder q7 (.a0(Turkeys[6]),.b0(1'b0),.cin(t[5]),.c1(t[6]),.s0(Q[6]));
FullAdder q8 (.a0(Turkeys[7]),.b0(1'b0),.cin(t[6]),.c1(t[7]),.s0(Q[7]));
//wire [7:0]D;
//wire Add1=enable&Add;
//wire t1=enable;

//assign D[0]=(Q[0]^Add1)|Turkeys[0];
//assign D[1]=(Q[1]^(Add1&Q[0]))|Turkeys[1];
//assign D[2]=(Q[2]^(Add1&Q[0]&Q[1]))|Turkeys[2];
//assign D[3]=(Q[3]^(Add1&Q[0]&Q[1]&Q[2]))|Turkeys[3];
//assign D[4]=(Q[4]^(Add1&Q[0]&Q[1]&Q[2]&Q[3]))|Turkeys[4];
//assign D[5]=(Q[5]^(Add1&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]))|Turkeys[5];
//assign D[6]=(Q[6]^(Add1&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]))|Turkeys[6];
//assign D[7]=(Q[7]^(Add1&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]))|Turkeys[7];
////assign D[8]=(Q[8]^(Up&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]&Q[6]&Q[7]));

//FDRE #(.INIT(1'b0)) ff_instance_1095 (.C(clk), .R(1'b0), .CE(t1), .D(D[0]), .Q(Q[0]));
//FDRE #(.INIT(1'b0)) ff_instance_1096 (.C(clk), .R(1'b0), .CE(t1), .D(D[1]), .Q(Q[1]));
//FDRE #(.INIT(1'b0)) ff_instance_1097 (.C(clk), .R(1'b0), .CE(t1), .D(D[2]), .Q(Q[2]));
//FDRE #(.INIT(1'b0)) ff_instance_1098 (.C(clk), .R(1'b0), .CE(t1), .D(D[3]), .Q(Q[3]));
//FDRE #(.INIT(1'b0)) ff_instance_1099 (.C(clk), .R(1'b0), .CE(t1), .D(D[4]), .Q(Q[4]));
//FDRE #(.INIT(1'b0)) ff_instance_1100 (.C(clk), .R(1'b0), .CE(t1), .D(D[5]), .Q(Q[5]));
//FDRE #(.INIT(1'b0)) ff_instance_1101 (.C(clk), .R(1'b0), .CE(t1), .D(D[6]), .Q(Q[6]));
//FDRE #(.INIT(1'b0)) ff_instance_1102 (.C(clk), .R(1'b0), .CE(t1), .D(D[7]), .Q(Q[7]));
//FDRE #(.INIT(1'b0)) ff_instance_1102 (.C(clk), .R(RTimer), .CE(qsec), .D(D[8]), .Q(Q[8

endmodule
