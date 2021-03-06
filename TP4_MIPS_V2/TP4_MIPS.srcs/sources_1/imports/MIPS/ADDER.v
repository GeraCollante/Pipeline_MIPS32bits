`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:       Universidad Nacional de Cordoba
// Engineer:		Gerardo Collante
//                Nicolas Quinteros Castilla
//
// Create Date:   15:03:00 10/24/2016
// Module Name:   ADDER
// Project Name:  MIPS
// Description:   The ADDER module in the MIPS EXECUTE stage.
//
// Dependencies:  None
//
////////////////////////////////////////////////////////////////////////////////

module ADDER(
    input [31:0] add_in1, 
    input [31:0] add_in2, 
    output [31:0] add_out);
	assign add_out = add_in1 + add_in2;
endmodule