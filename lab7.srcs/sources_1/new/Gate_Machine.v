`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2018 04:18:59 PM
// Design Name: 
// Module Name: Gate_Machine
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


module Gate_Machine(
input game,start,clk,bot,Foursec,CRASH,btnC,prevTop,
input [2:0]switches,
input [15:0] initPos,initHPos,UP,UP1,VCount,HCount,prevPos,newUP,
output IDLE,Moving,going,stop,Bar,reload,reachTop,top,
output [15:0]myPos
    );
wire [5:0] D;
wire [15:0] position,temp,HPosition,LEFT,RIGHT,CapPos,useLEFT,gap,newPos,tempGap,rndGap,rndAns,finalAns,reachTop1;
wire edgeDetectR,edgeDetectL,direction,randomize,reachrndTop,LorR;
assign D[0]= (start&IDLE)|(start&stop);
assign D[1]=(game&IDLE)|(game&Moving);
assign D[2]=(bot&Moving)|(~Foursec&going);
assign D[3]=(Foursec&going)|(~start&stop)|(CRASH&Moving);
//((VCount+gateUp)>=16'd100&(VCount+gateUp)<=16'd108)

//assign Gate[0]=((HCount>=16'd7)&(HCount<=16'd632)&((VCount+gateUp)>=16'd100&(VCount+gateUp)<=16'd108))
assign position=(initPos&{16{~reachTop}})|(16'd480&{16{reachTop}}); //mux for initial position or go from bottom
assign temp=(UP1&{16{~reachTop}})|(UP&{16{reachTop}});
assign temp1=(UP1&{16{~reachTop}})|(UP&{16{reachTop}});

chooseRND pickPosition (.Rndnum(prevPos),.run(tempReload),.reset(start),.clk(clk),.LorR(LorR),.SelNum(newPos),.direction());
assign HPosition=(initHPos&{16{~reachTop1}})|((newPos)&{16{reachTop1}});

//assign edgeDetectR=(HPosition+16'd40+(16'd8*switches)+(gap&{16{direction}})>=16'd560)&Moving;
//assign edgeDetectL=((16'd8*switches)+(gap&{16{~direction}})>=16'd220)&Moving;

assign edgeDetectR=1'b0;
assign edgeDetectL=1'b0;

//assign edgeDetectL=((16'd8*switches)+(rndPos&{16{~Right}}&{16{reachTop}})+(prevLEFT&{16{reachTop}})>=16'd220)&Moving;

//assign Bar=(((HCount>=16'd7)&(HCount+16'd8*switches<=16'd300))|((HCount>=16'd340+16'd8*switches)&(HCount<=16'd632)))&
//(((VCount>=initPos)&(VCount<=(initPos+16'd8))&IDLE)|
//(((VCount+temp)>=position)&((VCount+temp)<=(position+16'd8))&(Moving|going|stop)));
//assign tempGap={10'd0,rbit[1]^rbit[0],rbit[0],4'd0};
assign LEFT=(finalAns)&{16{(~direction&~edgeDetectL&Moving)}};
//assign useLEFT= ((LEFT+(prevLEFT&{16{reachTop}}&{16{~edgeDetectL}})))&Moving;
//assign useLEFT= ((LEFT&{16{~edgeDetectL}}));

assign RIGHT=(finalAns)&{16{(direction&~edgeDetectR&Moving)}};

LFSR runLFSR (.run(1'b1),.clk(clk),.D(rndAns));

m8x16 selRnd (.in0(16'd0),.in1(16'd0),.in2(16'd16),.in3(16'd16),.in4(16'd32),.in5(16'd32),.in6(16'd0),.in7(16'd0),
.sel(rndAns[3:1]),.o(rndGap));

assign LorR=rndAns[0];

FDRE #(.INIT(1'b0)) LR (.C(clk), .R(start), .CE(tempReload), .D(LorR), .Q(direction));
FDRE #(.INIT(1'b0)) bit[15:0] (.C({16{clk}}),.R({16{start}}),.CE({16{tempReload}}),.D(rndGap),.Q(finalAns));



//chooseRND Pickout1 (.Rndnum(rndGap),.run(reload),.reset(start),.clk(clk),.LorR(LorR),.SelNum(gap),.direction(direction));

assign Bar=(((((HCount>=16'd7)&(HCount+16'd8*switches<=initHPos))|((HCount>=initHPos+16'd40+16'd8*switches)&(HCount<=16'd632)))&IDLE)|
(((HCount>=16'd7)&(HCount+LEFT+(16'd8*switches)<=(HPosition+RIGHT)))|
((HCount+LEFT>=HPosition+16'd40+(16'd8*switches)+RIGHT)&(HCount<=16'd632)))&(Moving|going|stop))&
(((VCount>=initPos)&(VCount<=(initPos+16'd8))&IDLE)|
(((VCount+temp)>=position)&((VCount+temp)<=(position+16'd8))&(Moving|going|stop)));

assign top=(position>=16'd480)&((position)<=16'd500)&(Moving&~going&~stop);
assign reachTop=((initPos)<=16'd0+UP1)&(Moving|going|stop); //a signal just for reaching the top for only the initial position
assign tempReload=(((16'd480)<=(16'd0+UP))&Moving&~going&~stop); //a trigger that will reset the counter
FDRE #(.INIT(1'b0)) syncreloading (.C(clk), .R(start), .CE(1'b1), .D(tempReload), .Q(reload));
assign randomize=(((16'd480)<=(16'd1+UP))&Moving&~going&~stop);
//assign CapPos=(HPosition+RIGHT)&Moving;
assign reachTop1=((initPos)<=16'd1+UP1)&(Moving|going|stop); //a signal just for reaching the top for only the initial position

assign CapPos=(HPosition+(2*RIGHT)-(2*LEFT));

//input [15:0] Rndnum,
//input run,LorR,clk,
//output [15:0]SelNum,
//output direction
chooseRND choosePos (.Rndnum(CapPos),.run(tempReload),.LorR(1'b0),.clk(clk),.SelNum(myPos),.direction(bleh));
//chooseRND chooseLEFT (.Rndnum(LEFT),.run(reload),.LorR(1'b0),.clk(clk),.SelNum(myLEFT),.direction(bleh));

FDRE #(.INIT(1'b1)) Q0 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[0]), .Q(IDLE));
FDRE #(.INIT(1'b0)) Q1 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[1]), .Q(Moving));
FDRE #(.INIT(1'b0)) Q2 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[2]), .Q(going));
FDRE #(.INIT(1'b0)) Q3 (.C(clk), .R(1'b0), .CE(1'b1), .D(D[3]), .Q(stop));

endmodule
