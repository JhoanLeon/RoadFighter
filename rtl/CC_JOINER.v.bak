
//=======================================================
//  MODULE Definition
//=======================================================

module CC_JOINER
(

CC_JOINER_shoot_fila7_bus_in,
CC_JOINER_shoot_fila6_bus_in,
CC_JOINER_shoot_fila5_bus_in,
CC_JOINER_shoot_fila4_bus_in,
CC_JOINER_shoot_fila3_bus_in,
CC_JOINER_shoot_fila2_bus_in,
CC_JOINER_shoot_fila1_bus_in,
CC_JOINER_nave_fila0_bus_in,

CC_JOINER_aliens_fila7_bus_in,
CC_JOINER_aliens_fila6_bus_in,
CC_JOINER_aliens_fila5_bus_in,
CC_JOINER_aliens_fila4_bus_in,
CC_JOINER_aliens_fila3_bus_in,
CC_JOINER_aliens_fila2_bus_in,
CC_JOINER_aliens_fila1_bus_in,
CC_JOINER_aliens_fila0_bus_in,

CC_JOINER_fila7_bus_out,
CC_JOINER_fila6_bus_out,
CC_JOINER_fila5_bus_out,
CC_JOINER_fila4_bus_out,
CC_JOINER_fila3_bus_out,
CC_JOINER_fila2_bus_out,
CC_JOINER_fila1_bus_out,
CC_JOINER_fila0_bus_out

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [7:0] CC_JOINER_shoot_fila7_bus_in;
input [7:0] CC_JOINER_shoot_fila6_bus_in;
input [7:0] CC_JOINER_shoot_fila5_bus_in;
input [7:0] CC_JOINER_shoot_fila4_bus_in;
input [7:0] CC_JOINER_shoot_fila3_bus_in;
input [7:0] CC_JOINER_shoot_fila2_bus_in;
input [7:0] CC_JOINER_shoot_fila1_bus_in;
input [7:0] CC_JOINER_nave_fila0_bus_in;

input [7:0] CC_JOINER_aliens_fila7_bus_in;
input [7:0] CC_JOINER_aliens_fila6_bus_in;
input [7:0] CC_JOINER_aliens_fila5_bus_in;
input [7:0] CC_JOINER_aliens_fila4_bus_in;
input [7:0] CC_JOINER_aliens_fila3_bus_in;
input [7:0] CC_JOINER_aliens_fila2_bus_in;
input [7:0] CC_JOINER_aliens_fila1_bus_in;
input [7:0] CC_JOINER_aliens_fila0_bus_in;

output [7:0] CC_JOINER_fila7_bus_out;
output [7:0] CC_JOINER_fila6_bus_out;
output [7:0] CC_JOINER_fila5_bus_out;
output [7:0] CC_JOINER_fila4_bus_out;
output [7:0] CC_JOINER_fila3_bus_out;
output [7:0] CC_JOINER_fila2_bus_out;
output [7:0] CC_JOINER_fila1_bus_out;
output [7:0] CC_JOINER_fila0_bus_out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

assign CC_JOINER_fila0_bus_out = 
CC_JOINER_nave_fila0_bus_in ^ CC_JOINER_aliens_fila0_bus_in;
 
assign CC_JOINER_fila1_bus_out = 
CC_JOINER_shoot_fila1_bus_in ^ CC_JOINER_aliens_fila1_bus_in;

assign CC_JOINER_fila2_bus_out = 
CC_JOINER_shoot_fila2_bus_in ^ CC_JOINER_aliens_fila2_bus_in;

assign CC_JOINER_fila3_bus_out = 
CC_JOINER_shoot_fila3_bus_in ^ CC_JOINER_aliens_fila3_bus_in;

assign CC_JOINER_fila4_bus_out = 
CC_JOINER_shoot_fila4_bus_in ^ CC_JOINER_aliens_fila4_bus_in;

assign CC_JOINER_fila5_bus_out = 
CC_JOINER_shoot_fila5_bus_in ^ CC_JOINER_aliens_fila5_bus_in;

assign CC_JOINER_fila6_bus_out = 
CC_JOINER_shoot_fila6_bus_in ^ CC_JOINER_aliens_fila6_bus_in;

assign CC_JOINER_fila7_bus_out = 
CC_JOINER_shoot_fila7_bus_in ^ CC_JOINER_aliens_fila7_bus_in;

endmodule
