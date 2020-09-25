`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2020 00:16:13
// Design Name: 
// Module Name: JAL_UNIT
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


module JAL_UNIT(
    input [31:0] NPC,
    input [5:0] opcode,
    output wire [31:0] PCra,
    output reg JAL);

    localparam J_Type_JAL = 6'b000011;
    
    //assign PCra = NPC + 1;
    assign PCra = NPC;
    
    always@(*)
        begin
        if (opcode == J_Type_JAL)
            begin
                JAL = 1'b1;
            end
        else
            begin
                 JAL = 1'b0;   
            end
    end

endmodule

