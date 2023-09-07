`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 11:10:15 PM
// Design Name: 
// Module Name: tb_compressor
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


`timescale 1ns / 1ps

module tb_compressor;

  // Inputs
  reg x1_i, x2_i, x3_i, x4_i, cin_i;

  // Outputs
  wire cout_o, carry_o, sum_o;

  // Instantiate the compressor_4to2 module
  compressor_4to2 uut (
    .x1_i(x1_i),
    .x2_i(x2_i),
    .x3_i(x3_i),
    .x4_i(x4_i),
    .cin_i(cin_i),
    .cout_o(cout_o),
    .carry_o(carry_o),
    .sum_o(sum_o)
  );

  // Test stimulus generation
  initial begin
    // Test case 1: x1 = 0, x2 = 0, x3 = 0, x4 = 0, cin = 0
    x1_i = 0; x2_i = 0; x3_i = 0; x4_i = 0; cin_i = 0;
    #2;
    
    // Test case 2: x1 = 1, x2 = 0, x3 = 0, x4 = 1, cin = 1
    x1_i = 1; x2_i = 0; x3_i = 0; x4_i = 1; cin_i = 1;
    #2;

    // Test case 3: x1 = 1, x2 = 1, x3 = 1, x4 = 1, cin = 0
    x1_i = 1; x2_i = 1; x3_i = 1; x4_i = 1; cin_i = 0;
    #2;

    // Add more test cases here as needed

    $finish;
  end

  // Monitor for observing the outputs
  initial begin
    $display("Time=%t, x1=%b, x2=%b, x3=%b, x4=%b, cin=%b, sum=%b, carry=%b, cout=%b", $time, x1_i, x2_i, x3_i, x4_i, cin_i, sum_o, carry_o, cout_o);
end

endmodule
