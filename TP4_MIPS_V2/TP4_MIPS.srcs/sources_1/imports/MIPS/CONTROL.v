`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:       Universidad Nacional de Cordoba
// Engineer:		Gerardo Collante
//                Nicolas Quinteros Castilla
//
// Create Date:   11:21:00 10/17/2016
// Module Name:   CONTROL
// Project Name:  MIPS 
// Description:   Control module of the DECODE stage.
//
// Dependencies:  None
//
////////////////////////////////////////////////////////////////////////////////

    module CONTROL(input [5:0] opcode,
                   output reg [1:0] WB,
                   output reg [2:0] M,
                   output reg [3:0] EX,
                   output reg J,
                   output reg B);
	
    localparam R_Type       = 6'b000000;
    localparam I_Type_ADDI  = 6'b001000;
    localparam I_Type_ORI   = 6'b001101;
    localparam I_Type_LUI   = 6'b001111;
    localparam I_Type_ANDI  = 6'b001100;
    localparam I_Type_BEQ   = 6'b000100;
    localparam I_Type_BNE   = 6'b000101;
    localparam I_Type_LW    = 6'b100011;
    localparam I_Type_SW    = 6'b101011;
    localparam I_Type_SLTI  = 6'b001010;
    localparam I_Type_XORI  = 6'b001110;
    localparam J_Type_J     = 6'b000010;
    localparam J_Type_JAL   = 6'b000011;
    localparam NOP          = 6'b100000;
    localparam HALT         = 6'b111111;
	
	always @ *
	begin
		case (opcode)
			R_Type:   // R-format
				begin
					WB = 2'b10;
					M  = 3'b000;
					EX = 4'b1100;
					J  = 1'b0;
					B  = 1'b0;
				end		
            I_Type_BEQ:   // I-Format: Branch If Equal (BEQ)
				begin
					WB = 2'b00;
					M  = 3'b100;
					EX = 4'b0010;
					J  = 1'b0;
					B  = 1'b1;
				end
            I_Type_BNE:   // I-Format: Branch if Not Equal (BNE)
				begin
					WB = 2'b00;
					M  = 3'b100;
					EX = 4'b0010;
					J  = 1'b0;
					B  = 1'b0;
				end
            I_Type_ADDI:   // I-Format: Add Immediate Unsigned Word (ADDI)
				begin
					WB = 2'b10;
					M  = 3'b000;
					EX = 4'b0111;
					J  = 1'b0;
					B  = 1'b0;
				end
            I_Type_SLTI:   // I-Format: Set to 1 if Less Than Immediate (SLTI)
				begin
					WB = 2'b10;
					M  = 3'b000;
					EX = 4'b0111;
					J  = 1'b0;
					B  = 1'b0;
				end
            I_Type_ANDI:   // I-Format: Bitwise AND Immediate (ANDI)
				begin
					WB = 2'b10;
					M  = 3'b000;
					EX = 4'b0111;
					J  = 1'b0;
					B  = 1'b0;
				end
            I_Type_ORI:   // I-Format: Bitwise OR Immediate (ORI)
				begin
					WB = 2'b10;
					M  = 3'b000;
					EX = 4'b0111;
					J  = 1'b0;
					B  = 1'b0;
				end
            I_Type_XORI:   // I-Format: Exclusive OR Immediate (XORI)
				begin
					WB = 2'b10;
					M  = 3'b000;
					EX = 4'b0111;
					J  = 1'b0;
					B  = 1'b0;
				end
            I_Type_LUI:   // I-Format: Load Upper Immediate (LUI)
				begin
					WB = 2'b10;
					M  = 3'b000;
					EX = 4'b0111;
					J  = 1'b0;
					B  = 1'b0;
				end
//            6'b100000:   // I-Format: Load Byte (LB)
//				begin
//					WB = 2'b10;
//					M  = 3'b000;
//					EX = 4'b0xx1;
//					J  = 1'b0;
//				end
//            6'b100001:   // I-Format: Load Halfword (LH)
//				begin
//					WB = 2'b10;
//					M  = 3'b000;
//					EX = 4'b0xx1;
//					J  = 1'b0;
//				end
			I_Type_LW:   // I-Format: Load Word (LW)
				begin
					WB = 2'b11;
					M  = 3'b010;
					EX = 4'b0001;
					J  = 1'b0;
					B  = 1'b0;
				end					
//			6'b100100:   // I-Format: Load Byte Unsigned (LBU)
//				begin
//					WB = 2'b11;
//					M  = 3'b010;
//					EX = 4'b0001;
//					J  = 1'b0;
//				end	
//            6'b100101:   // I-Format: Load Halfword Unsigned (LHU)
//				begin
//					WB = 2'b11;
//					M  = 3'b010;
//					EX = 4'b0001;
//					J  = 1'b0;
//				end
//            6'b100111:   // I-Format: Load Word Unsigned (LWU)
//				begin
//					WB = 2'b11;
//					M  = 3'b010;
//					EX = 4'b0001;
//					J  = 1'b0;
//				end
//            6'b101000:   // I-Format: Store Byte (SB)
//            begin
//                WB = 2'b00;
//                M  = 3'b001;
//                EX = 4'b0001;
//                J  = 1'b0;
//            end
//            6'b101001:   // I-Format: Store Halford (SH)
//            begin
//                WB = 2'b00;
//                M  = 3'b001;
//                EX = 4'b0001;
//                J  = 1'b0;
//            end				
			I_Type_SW:   // I-Format: Store Word (SW)
				begin
					WB = 2'b00;
					M  = 3'b001;
					EX = 4'b0001;
					J  = 1'b0;
					B  = 1'b0;
				end					
			J_Type_J:   // J-Format: Jump to Address (J)
                begin
                    WB = 2'b00;
					M  = 3'b000;
					EX = 4'b0000;
					J  = 1'b1;
					B  = 1'b0;
                end
            J_Type_JAL:   // J-Format: Jump and Link (JAL)
                begin
                    WB = 2'b00;
					M  = 3'b000;
					EX = 4'b0000;
					J  = 1'b1;
					B  = 1'b0;
                end
//            6'b000000:   // J-Format: Jump and Link  Register (JALR)
//                begin
//                    WB = 2'b00;
//					M  = 3'b000;
//					EX = 4'b0000;
//					J  = 1'b1;
//                end
            NOP:	       // NOP 
				begin
					WB = 2'b00;
					M  = 3'b000;
					EX = 4'b0000;
					J  = 1'b0;
					B  = 1'b0;
				end
            HALT:	      // HALT 
				begin
					WB = 2'b00;
					M  = 3'b000;
					EX = 4'b0000;
					J  = 1'b0;
					B  = 1'b0;
				end
			default:     // I-Format
                begin
                    WB = 2'b10;
                    M  = 3'b000;
                    EX = 4'b0110;
                    J  = 1'b0;
                end
		endcase
	end
endmodule