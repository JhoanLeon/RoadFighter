
//=======================================================
//  MODULE Definition
//=======================================================

module SC_COUNTER_TRANSITION #(parameter COUNTER_DATAWIDTH_BUS=27)
(
//////////// INPUTS //////////
	SC_COUNTER_CLOCK_50,
	SC_COUNTER_RESET_InLow,
	SC_COUNTER_count_InLow,
	//////////// OUTPUTS //////////
	SC_COUNTER_eoc_OutLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output   reg SC_COUNTER_eoc_OutLow;
	input		SC_COUNTER_CLOCK_50;
	input		SC_COUNTER_RESET_InLow;
	input 	SC_COUNTER_count_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [COUNTER_DATAWIDTH_BUS-1:0] COUNTER_Register;
	reg [COUNTER_DATAWIDTH_BUS-1:0] COUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)
	if (SC_COUNTER_count_InLow == 1'b1)	
		COUNTER_Signal = 0;
	else 
		COUNTER_Signal = COUNTER_Register + 1'b1;

		// REGISTER : SEQUENTIAL
	always @ ( posedge SC_COUNTER_CLOCK_50 , negedge SC_COUNTER_RESET_InLow)
	if (SC_COUNTER_RESET_InLow == 1'b0)
		COUNTER_Register <= 0;
	else
		COUNTER_Register <= COUNTER_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
	always @ (*)
		if (COUNTER_Register== 27'b111111111111111111111111111)
			SC_COUNTER_eoc_OutLow = 1'b0;
		else
			SC_COUNTER_eoc_OutLow = 1'b1;
endmodule
