`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2026 11:05:47 PM
// Design Name: 
// Module Name: tb_immediate_generator
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

module tb_immediate_generator;

    reg  [31:0] instruction;
    reg  [2:0]  sel;
    wire [31:0] imm;

    immediate_generator uut (
        .instruction(instruction),
        .sel(sel),
        .imm(imm)
    );

    localparam I_TYPE = 3'b000;
    localparam S_TYPE = 3'b001;
    localparam B_TYPE = 3'b010;
    localparam U_TYPE = 3'b011;
    localparam J_TYPE = 3'b100;

    initial begin

     
        // Positive immediate = 10
        // instruction[31:20] = 000000001010
        instruction = 32'b000000001010_00000_000_00001_0010011;
        sel = I_TYPE;
        #10;

        // Negative immediate = -10
        // 12-bit representation of -10 = FFF6
        instruction = 32'b111111110110_00000_000_00001_0010011;
        sel = I_TYPE;
        #10;



        // Positive immediate = 20
        // imm[11:5] = 0000000
        // imm[4:0]  = 10100
        instruction = 32'b0000000_00011_00010_010_10100_0100011;
        sel = S_TYPE;
        #10;

        // Negative immediate = -20
        // 12-bit -20 = FEC
        // imm[11:5] = 1111111
        // imm[4:0]  = 01100
        instruction = 32'b1111111_00011_00010_010_01100_0100011;
        sel = S_TYPE;
        #10;


        // Positive branch immediate = 16
        // Binary immediate = 0000000010000
        instruction = 32'b0_000000_00010_00001_000_1000_0_1100011;
        sel = B_TYPE;
        #10;

        // Negative branch immediate = -16
        instruction = 32'b1_111111_00010_00001_000_1000_1_1100011;
        sel = B_TYPE;
        #10;



        // Immediate = 0x12345000
        instruction = 32'b00010010001101000101_00000_0110111;
        sel = U_TYPE;
        #10;


    
        // Positive jump immediate = 32
        instruction = 32'b0_0000001000_0_00000000_00001_1101111;
        sel = J_TYPE;
        #10;

        // Negative jump immediate = -32
        instruction = 32'b1_1111111000_1_11111111_00001_1101111;
        sel = J_TYPE;
        #10;


        // ==========================================
        // FINISH
        // ==========================================

        $finish;

    end


 
    initial begin
        $monitor("TIME=%0t | SEL=%b | INSTRUCTION=%h | IMM=%h | DEC=%0d",
                  $time,
                  sel,
                  instruction,
                  imm,
                  $signed(imm));
    end

endmodule
