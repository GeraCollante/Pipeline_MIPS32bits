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
	
    localparam AND  = 4'b0000;
    localparam OR   = 4'b0001;
    localparam ADD  = 4'b0010;
    localparam SLL  = 4'b0011;
    localparam SRL  = 4'b0100;
    localparam SRA  = 4'b0101;
    localparam SUB  = 4'b0110;
    localparam SLT  = 4'b0111;    
    localparam LUI  = 4'b1001;  
    localparam XOR  = 4'b1010;  
    localparam NOR  = 4'b1011;  
    localparam SLLV = 4'b1100;
    localparam SRLV = 4'b1101;
    localparam SRAV = 4'b1110;
	
	always @ *
	begin
		case (control)
			AND:
				result = A & B;             // AND
			OR:
				result = A | B;             // OR
			ADD:
				result = A + B;             // ADD
			SLL:
				result = ( B << shamt);     // SLL
			SRL:
				result = ( B >>> shamt);    // SRL
			SRA:
				result = ( B >> shamt);     // SRA
			SUB:
				result = A - B;             // SUB
			SLT:
				result = (A < B) ? 1 : 0;   // SLT
			LUI:
				result = (B << 16);         // LUI
			XOR:
				result = (A^B);             // XOR
			NOR:
				result = ~(A|B);            // NOR
			SLLV:
				result = A << B;            // SLLV
			SRLV:
				result = A >>> B;           // SRLV
			SRAV:
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
