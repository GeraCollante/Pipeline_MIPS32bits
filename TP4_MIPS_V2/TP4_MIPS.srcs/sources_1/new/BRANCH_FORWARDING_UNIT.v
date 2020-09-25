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
    input [4:0] ExMemRegisterRd,
    input [4:0] IfIdRegisterRs,
    input [4:0] IfIdRegisterRt,
    input [4:0] MemWbRegisterRd,
    output reg ForwardReg1,
    output reg ForwardReg2,
    output reg ForwardSel);

    initial begin 
        ForwardReg1 = 1'b0;
        ForwardReg2 = 1'b0;
        ForwardSel  = 1'b0;
    end
    
    // EX forwarding
    
always @(*)
    begin
        // ExMem Fwd
        // ForwardSel = 1
        if ( IDcontrolBranch &&
        ( ExMemRegisterRd != 0 ) &&
        ( ExMemRegisterRd == IfIdRegisterRs ))
            begin
                ForwardReg1 = 1'b1;
                ForwardReg2 = 1'b0;
                ForwardSel  = 1'b1;
            end
        else if ( IDcontrolBranch &&
        ( ExMemRegisterRd != 0 ) &&
        ( ExMemRegisterRd == IfIdRegisterRt ))
            begin
                ForwardReg1 = 1'b0;
                ForwardReg2 = 1'b1;
                ForwardSel  = 1'b1;
            end
        // MemWb Fwd
        // Forward Sel = 0
        else if ( IDcontrolBranch &&
        ( MemWbRegisterRd == IfIdRegisterRs ))
            begin
                ForwardReg1 = 1'b1;
                ForwardReg2 = 1'b0;
                ForwardSel  = 1'b0;
            end
        else if ( IDcontrolBranch &&
        ( MemWbRegisterRd == IfIdRegisterRt ))
            begin
                ForwardReg1 = 1'b0;
                ForwardReg2 = 1'b1;
                ForwardSel  = 1'b0;
            end 
        else
            begin
                ForwardReg1 = 1'b0;
                ForwardReg2 = 1'b0;
                ForwardSel  = 1'b0;
            end
end

// MEM forwarding
// Forward Sel = 0
           
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
