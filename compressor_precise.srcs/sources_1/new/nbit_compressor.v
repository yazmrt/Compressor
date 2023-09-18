`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 07:13:51 PM
// Design Name: 
// Module Name: nbit_compressor
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


module nbit_compressor
#(parameter DATA_WIDTH = 8)
(input [DATA_WIDTH-1:0] a_in, 
input [DATA_WIDTH-1:0] b_in, 
input [DATA_WIDTH-1:0] c_in, 
input [DATA_WIDTH-1:0] d_in, 
output [DATA_WIDTH:0] s_out, 
output [DATA_WIDTH:0] c_out);

wire [DATA_WIDTH-1:0] Cout;

genvar i;

compressor_4to2 cmp0(a_in[0], b_in[0], c_in[0], d_in[0], 1'b0, Cout[0], c_out[0], s_out[0]);
generate 
    for (i=1 ; i<DATA_WIDTH; i=i+1) begin 
        compressor_4to2 cmp(a_in[i], b_in[i], c_in[i], d_in[i], Cout[i-1], Cout[i], c_out[i], s_out[i]);
    end
endgenerate
assign s_out [DATA_WIDTH] = Cout[DATA_WIDTH-1];
assign c_out [DATA_WIDTH] = 1'b0;

endmodule
