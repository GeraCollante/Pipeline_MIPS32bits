`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:       Universidad Nacional de Cordoba
// Engineer:		Gerardo Collante
//
// Create Date:   13:58:06 10/03/2016
// Module Name:   I_FETCH_tb
// Project Name:  MIPS 
// Description:   Testing MIPS FETCH stage implementation in verilog.
//
// Dependencies:  I_FETCH.v
//
////////////////////////////////////////////////////////////////////////////////

module I_FETCH_tb;
	// Delclare inputs.
	reg clk;
	reg rst;
	reg enable;
	reg enable_wr;
	reg PCSrc;
	reg [31:0] EX_MEM_NPC;

	// Declare outputs.
	wire [31:0] IF_ID_IR;  //Instruction register
	wire [31:0] IF_ID_NPC;
	
	// Declare the clock cycle counter.
	reg [4:0] clk_cycle;

	// Instantiate the FETCH stage module.
	I_FETCH fetch(.clk(clk), 
	              .rst(rst),
	              .enable(enable),
	              .enable_wr(enable_wr),
	              .PCSrc(PCSrc), 
	              .EX_MEM_NPC(EX_MEM_NPC), 
		          .IF_ID_IR(IF_ID_IR), 
		          .IF_ID_NPC(IF_ID_NPC));

	initial begin
		// Initialize inputs.
		clk = 0;
		enable = 1;
		PCSrc = 0;
		EX_MEM_NPC = 0;
		
		#90 enable = 0;
		#50 enable = 1;
		
		// Initialize clock cycle counter.
		clk_cycle = 0;
		
		// Terminate.
		#220 $finish;
	end
	
	// Clock.
	initial begin	
		forever begin
			#10 clk = ~clk;
		end
	end
	

	// Increment the cycle counter and display data at the end of each cycle.
	always @ (posedge clk)
	begin
		$display("Cycle Number = %0d\tIF_ID_IR = %h\tIF_ID_NPC = %0d", 
			clk_cycle, IF_ID_IR, IF_ID_NPC);
		#10 clk_cycle = clk_cycle + 1;
	end
endmodule

