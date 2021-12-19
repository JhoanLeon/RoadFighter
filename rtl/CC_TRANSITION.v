
//=======================================================
//  MODULE Definition
//=======================================================

module CC_TRANSITION
(

transition_statemachine_ctrl,

transition_fila7_bus_out,
transition_fila6_bus_out,
transition_fila5_bus_out,
transition_fila4_bus_out,
transition_fila3_bus_out,
transition_fila2_bus_out,
transition_fila1_bus_out,
transition_fila0_bus_out

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [2:0] transition_statemachine_ctrl;

output [7:0] transition_fila7_bus_out;
output [7:0] transition_fila6_bus_out;
output [7:0] transition_fila5_bus_out;
output [7:0] transition_fila4_bus_out;
output [7:0] transition_fila3_bus_out;
output [7:0] transition_fila2_bus_out;
output [7:0] transition_fila1_bus_out;
output [7:0] transition_fila0_bus_out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

assign transition_fila7_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00100000:
(transition_statemachine_ctrl == 3'b001)?8'b01100110:
(transition_statemachine_ctrl == 3'b010)?8'b10000001:
(transition_statemachine_ctrl == 3'b011)?8'b11111111:
(transition_statemachine_ctrl == 3'b100)?8'b11111111:
(transition_statemachine_ctrl == 3'b101)?8'b11111111:
(transition_statemachine_ctrl == 3'b110)?8'b11111111:
													  8'b00000000;
															  
assign transition_fila6_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00110000:
(transition_statemachine_ctrl == 3'b001)?8'b10011001:
(transition_statemachine_ctrl == 3'b010)?8'b01000010:
(transition_statemachine_ctrl == 3'b011)?8'b01111110:
(transition_statemachine_ctrl == 3'b100)?8'b00011000:
(transition_statemachine_ctrl == 3'b101)?8'b01100110:
(transition_statemachine_ctrl == 3'b110)?8'b01011010:
													  8'b00000000;

assign transition_fila5_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00111000:
(transition_statemachine_ctrl == 3'b001)?8'b10001001:
(transition_statemachine_ctrl == 3'b010)?8'b00100100:
(transition_statemachine_ctrl == 3'b011)?8'b00111100:
(transition_statemachine_ctrl == 3'b100)?8'b00011000:
(transition_statemachine_ctrl == 3'b101)?8'b01100110:
(transition_statemachine_ctrl == 3'b110)?8'b01011010:
													  8'b00000000;

assign transition_fila4_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00111100:
(transition_statemachine_ctrl == 3'b001)?8'b10001001:
(transition_statemachine_ctrl == 3'b010)?8'b00011000:
(transition_statemachine_ctrl == 3'b011)?8'b00011000:
(transition_statemachine_ctrl == 3'b100)?8'b00011000:
(transition_statemachine_ctrl == 3'b101)?8'b01100110:
(transition_statemachine_ctrl == 3'b110)?8'b01011010:
													  8'b00000000;

assign transition_fila3_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00111100:
(transition_statemachine_ctrl == 3'b001)?8'b10111001:
(transition_statemachine_ctrl == 3'b010)?8'b00011000:
(transition_statemachine_ctrl == 3'b011)?8'b00011000:
(transition_statemachine_ctrl == 3'b100)?8'b00011000:
(transition_statemachine_ctrl == 3'b101)?8'b01100110:
(transition_statemachine_ctrl == 3'b110)?8'b01011010:
													  8'b00000000;

assign transition_fila2_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00111000:
(transition_statemachine_ctrl == 3'b001)?8'b10011001:
(transition_statemachine_ctrl == 3'b010)?8'b00100100:
(transition_statemachine_ctrl == 3'b011)?8'b00011000:
(transition_statemachine_ctrl == 3'b100)?8'b00011000:
(transition_statemachine_ctrl == 3'b101)?8'b01100110:
(transition_statemachine_ctrl == 3'b110)?8'b01011010:
													  8'b00000000;

assign transition_fila1_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00110000:
(transition_statemachine_ctrl == 3'b001)?8'b10011001:
(transition_statemachine_ctrl == 3'b010)?8'b01000010:
(transition_statemachine_ctrl == 3'b011)?8'b00111100:
(transition_statemachine_ctrl == 3'b100)?8'b00011000:
(transition_statemachine_ctrl == 3'b101)?8'b01100110:
(transition_statemachine_ctrl == 3'b110)?8'b01011010:
													  8'b00000000;
															  
assign transition_fila0_bus_out = 
(transition_statemachine_ctrl == 3'b000)?8'b00100000:
(transition_statemachine_ctrl == 3'b001)?8'b01100110:
(transition_statemachine_ctrl == 3'b010)?8'b10000001:
(transition_statemachine_ctrl == 3'b011)?8'b11111111:
(transition_statemachine_ctrl == 3'b100)?8'b11111111:
(transition_statemachine_ctrl == 3'b101)?8'b11111111:
(transition_statemachine_ctrl == 3'b110)?8'b11111111:
													  8'b00000000;

endmodule
