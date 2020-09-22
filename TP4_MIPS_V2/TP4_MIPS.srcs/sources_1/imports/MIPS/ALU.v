`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:       Universidad Nacional de Cordoba
// Engineer:		Gerardo Collante
//                Nicolas Quinteros Castilla
//
// Create Date:   15:24:23 10/24/2016
// Module Name:   ALU
// Project Name:  MIPS
// Description:   MIPS ALU module in the EXECUTE stage.
//
// Dependencies:  None
//
////////////////////////////////////////////////////////////////////////////////

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [4:0] shamt,
    input [3:0] control,
    output reg zero,
	output reg [31:0] result);
	
	always @ *
	begin
		case (control)
			4'b0000:
				result = A & B;             // AND
			4'b0001:
				result = A | B;             // OR
			4'b0010:
				result = A + B;             // ADD
			4'b0011:
				result = ( B << shamt);     // SLL
			4'b0100:
				result = ( B >>> shamt);    // SRL
			4'b0101:
				result = ( B >> shamt);     // SRA
			4'b0110:
				result = A - B;             // SUB
			4'b0111:
				result = (A < B) ? 1 : 0;   //SLT
			4'b1001:
				result = (B << 16);         // LUI
			4'b1010:
				result = (A^B);             // XOR
			4'b1011:
				result = ~(A|B);            // NOR
			4'b1100:
				result = A << B;            // SLLV
			4'b1101:
				result = A >>> B;           // SRLV
			4'b1110:
				result = A >> B;            // SRAV
//			4'b1111:
//				result = A + B;
			default:
			    result = {32{1'b0}};
				//result = 32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx;
		endcase
		zero <= result ? 0 : 1;
	end
endmodule
