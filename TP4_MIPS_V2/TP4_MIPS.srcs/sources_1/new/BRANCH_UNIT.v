`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2020 01:49:55
// Design Name: 
// Module Name: BRANCH_UNIT
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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2020 21:13:44
// Design Name: 
// Module Name: DEBUG_UNIT
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
module BRANCH_UNIT(
    input [31:0] reg1,
    input [31:0] reg2,
    input BEQ_Option,
    input BNE_Option,
    output reg Branch
);
  
    reg Equal;
	
    always @*
    begin
        Equal = (reg1 == reg2) ? 1'b1 : 1'b0;
        Branch = (BEQ_Option && Equal) || (BNE_Option && ~Equal);
    end
  
endmodule
