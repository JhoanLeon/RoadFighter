
//=======================================================
//  MODULE Definition
//=======================================================

module SC_GENERATOR_ENVIRONMENT
(

SC_GENERATOR_ENVIRONMENT_CLOCK_50,
SC_GENERATOR_ENVIRONMENT_RESET_InLow,
SC_GENERATOR_ENVIRONMENT_START_InLow,
SC_GENERATOR_ENVIRONMENT_LEVEL_InBus,
SC_GENERATOR_ENVIRONMENT_DOWN_InLow,

SC_GENERATOR_ENVIRONMENT_Data_OutBus

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input SC_GENERATOR_ENVIRONMENT_CLOCK_50;
input SC_GENERATOR_ENVIRONMENT_RESET_InLow;
input SC_GENERATOR_ENVIRONMENT_START_InLow;
input SC_GENERATOR_ENVIRONMENT_DOWN_InLow;
input[1:0] SC_GENERATOR_ENVIRONMENT_LEVEL_InBus;

output wire[7:0] SC_GENERATOR_ENVIRONMENT_Data_OutBus;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire selection_machine;
wire[7:0] rnd_wire;

//=======================================================
//  Structural coding
//=======================================================

SC_STATEMACHINE_RANDOM SC_STATEMACHINE_RANDOM_u0
(

.SC_STATEMACHINE_RANDOM_CLOCK_50(SC_GENERATOR_ENVIRONMENT_CLOCK_50),
.SC_STATEMACHINE_RANDOM_RESET_InLow(SC_GENERATOR_ENVIRONMENT_RESET_InLow),
.SC_STATEMACHINE_RANDOM_START_InLow(SC_GENERATOR_ENVIRONMENT_START_InLow),
.SC_STATEMACHINE_RANDOM_DOWN_InLow(SC_GENERATOR_ENVIRONMENT_DOWN_InLow),
.SC_STATEMACHINE_RANDOM_LEVEL_InLow(SC_GENERATOR_ENVIRONMENT_LEVEL_InBus),
	
.SC_STATEMACHINE_RANDOM_SELECTION(selection_machine)

);

Random1 Random1_u0 
(
    
.clock(SC_GENERATOR_ENVIRONMENT_CLOCK_50),
.reset(~SC_GENERATOR_ENVIRONMENT_RESET_InLow),
.rnd(rnd_wire) 

);

assign SC_GENERATOR_ENVIRONMENT_Data_OutBus = (selection_machine == 1'b1)?rnd_wire:
																								  8'b00000000; 

endmodule

