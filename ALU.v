`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Connie Zhou and Anuska Rungta
//////////////////////////////////////////////////////////////////////////////////


module ALU(clk, ALUOp, data1, data2, zero, ALUResult);
    input clk, ALUOp, data1, data2;
    output reg[31:0] zero, ALUResult;
    
    initial begin
    assign zero = (ALUResult==16'd0) ? 1'b1: 1'b0;
    end
    
    always@(posedge clk) begin
    case(ALUOp)
     3'b000: ALUResult = data1 + data2; // add
     3'b001: ALUResult = data1 - data2; // sub
     3'b010: ALUResult = ~data1;
     3'b011: ALUResult = data1<<data2;
     3'b100: ALUResult = data1>>data2;
     3'b101: ALUResult = data1 & data2; // and
     3'b110: ALUResult = data1 | data2; // or
     3'b111: begin if (data1<data2) ALUResult = 16'd1;
        else ALUResult = 16'd0;
        end
     default:ALUResult = data1 + data2; // add
     endcase
    end
    

    

endmodule
