`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2026 12:36:07 AM
// Design Name: 
// Module Name: tb_instruction_memory
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


module tb_instruction_memory;

    reg  [31:0] addr;
    wire [31:0] instruction;

    instruction_memory uut (
        .addr(addr),
        .instruction(instruction)
    );

    initial begin

        addr = 32'h0000_0000; #10;
        addr = 32'h0000_0004; #10;
        addr = 32'h0000_0008; #10;
        addr = 32'h0000_000C; #10;
        addr = 32'h0000_0010; #10;

        $finish;
    end

endmodule