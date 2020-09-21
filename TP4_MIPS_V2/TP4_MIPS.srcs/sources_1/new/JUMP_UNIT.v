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
    
    always @ *
	begin
        // Checks if J instruction
        if( instruction[31:26] == 6'b000010)
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