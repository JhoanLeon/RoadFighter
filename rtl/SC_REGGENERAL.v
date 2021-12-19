//#######/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################

//=======================================================
//  MODULE Definition
//=======================================================

module SC_REGGENERAL #(parameter REGGENERAL_DATAWIDTH=8)
(
	//////////// INPUTS //////////
	SC_REGGENERAL_CLOCK_50,
	SC_REGGENERAL_RESET_InLow,
	SC_REGGENERAL_clear_InLow, 
	SC_REGGENERAL_load_InLow, 
	SC_REGGENERAL_data_InBUS,
	
	//////////// OUTPUTS //////////
	SC_REGGENERAL_data_OutBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output wire[REGGENERAL_DATAWIDTH-1:0]	SC_REGGENERAL_data_OutBUS;
input		SC_REGGENERAL_CLOCK_50;
input		SC_REGGENERAL_RESET_InLow;
input		SC_REGGENERAL_clear_InLow;
input		SC_REGGENERAL_load_InLow;	
input		[REGGENERAL_DATAWIDTH-1:0]	SC_REGGENERAL_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [REGGENERAL_DATAWIDTH-1:0] REGGENERAL_Register;
reg [REGGENERAL_DATAWIDTH-1:0] REGGENERAL_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_REGGENERAL_clear_InLow == 1'b0)
		REGGENERAL_Signal = 8'b00000000;
	else if (SC_REGGENERAL_load_InLow == 1'b0)
		REGGENERAL_Signal = SC_REGGENERAL_data_InBUS;
	else
		REGGENERAL_Signal = REGGENERAL_Register;
	end	
	
	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_REGGENERAL_CLOCK_50, negedge SC_REGGENERAL_RESET_InLow)
begin
	if (SC_REGGENERAL_RESET_InLow == 1'b0)
		REGGENERAL_Register <= 8'b00000000;
	else
		REGGENERAL_Register <= REGGENERAL_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_REGGENERAL_data_OutBUS = REGGENERAL_Register;

endmodule
