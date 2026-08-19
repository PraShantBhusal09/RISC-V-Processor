`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2026 09:45:33 PM
// Design Name: 
// Module Name: immediate_generator
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

module immediate_generator(
    input  wire [31:0] instruction,
    input  wire [2:0]  sel,
    output reg  [31:0] imm
);

    localparam i_type = 3'b000;
    localparam s_type = 3'b001;
    localparam b_type = 3'b010;
    localparam u_type = 3'b011;
    localparam j_type = 3'b100;

    always @(*) begin
        case(sel)
            i_type : begin
                imm = {{20{instruction[31]}}, instruction[31:20]};
            end
            
            s_type : begin 
                imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            end 
            
            b_type : begin
               
                imm = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            end
            
            u_type : begin
                imm = {instruction[31:12], 12'b0};
            end
            
            j_type : begin
         
                imm = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
            end
            
            default : begin
                imm = 32'b0;
            end
        endcase 
    end 
    
endmodule
