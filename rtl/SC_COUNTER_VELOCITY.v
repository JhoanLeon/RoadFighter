
//=======================================================
//  MODULE Definition
//=======================================================

module SC_COUNTER_VELOCITY
(

SC_COUNTER_VELOCITY_CLOCK_50,
SC_COUNTER_VELOCITY_RESET_InLow,
SC_COUNTER_VELOCITY_ENABLE_InLow,
SC_COUNTER_VELOCITY_SELECTIONVEL_InBus,

SC_COUNTER_VELOCITY_COUNT_Out

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input SC_COUNTER_VELOCITY_CLOCK_50;
input SC_COUNTER_VELOCITY_RESET_InLow;
input SC_COUNTER_VELOCITY_ENABLE_InLow;
input[1:0] SC_COUNTER_VELOCITY_SELECTIONVEL_InBus;

output wire SC_COUNTER_VELOCITY_COUNT_Out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire count_velocidad1;
wire count_velocidad2;
wire count_velocidad3;

//=======================================================
//  Structural coding
//=======================================================

SC_COUNTER_VEL1 SC_COUNTER_VEL1_u0
(

.SC_COUNTER_CLOCK_50(SC_COUNTER_VELOCITY_CLOCK_50),
.SC_COUNTER_RESET_InLow(SC_COUNTER_VELOCITY_RESET_InLow),
.SC_COUNTER_count_InLow(SC_COUNTER_VELOCITY_ENABLE_InLow),
	
.SC_COUNTER_eoc_OutLow(count_velocidad1)

);


SC_COUNTER_VEL2 SC_COUNTER_VEL2_u0
(

.SC_COUNTER_CLOCK_50(SC_COUNTER_VELOCITY_CLOCK_50),
.SC_COUNTER_RESET_InLow(SC_COUNTER_VELOCITY_RESET_InLow),
.SC_COUNTER_count_InLow(SC_COUNTER_VELOCITY_ENABLE_InLow),
	
.SC_COUNTER_eoc_OutLow(count_velocidad2)

);


SC_COUNTER_VEL3 SC_COUNTER_VEL3_u0
(

.SC_COUNTER_CLOCK_50(SC_COUNTER_VELOCITY_CLOCK_50),
.SC_COUNTER_RESET_InLow(SC_COUNTER_VELOCITY_RESET_InLow),
.SC_COUNTER_count_InLow(SC_COUNTER_VELOCITY_ENABLE_InLow),
	
.SC_COUNTER_eoc_OutLow(count_velocidad3)

);

assign SC_COUNTER_VELOCITY_COUNT_Out = (SC_COUNTER_VELOCITY_SELECTIONVEL_InBus == 2'b01)?count_velocidad1:
													(SC_COUNTER_VELOCITY_SELECTIONVEL_InBus == 2'b10)?count_velocidad2:
													(SC_COUNTER_VELOCITY_SELECTIONVEL_InBus == 2'b11)?count_velocidad3:
																													  count_velocidad1;

endmodule
