`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/08 11:20:11
// Design Name: 
// Module Name: bch_encoder_try1
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


module bch_encoder_try1(
    input type,
    input modcod,
    input CLK,
    input datain,
    input reset,
    input start,
    output reg [191:0]bits,
    output dataenable,
    output reg dataout
    );
    reg [195:0]controlg=196'ha7130741c22e288e2867966c6e1a844481a3c2fbb3012af38;
    
    reg [191:0]Bbs=0;
    //reg inputdata=0;
    reg [14:0]count=0;
    reg [7:0]i=0;
    reg b191=0;
    reg [7:0] j=191;
    reg midd;
    
    always@(posedge CLK  or negedge reset)    
       begin
       if (!reset)
       begin
       Bbs=0;
       end
       count=count+1;
       bits=Bbs;
       if (count<=16008)
          begin
             //inputdata<={$random} % 2;
             dataout=datain;
             b191=Bbs[191];                        //liuyiweicunfangyiweidegaowei
             Bbs=Bbs<<1;        //
             Bbs[0]=b191^datain;                   
              for( i=1 ; i<=191 ; i=i+1 )				//
                     begin
                     midd=controlg[i+3]&Bbs[0];
                     Bbs[i]=Bbs[i]^midd;   //haoxiangmeiyunxing
                        
                     end    
//¼ÓÑ­»·
          end
       else if (count<=16200&&count>=16009)
           begin 
              dataout=Bbs[j];
              j=j-1;  
           end
        else
         begin
         count<=0;
         Bbs=0;
         i=0;
         j=191;
         end  
       end
   
    
endmodule
