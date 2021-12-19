
//=======================================================
//  MODULE Definition
//=======================================================

module SC_COUNTER_SCORE #(parameter N=8)
(

	//////////// INPUTS //////////
	input wire SC_COUNTER_SCORE_CLOCK,
	input wire SC_COUNTER_SCORE_RESET_InLow,
	
	input wire SC_COUNTER_SCORE_COUNT,
	input wire SC_COUNTER_SCORE_CLEARCOUNT,
	
	//////////// OUTPUTS ////////// 
	output reg[N-1:0] SC_COUNTER_SCORE_REGCOUNT, //Output bus for count
	output wire SC_COUNTER_SCORE_ENDCOUNT //Output flag for end of count

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
	if (SC_COUNTER_SCORE_COUNT == 1'b0)
		R_Next = R_Register + 1'b1;
	else if (SC_COUNTER_SCORE_CLEARCOUNT == 1'b0)
		R_Next = 8'b00000000;
	else
		R_Next = R_Register;
end


//STATE REGISTER: SEQUENTIAL
always @(posedge SC_COUNTER_SCORE_CLOCK, negedge SC_COUNTER_SCORE_RESET_InLow)
	if (SC_COUNTER_SCORE_RESET_InLow == 1'b0)
		R_Register <= 8'b00000000;
	else
		R_Register <= R_Next;


//OUTPUT LOGIC: COMBINATIONAL

always @(*)
begin
	if (R_Register <= 8'd8)
		SC_COUNTER_SCORE_REGCOUNT = 8'b00000000;
	else
		SC_COUNTER_SCORE_REGCOUNT = R_Register - 8'd8;
end

assign SC_COUNTER_SCORE_ENDCOUNT = (R_Register == 8'b01100100)? 1'b0 : 1'b1; //Alternative form to comparate output

endmodule

