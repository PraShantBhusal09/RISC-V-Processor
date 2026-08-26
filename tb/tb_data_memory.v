`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 01:11:47 AM
// Design Name: 
// Module Name: tb_data_memory
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

module tb_data_memory;

    reg clk;
    reg mem_write;
    reg [31:0] addr;
    reg [31:0] write_data;
    wire [31:0] read_data;

    data_memory uut (
        .clk(clk),
        .mem_write(mem_write),
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        mem_write = 0;
        addr = 32'h0;
        write_data = 32'h0;

        #10;
        addr = 32'h0000_0004;
        write_data = 32'h1234_5678;
        mem_write = 1;
        #10;

        addr = 32'h0000_0008;
        write_data = 32'h8765_4321;
        mem_write = 1;
        #10;

        mem_write = 0;
        addr = 32'h0000_0004;
        #10;

        addr = 32'h0000_0008;
        #10;

        addr = 32'h0000_0000;
        #10;

        $finish;
    end


endmodule