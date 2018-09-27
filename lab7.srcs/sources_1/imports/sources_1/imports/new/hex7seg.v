`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2018 05:55:28 PM
// Design Name: 
// Module Name: hex7seg
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


module hex7seg(
input n0,n1,n2,n3,
output CA,CB,CC,CD,CE,CF,CG
    );
m8_1e CAm8 (.in({1'b0,n0,n0,1'b0,1'b0,~n0,1'b0,n0}), .sel({n3,n2,n1}),.e(1'b1),.o(CA));
m8_1e CBm8 (.in({1'b1,~n0,n0,1'b0,~n0,n0,1'b0,1'b0}), .sel({n3,n2,n1}),.e(1'b1),.o(CB));
m8_1e CCm8 (.in({1'b1,~n0,1'b0,1'b0,1'b0,1'b0,~n0,1'b0}), .sel({n3,n2,n1}),.e(1'b1),.o(CC));
m8_1e CDm8 (.in({n0,1'b0,~n0,n0,n0,~n0,1'b0,n0}), .sel({n3,n2,n1}),.e(1'b1),.o(CD));
m8_1e CEm8 (.in({1'b0,1'b0,1'b0,n0,n0,1'b1,n0,n0}), .sel({n3,n2,n1}),.e(1'b1),.o(CE));
m8_1e CFm8 (.in({1'b0,n0,1'b0,1'b0,n0,1'b0,1'b1,n0}), .sel({n3,n2,n1}),.e(1'b1),.o(CF));
m8_1e CGm8 (.in({1'b0,~n0,1'b0,1'b0,n0,1'b0,1'b0,1'b1}), .sel({n3,n2,n1}),.e(1'b1),.o(CG));
endmodule
