`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2018 06:40:25 PM
// Design Name: 
// Module Name: RandomGates
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


module RandomGates(

    );
    
m8x16 selRnd (.in0(16'd0),.in1(16'd32),.in2(16'd16),.in3(16'd16),.in4(16'd32),.in5(16'd0),.in6(16'd16),.in7(16'd0),
.sel(rndNums[2:0]),.o(rndGap));
endmodule
