
//=======================================================
//  MODULE Definition
//=======================================================

module CC_SELECTOR_SCREEN
(

selector_mux_screen,

selector_transition_fila7_bus_in,
selector_transition_fila6_bus_in,
selector_transition_fila5_bus_in,
selector_transition_fila4_bus_in,
selector_transition_fila3_bus_in,
selector_transition_fila2_bus_in,
selector_transition_fila1_bus_in,
selector_transition_fila0_bus_in,

selector_joiner_fila7_bus_in,
selector_joiner_fila6_bus_in,
selector_joiner_fila5_bus_in,
selector_joiner_fila4_bus_in,
selector_joiner_fila3_bus_in,
selector_joiner_fila2_bus_in,
selector_joiner_fila1_bus_in,
selector_joiner_fila0_bus_in,

selector_img_fila7_bus_out,
selector_img_fila6_bus_out,
selector_img_fila5_bus_out,
selector_img_fila4_bus_out,
selector_img_fila3_bus_out,
selector_img_fila2_bus_out,
selector_img_fila1_bus_out,
selector_img_fila0_bus_out

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input selector_mux_screen;

input [7:0] selector_transition_fila7_bus_in;
input [7:0] selector_transition_fila6_bus_in;
input [7:0] selector_transition_fila5_bus_in;
input [7:0] selector_transition_fila4_bus_in;
input [7:0] selector_transition_fila3_bus_in;
input [7:0] selector_transition_fila2_bus_in;
input [7:0] selector_transition_fila1_bus_in;
input [7:0] selector_transition_fila0_bus_in;

input [7:0] selector_joiner_fila7_bus_in;
input [7:0] selector_joiner_fila6_bus_in;
input [7:0] selector_joiner_fila5_bus_in;
input [7:0] selector_joiner_fila4_bus_in;
input [7:0] selector_joiner_fila3_bus_in;
input [7:0] selector_joiner_fila2_bus_in;
input [7:0] selector_joiner_fila1_bus_in;
input [7:0] selector_joiner_fila0_bus_in;

output [7:0] selector_img_fila7_bus_out;
output [7:0] selector_img_fila6_bus_out;
output [7:0] selector_img_fila5_bus_out;
output [7:0] selector_img_fila4_bus_out;
output [7:0] selector_img_fila3_bus_out;
output [7:0] selector_img_fila2_bus_out;
output [7:0] selector_img_fila1_bus_out;
output [7:0] selector_img_fila0_bus_out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

//assign selector_img_fila7_bus_out = (selector_mux_screen == 0)?selector_joiner_fila7_bus_in://{1'b1, selector_joiner_fila7_bus_in[6:1], 1'b1}:
//																               selector_transition_fila7_bus_in;
//
//assign selector_img_fila6_bus_out = (selector_mux_screen == 0)?selector_joiner_fila6_bus_in://{1'b1, selector_joiner_fila6_bus_in[6:1], 1'b1}:
//																               selector_transition_fila6_bus_in;
//																					
//assign selector_img_fila5_bus_out = (selector_mux_screen == 0)?selector_joiner_fila5_bus_in://{1'b1, selector_joiner_fila5_bus_in[6:1], 1'b1}:
//																               selector_transition_fila5_bus_in;
//
//assign selector_img_fila4_bus_out = (selector_mux_screen == 0)?selector_joiner_fila4_bus_in://{1'b1, selector_joiner_fila4_bus_in[6:1], 1'b1}:
//																               selector_transition_fila4_bus_in;
//
//assign selector_img_fila3_bus_out = (selector_mux_screen == 0)?selector_joiner_fila3_bus_in://{1'b1, selector_joiner_fila3_bus_in[6:1], 1'b1}:
//																               selector_transition_fila3_bus_in;
//
//assign selector_img_fila2_bus_out = (selector_mux_screen == 0)?selector_joiner_fila2_bus_in://{1'b1, selector_joiner_fila2_bus_in[6:1], 1'b1}:
//																               selector_transition_fila2_bus_in;
//
//assign selector_img_fila1_bus_out = (selector_mux_screen == 0)?selector_joiner_fila1_bus_in://{1'b1, selector_joiner_fila1_bus_in[6:1], 1'b1}:
//																               selector_transition_fila1_bus_in;
//																					
//assign selector_img_fila0_bus_out = (selector_mux_screen == 0)?selector_joiner_fila0_bus_in://{1'b1, selector_joiner_fila0_bus_in[6:1], 1'b1}:
//																               selector_transition_fila0_bus_in;	

assign selector_img_fila7_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila7_bus_in[6:1], 1'b1}:
																               selector_transition_fila7_bus_in;

assign selector_img_fila6_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila6_bus_in[6:1], 1'b1}:
																               selector_transition_fila6_bus_in;
																					
assign selector_img_fila5_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila5_bus_in[6:1], 1'b1}:
																               selector_transition_fila5_bus_in;

assign selector_img_fila4_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila4_bus_in[6:1], 1'b1}:
																               selector_transition_fila4_bus_in;

assign selector_img_fila3_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila3_bus_in[6:1], 1'b1}:
																               selector_transition_fila3_bus_in;

assign selector_img_fila2_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila2_bus_in[6:1], 1'b1}:
																               selector_transition_fila2_bus_in;

assign selector_img_fila1_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila1_bus_in[6:1], 1'b1}:
																               selector_transition_fila1_bus_in;
																					
assign selector_img_fila0_bus_out = (selector_mux_screen == 0)?{1'b1, selector_joiner_fila0_bus_in[6:1], 1'b1}:
																               selector_transition_fila0_bus_in;																				

endmodule
