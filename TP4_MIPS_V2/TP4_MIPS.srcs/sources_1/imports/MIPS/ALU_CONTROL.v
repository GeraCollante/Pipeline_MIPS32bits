`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:       Universidad Nacional de Cordoba
// Engineer:		Gerardo Collante
//                Nicolas Quinteros Castilla
//
// Create Date:   15:17:23 10/24/2016
// Module Name:   ALU_CONTROL
// Project Name:  MIPS
// Description:   MIPS ALU_CONTROL module in the EXECUTE stage.
//
// Dependencies:  None
//
////////////////////////////////////////////////////////////////////////////////

module ALU_CONTROL(
    input [5:0] funct,
    input [5:0] opcode,
    input [1:0] alu_op,
    output reg [3:0] select);
    
    localparam HALT         = 6'b111111;
    localparam R_Type_SLL   = 6'b000000;
    localparam R_Type_SRL   = 6'b000010;
    localparam R_Type_SRA   = 6'b000011;
    localparam R_Type_SLLV  = 6'b000100;
    localparam R_Type_SRLV  = 6'b000110;
    localparam R_Type_SRAV  = 6'b000111;
    localparam R_Type_JR    = 6'b001000;
    localparam R_Type_ADD   = 6'b100000;
    localparam R_Type_ADDU  = 6'b100001;
    localparam R_Type_SUB   = 6'b100010;
    localparam R_Type_SUBU  = 6'b100011;
    localparam R_Type_AND   = 6'b100100;
    localparam R_Type_OR    = 6'b100101;
    localparam R_Type_XOR   = 6'b100110;
    localparam R_Type_NOR   = 6'b100111;
    localparam R_Type_SLT   = 6'b101010;
    localparam I_Type_ADDI  = 6'b001000;
    localparam I_Type_SLTI  = 6'b001010;
    localparam I_Type_ANDI  = 6'b001100;
    localparam I_Type_ORI   = 6'b001101; 
    localparam I_Type_XORI  = 6'b001110;
    localparam I_Type_LUI   = 6'b001111;
    
    always @ * 
    begin
        case (alu_op) 
			2'b00: 
                if (opcode != HALT) // NOT HALT
				begin
					select = 4'b0010;    // LW - SW - JAL
				end
				else
				begin
				    select = 4'b1111;   // HALT
				end
			2'b01: 
				begin
					select = 4'b0110;            // BEQ - BNE
				end
			2'b10:                       //R-Type
				begin
					case (funct)
						R_Type_SLL:
							begin
								select = 4'b0011;   // R sll
							end
                        R_Type_SRL:
							begin
								select = 4'b0100;   // R srl
							end
						R_Type_SRA:
							begin
								select = 4'b0101;   // R sra
							end
                        R_Type_SLLV: 
							begin
								select = 4'b1100;   // R sllv
							end
                        R_Type_SRLV: 
							begin
								select = 4'b1101;   // R srlv
							end
                        R_Type_SRAV: 
							begin
								select = 4'b1110;   // R srav
							end
                        R_Type_JR: 
							begin
								select = 4'b0010;   // R jr
							end
//                        6'b001001:
//							begin
//								select = 3'bxxx;   // R jalr
//							end
						R_Type_ADD: 
							begin
								select = 4'b0010;   // R add
							end
                        R_Type_ADDU:
							begin
								select = 4'b0010;   // R addu
							end
						R_Type_SUB: 
							begin
								select = 4'b0110;   // R sub
							end
                        R_Type_SUBU:
							begin
								select = 4'b0110;   // R subu
							end
						R_Type_AND: 
							begin
								select = 4'b0000;   // R and
							end
						R_Type_OR: 
							begin
								select = 4'b0001;   // R or
							end
                        R_Type_XOR:
							begin
								select = 4'b1010;   // R xor
							end
                        R_Type_NOR:
							begin
								select = 4'b1011;   // R nor
							end
						R_Type_SLT: 
							begin
								select = 4'b0111;   // R slt
							end
						default:
						    begin
                                select = 4'bx011;   // Invalid input						  
						    end
					endcase
				end
			2'b11:
                begin
                    case(opcode)    // I-type
                        I_Type_ADDI:  // ADDI
                            begin
                                select = 4'b0010;
                            end
                        I_Type_SLTI:  // SLTI
                            begin
                                select = 4'b0111;
                            end
                        I_Type_ANDI:  // ANDI
                            begin
                                select = 4'b0000;
                            end
                        I_Type_ORI:  // ORI
                            begin
                                select = 4'b0001;
                            end
                        I_Type_XORI:  // XORI
                            begin
                                select = 4'b1010;
                            end
                        I_Type_LUI:  // LUI
                            begin
                                select = 4'b1001;
                            end
//                        6'b100000:  // LB
//                            begin
//                                select = 4'bxxxx;
//                            end
//                        6'b100001:  // LH
//                            begin
//                                select = 4'bxxxx;
//                            end
//                        6'b100100:  // LBU
//                            begin
//                                select = 4'bxxxx;
//                            end
//                        6'b100101:  // LHU
//                            begin
//                                select = 4'bxxxx;
//                            end
//                        6'b100111:  // LWU
//                            begin
//                                select = 4'bxxxx;
//                            end
//                        6'b101000:  // SB
//                            begin
//                                select = 4'bxxxx;
//                            end
//                        6'b101001:  // SH
//                            begin
//                                select = 4'bxxxx;
//                            end
                        default:
                            begin
                                select = 4'bxxxx;
                            end
		              endcase
                end
            endcase
       end
endmodule
