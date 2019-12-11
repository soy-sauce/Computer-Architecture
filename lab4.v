`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2019 11:12:35 AM
// Design Name: 
// Module Name: lab3
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


module lab4(clk);
//binary: 00000001000010000100100000100000, hex: 01084820
//binary: 00000001000010010101000000100010, hex: 01095022
//binary: 00000001010010000101000000100100, hex: 01485024
//binary: 00000001001010100101100000100101, hex: 012a5825
//binary: 00000001011010000110000000101010, hex: 0168602a
    input clk;
    integer instructions[14:0];
    reg[4:0] R[31:0];
    integer i;
    integer j;
    reg [5:0]func, opcode;
    reg [4:0]rs, rt, rd, shamt;
    integer inst_pointer;
    reg[31:0] curr_inst;
    reg [31:0] memory[19:0][1:0];
    
    initial begin
        inst_pointer = 0;
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
        for(i=0;i<32;i=i+1)begin
            R[i]=0;
        end
        R[8]=4;
        R[9]=14;
        R[10]=12;
        R[11]=9;
        R[12]=7;
        R[13]=5;
        R[14]=5;
        R[15]=12;
        $display("--- Beginning of Program ---\nInitialized Instructions:");
        while(i < 15) begin
            $display("binary: %b, hex: %h", instructions[i], instructions[i]);
            i = i + 1;
        end
        
        $display("Initialized Registers: $zero =%d",R[0]);
        $display("$at=%d",R[1]);
        $write("$v0-$v1=");
        for(i=2;i<4;i=i+1)begin
            $write("%d",R[i]);
            end
        $display();    
        
        $write("$a0-$a3=");
        for(i=4;i<8;i=i+1)begin
            $write("%d",R[i]);
            end
        $display();  
        
        $write("$t0-$t7=");
        for(i=8;i<16;i=i+1)begin
            $write("%d",R[i]);
            end
        $display();  
        $write("$s0-$s7=");
        for(i=16;i<24;i=i+1)begin
            $write("%d",R[i]);
            end
        $display();  
        $write("$t8-$t9");
        for(i=24;i<26;i=i+1)begin
            $write("%d",R[i]);
            end
        $display();  
        $write("$k0-$k1");
        for(i=26;i<18;i=i+1)begin
            $write("%d",R[i]);
            end
        $display(); 
        $display("$gp",R[28]);
        $display("$sp",R[29]);
        $display("fp",R[30]);
        $display("ra",R[31]);
        
        
            
        memory[0][0] = 16'h4000;
        memory[0][1] = 94;
        memory[1][0] = 16'h4004;
        memory[1][1] = 98;
        memory[2][0] = 16'h4008;
        memory[2][1] = 109;
        memory[3][0] = 16'h400c;
        memory[3][1] = 102;
        memory[4][0] = 16'h4010;
        memory[4][1] = 100;
        memory[5][0] = 16'h4014;
        memory[5][1] = 99;
        memory[6][0] = 16'h4018;
        memory[6][1] = 164;
        memory[7][0] = 16'h401c;
        memory[7][1] = 183;
        memory[8][0] = 16'h4020;
        memory[8][1] = 203;
        memory[9][0] = 16'h4024;
        memory[9][1] = 192;
        memory[10][0] = 16'h4028;
        memory[10][1] = 243;
        memory[11][0] = 16'h402c;
        memory[11][1] = 229;
        memory[12][0] = 16'h4030;
        memory[12][1] = 50;
        memory[13][0] = 16'h4034;
        memory[13][1] = 1;
        memory[14][0] = 16'h4038;
        memory[14][1] = 106;
        memory[15][0] = 16'h403c;
        memory[15][1] = 82;
        memory[16][0] = 16'h4040;
        memory[16][1] = 441;
        memory[17][0] = 16'h4044;
        memory[17][1] = 414;
        memory[18][0] = 16'h4048;
        memory[18][1] = 384;
        memory[19][0] = 16'h404c;
        memory[19][1] = 419;

        
        $display("---Memory Subset---");
        for(j = 0; j < 20; j = j + 1) begin
            $display("0x1000%h:", memory[j][0], memory[j][1]);
        end
        i = 0; // resetting i for instruction iterator
    end
    
always@(posedge clk) begin 
        curr_inst=instructions[inst_pointer];
        $display("Current Instruction:", curr_inst, "Instruction # ", inst_pointer);
        case(curr_inst[31:26]) // opcode case statement
            000000: begin
                if (curr_inst[5:0] == 6'b100000) begin
                    rs = curr_inst[26:21];
                    rt = curr_inst[20:16];
                    rd = curr_inst[15:11];
                    
                end
            end
            100011: begin
                rs = curr_inst[26:21];
                rt = curr_inst[20:16];
                rd = curr_inst[15:11];
                rs=rt;
            end
            101011: begin
                rs = curr_inst[26:21];
                rt = curr_inst[20:16];
                rd = curr_inst[15:11];
                rs=rt;
            end
        
        endcase
        
        $display("Initialized Registers:");
        func = instructions[i][5:0];
        
        $display("---Memory Subset---");
        for(j = 0; j < 20; j = j + 1) begin
            $display("0x1000%h:", memory[j][0], memory[j][1]);
        end
    end
    
endmodule
