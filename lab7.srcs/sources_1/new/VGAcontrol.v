`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2018 01:47:05 PM
// Design Name: 
// Module Name: VGAcontrol
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


module VGAcontrol(
input btnC,btnR, btnL, clk,
input [7:0] sw,
output Hsync,
output Vsync,
output [3:0] vgaRed, vgaBlue,vgaGreen,
output [3:0]an,
output [6:0]seg

    );
wire IDLE,Start,GoLeft,GoRight,BoundHitL,BoundHitR,Foursec,Foursec1,yay,add1,sub1,GG,gameover,crash,BothBtns,qsec;
wire [15:0] HCount,VCount,rangeH,Down,SideR,SideL,Timer,Timer1,quarters,rndGap;
wire [15:0] gateUp0,gateUp1,gateUp2,gateUp3,gateUp4,gateUp5,gateUp6,gateUp7;
wire [15:0] gateUpp0,gateUpp1,gateUpp2,gateUpp3,gateUpp4,gateUpp5,gateUpp6,gateUpp7;
wire [15:0] gap0,gap1,gap2,gap3,gap4,gap5,gap6,gap7;
wire [15:0] prevPos0,prevPos1,prevPos2,prevPos3,prevPos4,prevPos5,prevPos6,prevPos7;
wire [15:0] myPos0,myPos1,myPos2,myPos3,myPos4,myPos5,myPos6,myPos7;
wire [15:0] newUP0,newUP1,newUP2,newUP3,newUP4,newUP5,newUP6,newUP7;
wire [15:0] rndNums0,rndNums1,rndNums2,rndNums3,rndNums4,rndNums5,rndNums6,rndNums7;
wire [15:0] newPos0,newPos1,newPos2,newPos3,newPos4,newPos5,newPos6,newPos7;
wire [7:0] going,stop,Moving,direction,tmp;
wire [3:0] Frames;
wire RHCount,RVCount,FrameFin,Skier,RGame,moveDown,Reset8,MoveL,MoveR,gates,bot;
wire [7:0] Gate,pos,top,reload,Score,NegScore,NegAns,finalAns,rndNums,reachTop;
wire [3:0] t1,t2,negative;
wire [6:0]Seg;
wire chooseNeg,temp,Gate0,GOING,STOP,LorR,Left,Right,MOVING,movingUP;
//wire top;

lab7_clks not_so_slow (.clkin(clkin), .greset(sw[0]), .clk(clk), .digsel(digsel));

//input btnC,Foursec,btnL, btnR, clk, BoundHitL,BoundHitR,gameover,GG,
//output IDLE,Start,GoLeft,GoRight,add1,sub1,yay


StateMachine Game (.btnC(btnC),.btnL(btnL),.btnR(btnR),.clk(clk),.BoundHitL(BoundHitL),.BoundHitR(BoundHitR),
.Foursec(Foursec),.gameover(gameover),.GG(GG),.IDLE(IDLE),.Start(Start),.GoLeft(GoLeft),.GoRight(GoRight),.add1(add1),
.sub1(sub1),.YAY(YAY),.CRASH(CRASH),.BothBtns(BothBtns));


assign an[0]=~t1[0];
assign an[1]=~t1[1];
assign an[3]=1'b1;

counterUD16L ColumnCount (.Up(1'b1),.Dw(1'b0),.LD(RHCount),.clk(clk),.sw(16'd0),.Q(HCount));

assign RHCount=&(~(HCount^16'd799));

assign Hsync=((HCount<16'd655)|(HCount>16'd750));


counterUD16L RowCount (.Up(RHCount),.Dw(1'b0),.LD(RVCount),.clk(clk),.sw(16'd0),.Q(VCount));

assign RVCount=&(~(VCount^16'd524)); //Frame finishes when RVCount

assign Vsync=((VCount<16'd489)|(VCount>16'd490));

Every8Frame FrameCount (.RTimer(Reset8),.qsec(RVCount),.clk(clk),.Q(Frames));
assign Reset8=Frames[3];

TimeCounter EveryQsec (.RTimer(~Start&~CRASH&~GOING&~YAY),.qsec(RVCount),.clk(clk),.Q(quarters));
assign qsec=quarters[5]; //16 frames is roughly .25 seconds

TimeCounter TotalFrames (.RTimer(~Start),.qsec(RVCount),.clk(clk),.Q(Timer));
assign Foursec=Timer[8]; //every 256 (8)frames is roughly 4 seconds

TimeCounter Foursecond (.RTimer(~GOING),.qsec(RVCount),.clk(clk),.Q(Timer1));
assign Foursec1=Timer1[8]; 

TimeCounter DWCount (.RTimer(Start),.qsec(Frames[3]&(GoLeft|GoRight|BothBtns)),.clk(clk),.Q(Down));

assign MoveL=GoLeft&RVCount; 
assign MoveR=(GoRight|BothBtns)&RVCount;

TimeCounter SideLCount (.RTimer(Start),.qsec(MoveL),.clk(clk),.Q(SideL));
TimeCounter SideRCount (.RTimer(Start),.qsec(MoveR),.clk(clk),.Q(SideR));


//LFSR runLFSR (.run(Start),.clk(clk),.D(rndNums));


//m8x16 selRnd (.in0(16'd0),.in1(16'd32),.in2(16'd16),.in3(16'd16),.in4(16'd32),.in5(16'd0),.in6(16'd16),.in7(16'd0),
//.sel(rndNums[2:0]),.o(rndGap));


assign movingUP=RVCount&MOVING;
//input btnC,clk,
//output check

//chooseRND pickPosition0 (.Rndnum(prevPos7),.run(reload[0]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos0),.direction());
TimeCounter GateUP00 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp0));
TimeCounter GateUP0 (.RTimer(reload[0]|Start),.qsec(movingUP&reachTop[0]),.clk(clk),.Q(gateUp0));
TimeCounter TimeToRan0 (.RTimer(reload[0]|Start),.qsec(movingUP),.clk(clk),.Q(newUP0));
Gate_Machine gate0 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd100),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp0),.UP1(gateUpp0),.IDLE(),.Moving(Moving[0]),.going(going[0]),.stop(stop[0]),
.Bar(Gate[0]),.reload(reload[0]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[0]),.Foursec(Foursec1),.prevPos(prevPos7),
.initHPos(16'd300),.top(top[0]),.myPos(prevPos0),.newUP(newUP0));
//.rndGap(rndGap&{16{reload[0]}}),.LorR(rndNums[0]));

//chooseRND pickPosition1 (.Rndnum(prevPos0),.run(reload[1]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos1),.direction());
TimeCounter GateUP01 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp1));
TimeCounter GateUP1 (.RTimer(reload[1]|Start),.qsec(movingUP&reachTop[1]),.clk(clk),.Q(gateUp1));
TimeCounter TimeToRan1 (.RTimer(top[1]|Start),.qsec(movingUP),.clk(clk),.Q(newUP1));
Gate_Machine gate1 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd160),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp1),.UP1(gateUpp1),.IDLE(),.Moving(Moving[1]),.going(going[1]),.stop(stop[1]),
.Bar(Gate[1]),.reload(reload[1]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[1]),.Foursec(Foursec1),.prevPos(prevPos0),
.initHPos(16'd332),.top(top[1]),.myPos(prevPos1),.newUP(newUP1));
//.rndGap(rndGap),.LorR(rndNums[0]));

//chooseRND pickPosition2 (.Rndnum(prevPos1),.run(reload[2]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos2),.direction());
TimeCounter GateUP02 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp2));
TimeCounter GateUP2 (.RTimer(reload[2]|Start),.qsec(movingUP&reachTop[2]),.clk(clk),.Q(gateUp2));
TimeCounter TimeToRan2 (.RTimer(top[2]|Start),.qsec(movingUP),.clk(clk),.Q(newUP2));
Gate_Machine gate2 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd220),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp2),.UP1(gateUpp2),.IDLE(),.Moving(Moving[2]),.going(going[2]),.stop(stop[2]),
.Bar(Gate[2]),.reload(reload[2]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[2]),.Foursec(Foursec1),.prevPos(prevPos1),
.initHPos(16'd364),.top(top[2]),.myPos(prevPos2),.newUP(newUP2));
//.rndGap(rndGap),.LorR(rndNums[0]));

//chooseRND pickPosition3 (.Rndnum(prevPos2),.run(reload[2]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos3),.direction());
TimeCounter GateUP03 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp3));
TimeCounter GateUP3 (.RTimer(reload[3]|Start),.qsec(movingUP&reachTop[3]),.clk(clk),.Q(gateUp3));
TimeCounter TimeToRan3 (.RTimer(top[3]|Start),.qsec(movingUP),.clk(clk),.Q(newUP3));
Gate_Machine gate3 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd280),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp3),.UP1(gateUpp3),.IDLE(),.Moving(Moving[3]),.going(going[3]),.stop(stop[3]),
.Bar(Gate[3]),.reload(reload[3]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[3]),.Foursec(Foursec1),.prevPos(prevPos2),
.initHPos(16'd396),.top(top[3]),.myPos(prevPos3),.newUP(newUP3));
//.rndGap(rndGap),.LorR(rndNums[0]));

//chooseRND pickPosition4 (.Rndnum(prevPos3),.run(reload[4]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos4),.direction());
TimeCounter GateUP04 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp4));
TimeCounter GateUP4 (.RTimer(reload[4]|Start),.qsec(movingUP&reachTop[4]),.clk(clk),.Q(gateUp4));
TimeCounter TimeToRan4 (.RTimer(top[4]|Start),.qsec(movingUP),.clk(clk),.Q(newUP4));
Gate_Machine gate4 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd340),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp4),.UP1(gateUpp4),.IDLE(),.Moving(Moving[4]),.going(going[4]),.stop(stop[4]),
.Bar(Gate[4]),.reload(reload[4]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[4]),.Foursec(Foursec1),.prevPos(prevPos3),
.initHPos(16'd332),.top(top[4]),.myPos(prevPos4),.newUP(newUP4));
//.rndGap(rndGap),.LorR(rndNums[0]));

//chooseRND pickPosition5 (.Rndnum(prevPos4),.run(reload[5]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos5),.direction());
TimeCounter GateUP05 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp5));
TimeCounter GateUP5 (.RTimer(reload[5]|Start),.qsec(movingUP&reachTop[5]),.clk(clk),.Q(gateUp5));
TimeCounter TimeToRan5 (.RTimer(top[5]|Start),.qsec(movingUP),.clk(clk),.Q(newUP5));
Gate_Machine gate5 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd400),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp5),.UP1(gateUpp5),.IDLE(),.Moving(Moving[5]),.going(going[5]),.stop(stop[5]),
.Bar(Gate[5]),.reload(reload[5]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[5]),.Foursec(Foursec1),.prevPos(prevPos4),
.initHPos(16'd300),.top(top[5]),.myPos(prevPos5),.newUP(newUP5));
//.rndGap(rndGap),.LorR(rndNums[0]));

//chooseRND pickPosition6 (.Rndnum(prevPos5),.run(reload[6]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos6),.direction());
TimeCounter GateUP06 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp6));
TimeCounter GateUP6 (.RTimer(reload[6]|Start),.qsec(movingUP&reachTop[6]),.clk(clk),.Q(gateUp6));
TimeCounter TimeToRan6 (.RTimer(top[6]|Start),.qsec(movingUP),.clk(clk),.Q(newUP6));
Gate_Machine gate6 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd460),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp6),.UP1(gateUpp6),.IDLE(),.Moving(Moving[6]),.going(going[6]),.stop(stop[6]),
.Bar(Gate[6]),.reload(reload[6]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[6]),.Foursec(Foursec1),.prevPos(prevPos5),
.initHPos(16'd300),.top(top[6]),.myPos(prevPos6),.newUP(newUP6));
//.rndGap(rndGap),.LorR(rndNums[0]));

//chooseRND pickPosition7 (.Rndnum(prevPos6),.run(reload[7]),.reset(Start),.clk(clk),.LorR(LorR),.SelNum(newPos7),.direction());
TimeCounter GateUP07 (.RTimer(Start),.qsec(movingUP),.clk(clk),.Q(gateUpp7));
TimeCounter GateUP7 (.RTimer(reload[7]|Start),.qsec(movingUP&reachTop[7]),.clk(clk),.Q(gateUp7));
TimeCounter TimeToRan7 (.RTimer(top[7]|Start),.qsec(movingUP),.clk(clk),.Q(newUP7));
Gate_Machine gate7 (.game(GoLeft|GoRight|BothBtns),.initPos(16'd520),.start(Start|IDLE),.VCount(VCount),.HCount(HCount),
.clk(clk),.bot(bot),.switches(sw[6:4]),.UP(gateUp7),.UP1(gateUpp7),.IDLE(),.Moving(Moving[7]),.going(going[7]),.stop(stop[7]),
.Bar(Gate[7]),.reload(reload[7]),.CRASH(CRASH),.btnC(btnC),.reachTop(reachTop[7]),.Foursec(Foursec1),.prevPos(prevPos6),
.initHPos(16'd332),.top(top[7]),.myPos(prevPos7),.newUP(newUP7));
//.rndGap(rndGap),.LorR(rndNums[0]));

assign MOVING=|(Moving[7:0]);
assign GOING=|(going[7:0]);
assign STOP=|(stop[7:0]);
assign gates=Gate[0]|Gate[1]|Gate[2]|Gate[3]|Gate[4]|Gate[5]|Gate[6]|Gate[7];

assign vgaRed= ({4{(1'b0)|gates}});


assign gameover=vgaRed&vgaGreen&({4{~sw[7]}}); //game over when hit gate
assign bot=Skier&(VCount>=16'd400); //assign GG when skier reaches VCount 400
assign GG=Skier&(VCount>=16'd400)&STOP;
//blue Border
assign vgaBlue= {4{(1'b0)|
(((HCount<=16'd639)&(VCount<=16'd7))|//topborder
((HCount<=16'd7)&(VCount<16'd479))|((HCount>=16'd632 & HCount<=16'd639)&(VCount<16'd479))| //side borders
((HCount<=16'd639)&(VCount>=16'd472&VCount<=16'd479)))&((qsec&YAY)|(~YAY))}}; //bottomBorder;

assign BoundHitL=vgaBlue&vgaGreen&{4{GoLeft}}; //hitting bounds will reverse skiier
assign BoundHitR=vgaBlue&vgaGreen&{4{(GoRight|BothBtns)}};

//skier model
assign vgaGreen= ({4{(1'b0)|(Skier&(~Start&~CRASH&~GOING))|((Start|CRASH|GOING)&qsec&Skier)}});

assign Skier=((HCount+(SideL))>=(16'd312+(SideR))&
(HCount+(SideL))<=(16'd328+(SideR)))&
(VCount>=(16'd24+Down)&VCount<=(16'd40+Down)); //moving down

//Scoring
TurkeyCounter ScoreCount (.Up(add1),.Dw(sub1),.clk(clk),.Q(Score));
assign chooseNeg=Score[7];
assign NegScore={8{chooseNeg}}&~Score; //get complement of Score if Negative

AddOne Addone (.Turkeys(NegScore),.Q(NegAns)); //now add 1 if negative

RingCounter RingCount (.start(digsel),.clk(clk),.q(t1));

m2_1x8 selScore (.in(Score),.in1(NegAns),.sel(chooseNeg),.o(finalAns)); //select neg or pos ans 

m2_1x1 selAN2 (.in(1'b1),.in1(1'b0),.sel(chooseNeg),.o(temp)); //selector for an2 to turn on if neg
assign an[2]=(temp|~t1[2]);

Selector select (.sel(t1),.N({4'b0000,4'b0000,finalAns}),.H(t2)); //when inverted it will show a negative sign
                         
hex7seg display (.n3(t2[3]),.n2(t2[2]),.n1(t2[1]),.n0(t2[0]),.CA(Seg[0]),.CB(Seg[1]),.CC(Seg[2]),
.CD(Seg[3]),.CE(Seg[4]),.CF(Seg[5]),.CG(Seg[6]));

m2_1x8 selSeg6 (.in(Seg[6:0]),.in1(~Seg),.sel(chooseNeg&t1[2]),.o(seg[6:0]));

endmodule
