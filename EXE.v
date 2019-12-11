`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Connie Zhou and Anuska Rungta
//////////////////////////////////////////////////////////////////////////////////


module EXE(clk,PC, ALUOp, data1, data2, zero, ALUResult, newPC);
    input clk, ALUOp, data1, data2, PC;
    output reg[31:0] zero, ALUResult, newPC;
    
    initial begin
    assign zero = (ALUResult==16'd0) ? 1'b1: 1'b0;
    newPC=PC+4;
    end
    
    always@(posedge clk) begin
    //ALUControl myControl(.funct(ALUOp),.aluop(ALUOp),.aluctl(ALUOp));
    ALU myALU(.clk(clk), .ALUOp(ALUOp), .data1(data1), .data2(data2), .zero(data1), .ALUResult(data1));
    end
    

    

endmodule
