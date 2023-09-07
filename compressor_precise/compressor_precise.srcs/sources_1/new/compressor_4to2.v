`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 07:48:29 PM
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
output cout_o,
output carry_o,
output sum_o);

wire sum_internal;

FullAdder fa1(.a_i(x1_i), .b_i(x2_i), .cin_i(x3_i), .sum_o(sum_internal), .cout_o(cout_o));
FullAdder fa2(.a_i(x4_i), .b_i(sum_internal), .cin_i(cin_i), .sum_o(sum_o), .cout_o(carry_o));

endmodule
