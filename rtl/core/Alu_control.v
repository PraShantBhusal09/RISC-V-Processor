`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2026 12:47:46 AM
// Design Name: 
// Module Name: Alu_control
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
module Alu_control(
    input  [6:0] opcode,
    input  [2:0] funct3,
    input  [6:0] funct7,
    
    output reg [4:0] alu_sel
);
//here same as alu module 
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

    always @(*) begin

        case (opcode)

     //testing for r type
            7'b0110011: begin
                case (funct3)

            
                    3'b000: begin
                        if (funct7 == 7'b0100000)
                            alu_sel = ALU_SUB;
                        else
                            alu_sel = ALU_ADD;
                    end

                    // SLL
                    3'b001: alu_sel = ALU_SLL;

                    // SLT
                    3'b010: alu_sel = ALU_SLT;

                    // SLTU
                    3'b011: alu_sel = ALU_SLTU;

                    // XOR
                    3'b100: alu_sel = ALU_XOR;

                    3'b101: begin
                        if (funct7 == 7'b0100000)
                            alu_sel = ALU_SRA;
                        else
                            alu_sel = ALU_SRL;
                    end

                    // OR
                    3'b110: alu_sel = ALU_OR;

                    // AND
                    3'b111: alu_sel = ALU_AND;

                    default: alu_sel = ALU_ADD;
                endcase
            end


            //i type
            7'b0010011: begin
                case (funct3)

                    // ADDI
                    3'b000: alu_sel = ALU_ADD;

                    // SLLI
                    3'b001: alu_sel = ALU_SLL;

                    // SLTI
                    3'b010: alu_sel = ALU_SLT;

                    // SLTIU
                    3'b011: alu_sel = ALU_SLTU;

                    // XORI
                    3'b100: alu_sel = ALU_XOR;

                    3'b101: begin
                        if (funct7 == 7'b0100000)
                            alu_sel = ALU_SRA;
                        else
                            alu_sel = ALU_SRL;
                    end

                    // ORI
                    3'b110: alu_sel = ALU_OR;

                    // ANDI
                    3'b111: alu_sel = ALU_AND;

                    default: alu_sel = ALU_ADD;
                endcase
            end


            // Load: address = rs1 + immediate
            7'b0000011: begin
                alu_sel = ALU_ADD;
            end


            // Store: address = rs1 + immediate
    
            7'b0100011: begin
                alu_sel = ALU_ADD;
            end


          
            // Branch instructions
            7'b1100011: begin
                case (funct3)

                    // BEQ / BNE
                    3'b000: alu_sel = ALU_SUB;
                    3'b001: alu_sel = ALU_SUB;

                    // BLT / BGE
                    3'b100: alu_sel = ALU_SLT;
                    3'b101: alu_sel = ALU_SLT;

                    // BLTU / BGEU
                    3'b110: alu_sel = ALU_SLTU;
                    3'b111: alu_sel = ALU_SLTU;

                    default: alu_sel = ALU_ADD;
                endcase
            end

            default: alu_sel = ALU_ADD;

        endcase
    end

endmodule