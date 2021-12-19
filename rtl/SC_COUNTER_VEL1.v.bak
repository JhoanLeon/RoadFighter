//****************************************
// Code taken from book: FPGA PROTOTYPING BY VERILOG EXAMPLES - Pong P. Chu
// Adapted by: Jhoan Esteban León
//****************************************

//=======================================================
//  MODULE Definition
//=======================================================

module SC_COUNTER #(parameter N=10)
(

	//////////// INPUTS //////////
	input wire SC_COUNTER_CLOCK,
	input wire SC_COUNTER_RESET_InLow,
	
	input wire SC_COUNTER_ENABLE,
	
	//////////// OUTPUTS ////////// 
	output wire [N-1:0] SC_COUNTER_REGCOUNT, //Output bus for count
	output wire SC_COUNTER_ENDCOUNT //Output flag for end of count

);

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [N-1:0] R_Register; //Registers for sequential part of counter
reg [N-1:0] R_Next;

//=======================================================
//  Structural coding
//=======================================================


//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_COUNTER_ENABLE == 1'b0)
		R_Next = R_Register + 1'b1;
	else
		R_Next = R_Register;
end


//STATE REGISTER: SEQUENTIAL
always @(posedge SC_COUNTER_CLOCK, negedge SC_COUNTER_RESET_InLow)
	if (SC_COUNTER_RESET_InLow == 1'b0)
		R_Register <= 10'b0000000000;
	else
		R_Register <= R_Next;


//OUTPUT LOGIC: COMBINATIONAL
assign SC_COUNTER_REGCOUNT = R_Register;
assign SC_COUNTER_ENDCOUNT = (R_Register == 2**N - 1)? 1'b1 : 1'b0;
//assign CC_COUNTER_ENDCOUNT = (R_Register == 8'b00001111)? 1'b1 : 1'b0; //Alternative form to comparate output


endmodule
