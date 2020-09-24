`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2020 01:15:14
// Design Name: 
// Module Name: JR_UNIT
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

module JR_UNIT(
    input [5:0] funct,
    input [5:0] opcode_in,
    input [31:0] regA,
    input [31:0] PC,
    output reg [31:0] opcode_out,
    output reg [31:0] PCjump
    );

localparam J_Type_JR = 6'b001000;
localparam J_Type_J  = 6'b000010;

always @*
    begin
        if(funct == J_Type_JR)
            begin
                opcode_out = J_Type_J;
                PCjump = regA;
            end
        else
            begin
                opcode_out = opcode_in;
                PCjump = PC;
            end
    end

endmodule