`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:       Universidad Nacional de Cordoba
// Engineer:		Gerardo Collante
//                Nicolas Quinteros Castilla
//
// Create Date:   11:46:02 10/17/2016
// Module Name:   ID_EX
// Project Name:  MIPS 
// Description:   ID/EX module for the DECODE stage.
//
// Dependencies:  None
//
////////////////////////////////////////////////////////////////////////////////

module ID_EX(input clk,
        	 input rst,
	         input enable,
	         input [1:0]  ctlwb_out,
	         input [2:0]  ctlm_out,
	         input [3:0]  ctlex_out,
	         input [31:0] npc,
	         input [31:0] readdat1, 
	         input [31:0] readdat2, 
	         input [4:0]  shamt,
	         input [5:0]  opcode,
	         input [31:0] signext_out,
	         input [4:0]  instr_2016, 
	         input [4:0]  instr_1511,
	         output reg [1:0]  wb_ctlout,
	         output reg [2:0]  m_ctlout,
	         output reg [3:0]  ex_ctlout,
	         output reg [31:0] npcout,
	         output reg [31:0] rdata1out, 
	         output reg [31:0] rdata2out,
	         output reg [31:0] s_extendout,
	         output reg [4:0]  shamt_out,
	         output reg [5:0]  opcode_out,
	         output reg [4:0]  instrout_2016, 
	         output reg [4:0]  instrout_1511,
            // Forwarding
            // ---------------------------
             input      [4:0]  instr_2521,
             output reg [4:0]  instrout_2521
            // ---------------------------
            );
	
	localparam J_Type_JAL   = 6'b000011;
	// Initialize
//	initial
//		begin
//			wb_ctlout     <= 2'b00;
//			m_ctlout      <= 3'b000;
//			ex_ctlout     <= 4'b0000;
//			j_ctlout      <= 1'b0;
//			npcout        <= {32{1'b0}};
//			rdata1out     <= {32{1'b0}};
//			rdata2out     <= {32{1'b0}};
//			s_extendout   <= {32{1'b0}};
//			instrout_2016 <= 5'b00000;
//			instrout_1511 <= 5'b00000;
//			// Forwarding
//			instrout_2521 <= 5'b00000;
//		end
		
	// Update
	always @ (posedge clk)
        if(rst)
            begin
                wb_ctlout     <= 2'b00;
                m_ctlout      <= 3'b000;
                ex_ctlout     <= 4'b0000;
                npcout        <= {32{1'b0}};
                rdata1out     <= {32{1'b0}};
                rdata2out     <= {32{1'b0}};
                s_extendout   <= {32{1'b0}};
                shamt_out     <= 5'b00000;
                opcode_out    <= 6'b000000;
                instrout_2016 <= 5'b00000;
                instrout_1511 <= 5'b00000;
                // Forwarding
                instrout_2521 <= 5'b00000;
			end
        else if (enable)
            begin
                wb_ctlout     <= ctlwb_out;
                m_ctlout      <= ctlm_out;
                ex_ctlout     <= ctlex_out;
                npcout        <= npc;
                rdata1out     <= readdat1;
                rdata2out     <= readdat2;
                s_extendout   <= signext_out;
                shamt_out     <= shamt;
                opcode_out    <= opcode;
                instrout_2016 <= instr_2016;
                // Forwarding
                instrout_2521 <= instr_2521;
                // Jal
                if(opcode == J_Type_JAL) 
                    begin
                        instrout_1511 <= 5'b11111;
                    end
                else
                    begin
                        instrout_1511 <= instr_1511;
                    end
			end
endmodule
