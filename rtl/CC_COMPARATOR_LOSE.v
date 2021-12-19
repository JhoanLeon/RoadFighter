
//=======================================================
//  MODULE Definition
//=======================================================

module CC_COMPARATOR_LOSE
(

CC_COMPARATOR_LOSE_BusJoined,
CC_COMPARATOR_LOSE_BusNorm,

CC_COMPARATOR_LOSE_loseout

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input wire[7:0] CC_COMPARATOR_LOSE_BusJoined;
input wire[7:0] CC_COMPARATOR_LOSE_BusNorm;

output wire CC_COMPARATOR_LOSE_loseout;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg lose_signal;

//=======================================================
//  Structural coding
//=======================================================

always @(*)
begin
	if (CC_COMPARATOR_LOSE_BusJoined < CC_COMPARATOR_LOSE_BusNorm)
		lose_signal = 1'b0;
	else
		lose_signal = 1'b1;
end

assign CC_COMPARATOR_LOSE_loseout = lose_signal;

endmodule
