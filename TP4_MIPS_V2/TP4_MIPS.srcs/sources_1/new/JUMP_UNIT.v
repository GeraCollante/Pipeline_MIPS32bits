`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2020 17:43:25
// Design Name: 
// Module Name: JUMP_UNIT
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

module JUMP_UNIT(
    input [31:0] instruction,
    output reg J,
    output reg [31:0] PCjump);
    
    reg [5:0] opcode;
    
    localparam Jop   = 6'b000010;
    localparam JALop = 6'b000011;
    //localparam JALop = 6'b000011;
    
    always @ *
    begin
        opcode = instruction[31:26];
        // Checks if J instruction
        if( opcode == Jop || opcode == JALop)
        begin
            J = 1'b1;
            PCjump = {{6{1'b0}}, instruction[25:0]};
        end
        else
        begin
            J = 1'b0;
            PCjump = {32{1'b0}};
        end
	end
endmodule