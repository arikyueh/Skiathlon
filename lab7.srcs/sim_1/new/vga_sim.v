`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2018 03:57:14 PM
// Design Name: 
// Module Name: vga_sim
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


module vga_sim(
    );
//    input btnC,btnR, btnL, clk,
//    input [6:4] sw,
//    output Hsync,
//    output Vsync,
//    output [3:0] vgaRed, vgaBlue,vgaGreen,
//    output [2:0]an,
//    output [6:0]seg
    reg btnC,btnR, btnL, clk;
    reg [6:4]sw;
    wire Hsync;
    wire Vsync;
    wire [3:0] vgaRed, vgaBlue,vgaGreen;
    wire [2:0]an;
    wire [6:0]seg;
    
VGAcontrol vgasim (
                .clk(clk),.btnC(btnC),.btnR(btnR),.btnL(btnL),.Hsync(Hsync),.Vsync(Vsync),.vgaRed(vgaRed),.vgaBlue(vgaBlue),
                .vgaGreen(vgaGreen),.sw(sw),.an(an),.seg(seg)
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
                    btnL=1'b0;
                    btnR=1'b0;
                    btnC=1'b0;
                    sw=3'b000;
                    #1000;
                    #1000;
                    #1000;
                    btnC=1'b1;
                    #1000;
                    btnC=1'b0;
                    #100000000;
                    #100000000;
                    end
endmodule
