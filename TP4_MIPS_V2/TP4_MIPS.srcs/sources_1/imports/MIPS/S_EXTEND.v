`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:       Universidad Nacional de Cordoba
// Engineer:		Gerardo Collante
//                Nicolas Quinteros Castilla
//
// Create Date:   11:05:10 10/17/2016
// Module Name:   S_EXTEND
// Project Name:  MIPS 
// Description:   Sign extender.
//
// Dependencies:  None
//
////////////////////////////////////////////////////////////////////////////////

module S_EXTEND
#(
    // Parameters.
    parameter   IN_SIZE = 16,
    parameter   OUT_SIZE = 32
)
(   input   [(IN_SIZE - 1):0]   din,
    output  [(OUT_SIZE - 1):0]  dout);
//    parameter IN_SIZE = 16;
//	parameter OUT_SIZE = 32;
	assign dout[(OUT_SIZE - 1):0] = { { IN_SIZE{din[(IN_SIZE - 1)]} }, din[(IN_SIZE - 1):0] };
endmodule
