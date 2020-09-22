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
    
    always @ * 
    begin
        case (alu_op) 
			2'b00: 
                if (opcode != 6'b111111) // NOT HALT
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
						6'b000000:
							begin
								select = 4'b0011;   // R sll
							end
                        6'b000010:
							begin
								select = 4'b0100;   // R srl
							end
						6'b000011:
							begin
								select = 4'b0101;   // R sra
							end
                        6'b000100: 
							begin
								select = 4'b1100;   // R sllv
							end
                        6'b000110: 
							begin
								select = 4'b1101;   // R srlv
							end
                        6'b000111: 
							begin
								select = 4'b1110;   // R srav
							end
                        6'b001000: 
							begin
								select = 4'b0010;   // R jr
							end
//                        6'b001001:
//							begin
//								select = 3'bxxx;   // R jalr
//							end
						6'b100000: 
							begin
								select = 4'b0010;   // R add
							end
                        6'b100001:
							begin
								select = 4'b0010;   // R addu
							end
						6'b100010: 
							begin
								select = 4'b0110;   // R sub
							end
                        6'b100011:
							begin
								select = 4'b0110;   // R subu
							end
						6'b100100: 
							begin
								select = 4'b0000;   // R and
							end
						6'b100101: 
							begin
								select = 4'b0001;   // R or
							end
                        6'b100110:
							begin
								select = 4'b1010;   // R xor
							end
                        6'b100111:
							begin
								select = 4'b1011;   // R nor
							end
						6'b101010: 
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
                        6'b001000:  // ADDI
                            begin
                                select = 4'b0010;
                            end
                        6'b001010:  // SLTI
                            begin
                                select = 4'b0111;
                            end
                        6'b001100:  // ANDI
                            begin
                                select = 4'b0000;
                            end
                        6'b001101:  // ORI
                            begin
                                select = 4'b0001;
                            end
                        6'b001110:  // XORI
                            begin
                                select = 4'b1010;
                            end
                        6'b001111:  // LUI
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
