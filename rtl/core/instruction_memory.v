`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2026 12:34:34 AM
// Design Name: 
// Module Name: instruction_memory
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




module instruction_memory(
    input  [31:0] addr,        
    output [31:0] instruction 
);

    // 64 words of 32-bit memory (256 bytes total)
    reg [31:0] mem [0:63];

    initial begin
        mem[0] = 32'h00500093; // addi x1, x0, 5    (x1 = 5)
        mem[1] = 32'h00a00113; // addi x2, x0, 10   (x2 = 10)
        mem[2] = 32'h002081b3; // add  x3, x1, x2   (x3 = 15)
        mem[3] = 32'h00310233; // add  x4, x2, x3   (x4 = 25)
        mem[4] = 32'h402082b3; // sub  x5, x1, x2   (x5 = -5)
    end
    assign instruction = mem[addr[31:2]];

endmodule
