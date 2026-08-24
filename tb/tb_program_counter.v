`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2026 09:43:21 PM
// Design Name: 
// Module Name: tb_program_counter
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


module tb_program_counter;

    reg clk;
    reg rst;
    reg [31:0] pc_next;
    wire [31:0] pc;

    // Instantiate the Program Counter
    program_counter uut (
        .clk(clk),
        .rst(rst),
        .pc_next(pc_next),
        .pc(pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0; 
        pc_next = 32'h0000_0004;

  
        #20;
        rst = 1;

        // Test Sequential PC 
        #10 pc_next = 32'h0000_0008;
        #10 pc_next = 32'h0000_000C;

        // Test Branch Jump (Non-sequential address)
        #10 pc_next = 32'h0000_0040;
        #10 pc_next = 32'h0000_0044;

        // Test Asynchronous Reset
        #15 rst = 0; // Trigger reset mid-cycle
        #10 rst = 1;

        #20 $finish;
    end

endmodule