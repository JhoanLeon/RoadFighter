
//=======================================================
//  MODULE Definition
//=======================================================

module SC_REGSHIFTER_CAR #(parameter RegSHIFTER_DATAWIDTH=8)
(
	//////////// OUTPUTS //////////
	SC_REGSHIFTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_REGSHIFTER_CLOCK_50,
	SC_REGSHIFTER_RESET_InLow,
	SC_REGSHIFTER_clear_InLow, 
	SC_REGSHIFTER_load_InLow,
	SC_REGSHIFTER_shift_InBus
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

output wire	[RegSHIFTER_DATAWIDTH-1:0]	SC_REGSHIFTER_data_OutBUS;
input		SC_REGSHIFTER_CLOCK_50;
input		SC_REGSHIFTER_RESET_InLow;
input		SC_REGSHIFTER_clear_InLow;
input		SC_REGSHIFTER_load_InLow;	
input		[1:0] SC_REGSHIFTER_shift_InBus;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Register;
reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Signal;

//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_REGSHIFTER_clear_InLow == 1'b0)
		RegSHIFTER_Signal = 8'b00000000;
	else if (SC_REGSHIFTER_load_InLow == 1'b0)
		RegSHIFTER_Signal = 8'b00010000;
	else if (SC_REGSHIFTER_shift_InBus == 2'b01 && RegSHIFTER_Register != 8'b01000000) //Shift Left
		RegSHIFTER_Signal = RegSHIFTER_Register << 1'b1;   
	else if (SC_REGSHIFTER_shift_InBus == 2'b10 && RegSHIFTER_Register != 8'b00000010) //Shift Right
		RegSHIFTER_Signal = RegSHIFTER_Register >> 1'b1;   
	else
		RegSHIFTER_Signal = RegSHIFTER_Register;
	end
	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_REGSHIFTER_CLOCK_50, negedge SC_REGSHIFTER_RESET_InLow)
begin
	if (SC_REGSHIFTER_RESET_InLow == 1'b0)
		RegSHIFTER_Register <= 8'b00000000;
	else
		RegSHIFTER_Register <= RegSHIFTER_Signal;
end

//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_REGSHIFTER_data_OutBUS = RegSHIFTER_Register;

endmodule
