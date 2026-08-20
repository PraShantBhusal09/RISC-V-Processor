`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2026 12:21:05 AM
// Design Name: 
// Module Name: tb_instruction_decoder
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


module tb_instruction_decoder;

reg [31:0] instruction ;

  wire [6:0] opcode ;
  wire [4:0] rd ;
  wire [2:0] funct3;
  wire [4:0] rs1 ;
  wire [4:0] rs2 ;
   wire [6:0] funct7;

instruction_decoder uut(
  .instruction(instruction),
  .opcode(opcode),
  .rd(rd),
  .funct3(funct3),
  .rs1(rs1),
  .rs2(rs2),
  .funct7(funct7)
   );
   
initial begin

    instruction = 32'b0000000_00100_00011_000_00101_0110011;
        
     #10;
    instruction = 32'b0100000_00010_00001_000_00110_0110011;
     #10

   $finish ;
   
end
endmodule
