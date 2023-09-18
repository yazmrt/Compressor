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

  // Parameters
  parameter DATA_WIDTH = 4;

  // Inputs and Outputs
  reg [DATA_WIDTH-1:0] a_in, b_in, c_in, d_in;
  wire [DATA_WIDTH:0] s_out, c_out;

  // Instantiate the nbit_compressor module
  nbit_compressor #(DATA_WIDTH) uut (
    .a_in(a_in),
    .b_in(b_in),
    .c_in(c_in),
    .d_in(d_in),
    .s_out(s_out),
    .c_out(c_out)
  );
  
  // Testbench stimulus
  initial begin
    // Initialize inputs
    a_in = 4'b1001;
    b_in = 4'b1001;
    c_in = 4'b1001;
    d_in = 4'b1001;

    // Wait for a few clock cycles
    #10;

    // Display inputs
    $display("Inputs: a_in=%b, b_in=%b, c_in=%b, d_in=%b", a_in, b_in, c_in, d_in);

    // Display outputs
    $display("Outputs: s_out=%b, c_out=%b", s_out, c_out);

    // End simulation
    $finish;
  end

endmodule
