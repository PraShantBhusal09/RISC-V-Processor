`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 08/12/2026 12:00:10 AM
// Design Name:
// Module Name: tb_regg
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

module tb_regg;

reg rst,clk;
reg [4:0] rs1,rs2,rd;
reg en;
reg [31:0] wd;

wire [31:0] rd1,rd2;


// register file instantiation

reg_file uut (
.clk(clk),
.rst(rst),
.rs1(rs1),
.rs2(rs2),
.rd(rd),
.wd(wd),
.en(en),
.rd1(rd1),
.rd2(rd2)
);


// clock generation

always #5 clk = ~clk;


initial begin

clk = 0;
rst = 0;
rs1 = 0;
rs2 = 0;
rd = 0;
wd = 0;
en = 0;


// case 1 : reset

#10;

rst = 1;

$display("reset completed");


// case 2 : write into R3

@(negedge clk);

en = 1;
rd = 3;
wd = 32'd100;

@(posedge clk);

#1;
en = 0;

#1;

$display("R3 internal = %d",uut.registers[3]);


// case 3 : write into R5

@(negedge clk);

en = 1;
rd = 5;
wd = 32'd200;

@(posedge clk);

#1;
en = 0;

#1;

$display("R5 internal = %d",uut.registers[5]);


// case 4 : read R3 and R5

rs1 = 3;
rs2 = 5;

#1;

$display("Read R3 = %d",rd1);
$display("Read R5 = %d",rd2);


// case 5 : write into R4

@(negedge clk);

en = 1;
rd = 4;
wd = 32'd300;

@(posedge clk);

#1;
en = 0;

#1;

$display("R4 internal = %d",uut.registers[4]);


// read R4

rs1 = 4;

#1;

$display("Read R4 = %d",rd1);


// case 6 : try to write into R0

@(negedge clk);

en = 1;
rd = 0;
wd = 32'd999;

@(posedge clk);

#1;
en = 0;

#1;


// read R0

rs1 = 0;
rs2 = 0;

#1;

$display("Read R0 = %d",rd1);
$display("Read R0 = %d",rd2);


// finish simulation

#10;

$finish;

end

endmodule