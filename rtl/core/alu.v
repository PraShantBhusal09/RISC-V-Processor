`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2026 09:53:18 PM
// Design Name: 
// Module Name: alu
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


module alu(
   input [31:0] A,B   ,
   input [4:0]sel ,
   output reg [31:0 ] Z ,
   output  reg carry 
    );
    
    always @(*) begin
    
      Z= 32'b0 ;
      carry =1'b0;
      
      case(sel)
       
         5'b00000: begin
         {carry,Z} = A+B ;
         end 
         
         5'b00001 : begin
         Z = A-B ;
         end
         
          5'b00010 : begin
         Z = A| B ;
         end
         
          5'b00011 : begin
         Z = A&B ;
         end
         
          5'b00100 : begin
         Z = A^B ;
         end
         
         5'b00101 : begin  //shift left
         Z= A<<B[4:0] ;
         end 
         
            5'b00110 : begin //shift right
         Z= A>>B[4:0] ;
         end 
         
             5'b00111 : begin //arithmetic right shift
         Z= $signed(A)>>>B[4:0] ;
         end
         
        5'b01000: begin //signed less than
         Z = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
         end
    
          5'b01001: begin //unsigned less than
          Z = (A < B) ? 32'b1 : 32'b0;
           end
         
              default: begin
            Z = 32'b0;
            carry = 1'b0;
        end
         
  endcase
  end        
endmodule
