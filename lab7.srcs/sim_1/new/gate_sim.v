`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2018 09:06:04 PM
// Design Name: 
// Module Name: gate_sim
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


module gate_sim(
    );
reg game,initPos,start,VCount,HCount,clk;
reg [2:0]switches;
reg [15:0] UP,UP1;
wire IDLE,Moving,going,stop,Bar,reload;

Gate_Machine gatesim (.game(game),.initPos(initPos),.start(start),.VCount(VCount),.HCount(HCount),.clk(clk),
.switches(switches),.UP(UP),.UP1(UP1),.IDLE(IDLE),.Moving(Moving),.going(going),.Bar(Bar),.reload(reload));

parameter PERIOD = 10;
                   parameter real DUTY_CYCLE = 0.5;
                   parameter OFFSET = 2;
               
                   initial    // Clock process for clkin
                   begin
                       #OFFSET
                         clk = 1'b1;
                       forever
                       begin
                           #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
                       end
                      end
                       
                   initial
                   begin
//reg game,initPos,start,VCount,HCount,clk;
//                   reg [2:0]switches;
//                   reg [15:0] UP,UP1;

game=1'b0;
initPos=1'b0;
start=1'b1;
VCount=1'b0;
HCount=1'b0;
switches=3'b000;
UP=16'd0;
UP1=16'd0;

#1000;
#1000;

start=1'b0;
game=1'b1;
#1000;
#1000;
end
endmodule
