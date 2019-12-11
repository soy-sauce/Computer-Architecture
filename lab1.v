`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2019 10:25:47 PM
// Design Name: 
// Module Name: lab1
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
//Connie Zhou
//Anuska Rungta
//Lab 1

module lab1(clk);
    input clk;
    integer out, i, j;
    integer in [9:0];
    integer mem [9:0][9:0];
    integer instruc [9:0];
    initial begin
        in[0]=9;
        in[1]=5;
        in[2]=7;
        in[3]=12;
        in[4]=13;
        in[5]=72;
        in[6]=24;
        in[7]=39;
        in[8]=51;
        in[9]=20;
        instruc[0]=901;
        instruc[1]=399;
        instruc[2]=901;
        instruc[3]=199;
        instruc[4]=902;
        instruc[5]=0;
        instruc[6]=0;
        instruc[7]=0;
        instruc[8]=0;
        instruc[9]=0;
        for(i=0;i<10;i=i+1)begin
            for(j=0;j<10;j=j+1)begin
                mem[i][j]=0;
            end
        end
        $display("---Beginning of Program---");
        $write("Initialized Input List: ");
        for(i=0;i<10;i=i+1)begin
            $write("%d",in[i]);
        end
        $display();
        $write("Initialized Intructions: ");
        for(i=0;i<10;i=i+1)begin
            $write("%d",instruc[i]);
        end
        $display();
        $display("Initialized Memory: ");
        for(i=0;i<10;i=i+1)begin
            for(j=0;j<10;j=j+1)begin
                $write("%d",mem[i][j]);
            end
            $display();
        end
        $display();
     end
        
        
        
endmodule
