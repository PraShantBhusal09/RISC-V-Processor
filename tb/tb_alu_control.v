`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2026 01:02:25 AM
// Design Name: 
// Module Name: tb_alu_control
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

module tb_alu_control;
    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [6:0] funct7;
    
    wire [4:0] alu_sel;

 
    localparam ALU_ADD  = 5'b00000;
    localparam ALU_SUB  = 5'b00001;
    localparam ALU_OR   = 5'b00010;
    localparam ALU_AND  = 5'b00011;
    localparam ALU_XOR  = 5'b00100;
    localparam ALU_SLL  = 5'b00101;
    localparam ALU_SRL  = 5'b00110;
    localparam ALU_SRA  = 5'b00111;
    localparam ALU_SLT  = 5'b01000;
    localparam ALU_SLTU = 5'b01001;

 
    Alu_control uut (
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .alu_sel(alu_sel)
    );
    initial begin
        // R-TYPE 

        // ADD
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;

        #10


        // SUB
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0100000;

         #10


        // SLL
        opcode = 7'b0110011;
        funct3 = 3'b001;
        funct7 = 7'b0000000;

         #10


        // SLT
        opcode = 7'b0110011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;

        #10


        // SLTU
        opcode = 7'b0110011;
        funct3 = 3'b011;
        funct7 = 7'b0000000;

        #10


        // XOR
        opcode = 7'b0110011;
        funct3 = 3'b100;
        funct7 = 7'b0000000;

        #10


        // SRL
        opcode = 7'b0110011;
        funct3 = 3'b101;
        funct7 = 7'b0000000;

         #10


        // SRA
        opcode = 7'b0110011;
        funct3 = 3'b101;
        funct7 = 7'b0100000;

         #10


        // OR
        opcode = 7'b0110011;
        funct3 = 3'b110;
        funct7 = 7'b0000000;

      #10


        // AND
        opcode = 7'b0110011;
        funct3 = 3'b111;
        funct7 = 7'b0000000;

         #10


        // I-TYPE INSTRUCTIONS
      

        // ADDI
        opcode = 7'b0010011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;

         #10

        // SLLI
        opcode = 7'b0010011;
        funct3 = 3'b001;
        funct7 = 7'b0000000;

        #10


        // SLTI
        opcode = 7'b0010011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;

        #10


        // SLTIU
        opcode = 7'b0010011;
        funct3 = 3'b011;
        funct7 = 7'b0000000;

         #10


        // XORI
        opcode = 7'b0010011;
        funct3 = 3'b100;
        funct7 = 7'b0000000;

         #10

        // SRLI
        opcode = 7'b0010011;
        funct3 = 3'b101;
        funct7 = 7'b0000000;

         #10


        // SRAI
        opcode = 7'b0010011;
        funct3 = 3'b101;
        funct7 = 7'b0100000;

        #10


        // ORI
        opcode = 7'b0010011;
        funct3 = 3'b110;
        funct7 = 7'b0000000;

         #10


        // ANDI
        opcode = 7'b0010011;
        funct3 = 3'b111;
        funct7 = 7'b0000000;

         #10


    
        // LOAD
        opcode = 7'b0000011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;

         #10


        // STORE

        opcode = 7'b0100011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;

         #10


       //branch 

        opcode = 7'b1100011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;

       #10


        // BNE
        opcode = 7'b1100011;
        funct3 = 3'b001;
        funct7 = 7'b0000000;

         #10

        // BLT

        opcode = 7'b1100011;
        funct3 = 3'b100;
        funct7 = 7'b0000000;
   
          #10
   
        // BGE
       

        opcode = 7'b1100011;
        funct3 = 3'b101;
        funct7 = 7'b0000000;

        #10

        // BLTU

        opcode = 7'b1100011;
        funct3 = 3'b110;
        funct7 = 7'b0000000;

         #10


        // BGEU

        opcode = 7'b1100011;
        funct3 = 3'b111;
        funct7 = 7'b0000000;

         #10


    
        $finish;

    end

endmodule