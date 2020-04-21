`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/23 09:39:20
// Design Name: 
// Module Name: bch_encoder_tb
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


module bch_encoder_tb;
    reg start;
    reg reset;
    reg type;
    reg modcod;
    reg CLK;
    reg datain;    
    wire dataenable;
    wire dataout;
    reg  mem [0:16007]; 
    reg [16:0] inin ;
    wire [191:0]bits;
    bch_encoder_try1 uut (
    .CLK(CLK),
    .datain(datain),   
    .type(type),
    .modcod(modcod),
    .reset(reset),
    .start(start),    
    .dataenable(dataenable),
    .bits(bits),
    .dataout(dataout)
        );
 parameter PERIOD=10;
 
 
 
 always 
     begin
     
       inin=inin+1;
       CLK=1'b0;
         #(PERIOD/2);
         datain=mem[inin];         
         CLK=1'b1;
         #(PERIOD/2);

/*
        # (PERIOD/2)  CLK = ~CLK; 
        */
/*         reset=1;
         #(16200*PERIOD);
         */
     end
     
     
     
 initial 
     begin
        CLK = 0;
        start=1;        
        inin=0;
        type=0;
        modcod=0;      
           
        
        
        $readmemh("C:/Users/Administrator/Desktop/myDatain.txt",mem,0,16007);
        
        #(16200*PERIOD) $finish;
     
     
end     
    




endmodule
