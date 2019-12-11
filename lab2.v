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
//Lab 2

module lab1(clk);
    input clk;
    integer accum, instruc_code, mem_loc;
    integer out, i, j;
    integer in [9:0];
    integer mem [99:0];
    integer instruc [9:0];
    integer input_counter, pc;
    initial begin
        input_counter=0;
        pc=0;
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
        instruc[2]=607;
        instruc[3]=299;
        instruc[4]=708;
        instruc[5]=901;
        instruc[6]=809;
        instruc[7]=603;
        instruc[8]=0;
        instruc[9]=0;
        for(i=0;i<100;i=i+1)begin
            mem[i]=0;
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
        /*for(i=0;i<10;i=i+1)begin
            for(j=0;j<10;j=j+1)begin
                $write("%d",mem[i]);
            end
            $display();
        end
        $display();*/
     for(i=0;i<100;i=i+1)begin
        if(i%10==0)begin
           $display();
           $write("%d",mem[i]);
        end
        else begin
            $write("%d",mem[i]);
        end
       
     end
     end
        
     always@(posedge clk)begin
        instruc_code=instruc[pc]/100;
        mem_loc=instruc[pc]%100;
            
        if(instruc_code==9)begin
            if(mem_loc==1)begin
                if(input_counter<=9)begin
                    accum=in[input_counter];
                    input_counter=input_counter+1;
                end
                else begin
                    accum=in[input_counter];
                end
            end
            if(mem_loc==2)begin
                out=accum;
                $display("output=%d",out);
            end
                
            end
            if(instruc_code==1)begin
                accum=accum+mem[mem_loc];
            end
            if(instruc_code==2)begin
                accum=accum-mem[mem_loc];
            end
            if(instruc_code==3)begin
                mem[mem_loc]=accum;
            end
    
            if(instruc_code==5)begin
                accum=mem[mem_loc];
            end
            
            if(instruc_code==0)begin
                //halt does nothing
            end
            if(instruc_code==6)begin
                pc=mem_loc-1;
            end
            if(instruc_code==7)begin
                if(accum==0)begin
                    pc=mem_loc-1;
                end
            end
            if(instruc_code==8)begin
                if(accum>=0)begin
                    pc=mem_loc-1;
                end
            end
            
         
     pc=pc+1;
     for(i=0;i<100;i=i+1)begin
        if(i%10==0)begin
           $display();
           $write("%d",mem[i]);
        end
        else begin
            $write("%d",mem[i]);
        end
       
     end
     $display("Accumulator=%d",accum);
     $display("PC=%d",pc);
     end
    
    
endmodule
