`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2026 11:22:41 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(

 input rst,clk ,
 input wire [4:0] rs1,rs2 ,
 input  wire [4:0] rd ,
 input [31:0] wd ,
 input wire en ,
 
 output [31:0] rd1 ,
 output [31:0] rd2
);

reg[31:0] registers [0:31];

integer i ;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
    
     for(i=0 ; i<32 ; i= i+1)
       registers[i] = 32'b0;
       
       end
       
       else begin
       
       if (en && (rd != 5'b00000))
       registers[rd] <= wd ;
       
       end 
       
    end   
    
       assign rd1 = (rs1 == 5'b00000)? 32'b0 : registers[rs1] ;
       assign rd2 = (rs2 ==5'b00000)? 32'b0 : registers[rs2];    


endmodule
