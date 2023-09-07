`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 08:03:35 PM
// Design Name: 
// Module Name: compressor_4to2
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


module compressor_4to2(
input x1_i,
input x2_i,
input x3_i,
input x4_i,
input cin_i,
output carry_o,
output cout_o,
output sum_o);

wire r1,r2,r3,r4,r5,r6,r7,r8,r9;

nand (r1,x3_i,x4_i);
or (r2,x3_i,x4_i);
and (r3,r1,r2);
//not (r4,r3);
nand (r4,cin_i,r3);
or (r5,cin_i,r3);
nand (r6,r5,r4);
nand (carry_o,r1,r4);
nor(r7,x1_i,x2_i);
and(r8,x1_i,x2_i);
or(r9,r7,r8);
nand(sum_o,r9,r6);

assign cout_o = r8;

endmodule
