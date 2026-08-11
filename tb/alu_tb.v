`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2026 10:20:04 PM
// Design Name: 
// Module Name: alu_tb
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
module alu_tb;

    reg [31:0] A, B;
    reg [4:0] sel;

    wire [31:0] Z;
    wire carry;

    alu uut (
        .A(A),
        .B(B),
        .sel(sel),
        .Z(Z),
        .carry(carry)
    );

    initial begin

        A = 32'd12;
        B = 32'd3;

        // ADD
        sel = 5'b00000;
        #10;
        $display("ADD  : Z=%0d Carry=%b", $signed(Z), carry);

        // SUB
        sel = 5'b00001;
        #10;
        $display("SUB  : Z=%0d Carry=%b", $signed(Z), carry);

        // OR
        sel = 5'b00010;
        #10;
        $display("OR   : Z=%0d", $signed(Z));

        // AND
        sel = 5'b00011;
        #10;
        $display("AND  : Z=%0d", $signed(Z));

        // XOR
        sel = 5'b00100;
        #10;
        $display("XOR  : Z=%0d", $signed(Z));

        // SLL
        sel = 5'b00101;
        #10;
        $display("SLL  : Z=%0d", $signed(Z));

        // SRL
        sel = 5'b00110;
        #10;
        $display("SRL  : Z=%0d", $signed(Z));

        // SRA
        sel = 5'b00111;
        #10;
        $display("SRA  : Z=%0d", $signed(Z));

        // SLT signed
        sel = 5'b01000;
        #10;
        $display("SLT  : Z=%0d", $signed(Z));

        // SLTU unsigned
        sel = 5'b01001;
        #10;
        $display("SLTU : Z=%0d", Z);

        $finish;

    end

endmodule


 
 
 
