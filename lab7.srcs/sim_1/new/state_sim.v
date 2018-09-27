`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2018 01:35:48 PM
// Design Name: 
// Module Name: state_sim
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


module state_sim();

reg btnC,Foursec,btnL, btnR, clk, BoundHitL,BoundHitR,gameover,GG;
wire IDLE,Start,GoLeft,GoRight,add1,sub1,YAY,CRASH,BothBtns;

StateMachine sim (.btnL(btnL),.btnR(btnR),.clk(clk),.gameover(gameover),.GG(GG),.IDLE(IDLE),.Start(Start),
.BoundHitL(BoundHitL),.BoundHitR(BoundHitR),.GoLeft(GoLeft),.add1(add1),.sub1(sub1),.YAY(YAY),.GoRight(GoRight),
.Foursec(Foursec),.btnC(btnC),.CRASH(CRASH),.BothBtns(BothBtns)
);
 
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
//                   reg btnC,Foursec,btnL, btnR, clk, BoundHitL,BoundHitR,gameover,GG;
btnC=1'b0;
btnL=1'b0;
btnR=1'b0;
BoundHitL=1'b0;
BoundHitR=1'b0;
gameover=1'b0;
Foursec=1'b0;
GG=1'b0;
#1000;
#1000;

//move from idle to start
btnC=1'b1;
#1000;
btnC=1'b0;
#1000;

//move from start to go right
Foursec=1'b0;
#1000;
Foursec=1'b1;
#1000;
Foursec=1'b0;
#1000;

//press btnR should do nothing
btnR=1'b1;
#1000;
btnL=1'b1;
#1000;

//press btnL should move GoLeft
btnR=1'b0;
#1000;
btnL=1'b0;
#1000;

//hit gate and move to CRASH
GG=1'b1;
#1000;
GG=1'b0;
#1000;

//hit btnC will move to start
btnC=1'b1;
#1000;
btnC=1'b0;
#1000;


end

endmodule
