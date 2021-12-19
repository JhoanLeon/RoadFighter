
//=======================================================
//  MODULE Definition
//=======================================================

module SI_TRANSITION
(

transition_statemachine_aliens_ctl,

transition_selector_fila7_bus_out,
transition_selector_fila6_bus_out,
transition_selector_fila5_bus_out,
transition_selector_fila4_bus_out,
transition_selector_fila3_bus_out,
transition_selector_fila2_bus_out,
transition_selector_fila1_bus_out,
transition_selector_fila0_bus_out

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [2:0] transition_statemachine_aliens_ctl;

output [7:0] transition_selector_fila7_bus_out;
output [7:0] transition_selector_fila6_bus_out;
output [7:0] transition_selector_fila5_bus_out;
output [7:0] transition_selector_fila4_bus_out;
output [7:0] transition_selector_fila3_bus_out;
output [7:0] transition_selector_fila2_bus_out;
output [7:0] transition_selector_fila1_bus_out;
output [7:0] transition_selector_fila0_bus_out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

assign transition_selector_fila7_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00100000:
(transition_statemachine_aliens_ctl == 3'b010)?8'b11111111:
(transition_statemachine_aliens_ctl == 3'b011)?8'b11111111:
(transition_statemachine_aliens_ctl == 3'b100)?8'b11111111:
(transition_statemachine_aliens_ctl == 3'b101)?8'b01111110:
(transition_statemachine_aliens_ctl == 3'b110)?8'b11111111:
															  8'b00000000;
															  
assign transition_selector_fila6_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00110000:
(transition_statemachine_aliens_ctl == 3'b010)?8'b00011000:
(transition_statemachine_aliens_ctl == 3'b011)?8'b01100110:
(transition_statemachine_aliens_ctl == 3'b100)?8'b01011010:
(transition_statemachine_aliens_ctl == 3'b101)?8'b10000001:
(transition_statemachine_aliens_ctl == 3'b110)?8'b01111110:
															  8'b00000000;

assign transition_selector_fila5_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00111000:
(transition_statemachine_aliens_ctl == 3'b010)?8'b00011000:
(transition_statemachine_aliens_ctl == 3'b011)?8'b01100110:
(transition_statemachine_aliens_ctl == 3'b100)?8'b01011010:
(transition_statemachine_aliens_ctl == 3'b101)?8'b10100101:
(transition_statemachine_aliens_ctl == 3'b110)?8'b00111100:
															  8'b00000000;

assign transition_selector_fila4_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00111100:
(transition_statemachine_aliens_ctl == 3'b010)?8'b00011000:
(transition_statemachine_aliens_ctl == 3'b011)?8'b01100110:
(transition_statemachine_aliens_ctl == 3'b100)?8'b01011010:
(transition_statemachine_aliens_ctl == 3'b101)?8'b10100101:
(transition_statemachine_aliens_ctl == 3'b110)?8'b00011000:
															  8'b00000000;

assign transition_selector_fila3_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00111100:
(transition_statemachine_aliens_ctl == 3'b010)?8'b00011000:
(transition_statemachine_aliens_ctl == 3'b011)?8'b01100110:
(transition_statemachine_aliens_ctl == 3'b100)?8'b01011010:
(transition_statemachine_aliens_ctl == 3'b101)?8'b10000001:
(transition_statemachine_aliens_ctl == 3'b110)?8'b00011000:
															  8'b00000000;

assign transition_selector_fila2_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00111000:
(transition_statemachine_aliens_ctl == 3'b010)?8'b00011000:
(transition_statemachine_aliens_ctl == 3'b011)?8'b01100110:
(transition_statemachine_aliens_ctl == 3'b100)?8'b01011010:
(transition_statemachine_aliens_ctl == 3'b101)?8'b10100101:
(transition_statemachine_aliens_ctl == 3'b110)?8'b00011000:
															  8'b00000000;

assign transition_selector_fila1_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00110000:
(transition_statemachine_aliens_ctl == 3'b010)?8'b00011000:
(transition_statemachine_aliens_ctl == 3'b011)?8'b01100110:
(transition_statemachine_aliens_ctl == 3'b100)?8'b01011010:
(transition_statemachine_aliens_ctl == 3'b101)?8'b11011011:
(transition_statemachine_aliens_ctl == 3'b110)?8'b00111100:
															  8'b00000000;
															  
assign transition_selector_fila0_bus_out = 
(transition_statemachine_aliens_ctl == 3'b001)?8'b00100000:
(transition_statemachine_aliens_ctl == 3'b010)?8'b11111111:
(transition_statemachine_aliens_ctl == 3'b011)?8'b11111111:
(transition_statemachine_aliens_ctl == 3'b100)?8'b11111111:
(transition_statemachine_aliens_ctl == 3'b101)?8'b10000001:
(transition_statemachine_aliens_ctl == 3'b110)?8'b11111111:
															  8'b00000000;

endmodule
