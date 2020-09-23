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

module BRANCH_FORWARDING_UNIT(
    input IDcontrolBranch,
    input ExMemRegisterRd,
    input IfIdRegisterRs,
    input IfIdRegisterRt,
    output reg ForwardC,
    output reg ForwardD);

    always @(*)
        begin
            if ( IDcontrolBranch &&
               ( ExMemRegisterRd != 0 ) &&
               ( ExMemRegisterRd == IfIdRegisterRs ))
               begin
                    ForwardC = 1;
               end
           if ( IDcontrolBranch &&
               ( ExMemRegisterRd != 0 ) &&
               ( ExMemRegisterRd == IfIdRegisterRt ))
               begin
                    ForwardD = 1;
               end
        end

//always @*
//begin
//    if (on == 1)
//    begin
//        if (btn == 1'b1)
//        begin
//            flag = 1'b1;
//        end
//    end
//    else
//    begin
//        enable = 1'b1;
//    end
//end

//always @ (posedge clk)
//begin
//    if (flag == 1'b1)
//    begin 
//        enable = 1'b1;
//    end
//end

//always @ (negedge clk)
//begin
//    if(on==1)
//    begin
//        enable <= 1'b0;
//        if (enable == 1'b1)
//        begin
//            flag <= 1'b0;
//        end
//    end
//end
endmodule
