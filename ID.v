`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Connie Zhou and Anuska Rungta
// 
//////////////////////////////////////////////////////////////////////////////////


module ID(clk, mux, instruc, data1, data2, control, signextend);
    input clk, instruc, mux;
    reg[31:0][31:0] registers;

    output reg[31:0] data1, data2;
    output reg[31:0] control, signextend;
    reg[31:0] reg1, reg2;
    reg[31:0] opcode;
    wire writeReg, writeData; 
    
    always@(posedge clk) begin
        assign reg1 = instruc[25:21];
        assign reg2 = instruc[20:16];
       
        assign control = instruc[31:26];
        assign signextend=instruc[15:0];
         
        assign data1=registers[reg1];
        assign data2=registers[reg2];
    
    	end
endmodule
