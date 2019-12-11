`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Connie Zhou
//Anuska Rungta
// 
//////////////////////////////////////////////////////////////////////////////////


module IF(PCSrc, mux1, clk, fetched, NPC );
    input clk;
    input PCSrc, mux1;
    integer mux2;
    integer PC;
    integer instructions[14:0];
    output reg[31:0] fetched;
    output reg[31:0] NPC;
    
    
    
    initial begin
        
        mux2<=PC+4;
        instructions[0] = 32'b00000001000010000100100000100000;
        instructions[1] = 32'b00000001000010010101000000100010;
        instructions[2] = 32'b00000001010010000101000000100100;
        instructions[3] = 32'b00000001001010100101100000100101;
        instructions[4] = 32'b00000001011010000110000000101010;
        instructions[5] = 32'b10001110000010110000000000000100;
        instructions[6] = 32'b10001110000010100000000000001000;
        instructions[7] = 32'b10001110000100010000000000000000;
        instructions[8] = 32'b10001111110101100000000000000000;
        instructions[9] = 32'b10001110000110010000000000001100;
        instructions[10] = 32'b10101100101111010000000000000100;
        instructions[11] = 32'b10101111000001000000000000000000;
        instructions[12] = 32'b10101100011111100000000000000100;
        instructions[13] = 32'b10101110000100000000000000001000;
        instructions[14] = 32'b10101100100000100000000000001100;
        
        if(PCSrc==0)begin
            fetched<=instructions[mux1];
            PC<=mux1;
            NPC<=PC;
        end
        if(PCSrc==1)begin
            fetched<=instructions[mux2];
            PC<=mux2;
            NPC<=PC;
        end
        
    end
    
   
   
        
    
         

   
        

endmodule
