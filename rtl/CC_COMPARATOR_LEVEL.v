
//=======================================================
//  MODULE Definition
//=======================================================

module CC_COMPARATOR_LEVEL
(

CC_COMPARATOR_LEVEL_BusIn,
CC_COMPARATOR_LEVEL_OutBus

);

//=======================================================
//  PARAMETER declarations
//=======================================================

input[7:0] CC_COMPARATOR_LEVEL_BusIn;

output reg[1:0] CC_COMPARATOR_LEVEL_OutBus;  

//=======================================================
//  PORT declarations
//=======================================================

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

always @(*)
begin

	if (CC_COMPARATOR_LEVEL_BusIn > 8'd30)
		CC_COMPARATOR_LEVEL_OutBus = 2'b11;
	else if (CC_COMPARATOR_LEVEL_BusIn > 8'd10)
		CC_COMPARATOR_LEVEL_OutBus = 2'b10;
	else 
		CC_COMPARATOR_LEVEL_OutBus = 2'b01;
	
end

endmodule
