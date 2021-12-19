
//=======================================================
//  MODULE Definition
//=======================================================

module CC_JOINER
(

CC_JOINER_car_fila0_bus_in,

CC_JOINER_environment_fila7_bus_in,
CC_JOINER_environment_fila6_bus_in,
CC_JOINER_environment_fila5_bus_in,
CC_JOINER_environment_fila4_bus_in,
CC_JOINER_environment_fila3_bus_in,
CC_JOINER_environment_fila2_bus_in,
CC_JOINER_environment_fila1_bus_in,
CC_JOINER_environment_fila0_bus_in,

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

input [7:0] CC_JOINER_car_fila0_bus_in;

input [7:0] CC_JOINER_environment_fila7_bus_in;
input [7:0] CC_JOINER_environment_fila6_bus_in;
input [7:0] CC_JOINER_environment_fila5_bus_in;
input [7:0] CC_JOINER_environment_fila4_bus_in;
input [7:0] CC_JOINER_environment_fila3_bus_in;
input [7:0] CC_JOINER_environment_fila2_bus_in;
input [7:0] CC_JOINER_environment_fila1_bus_in;
input [7:0] CC_JOINER_environment_fila0_bus_in;

output wire[7:0] CC_JOINER_fila7_bus_out;
output wire[7:0] CC_JOINER_fila6_bus_out;
output wire[7:0] CC_JOINER_fila5_bus_out;
output wire[7:0] CC_JOINER_fila4_bus_out;
output wire[7:0] CC_JOINER_fila3_bus_out;
output wire[7:0] CC_JOINER_fila2_bus_out;
output wire[7:0] CC_JOINER_fila1_bus_out;
output wire[7:0] CC_JOINER_fila0_bus_out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

assign CC_JOINER_fila0_bus_out = CC_JOINER_car_fila0_bus_in ^ CC_JOINER_environment_fila0_bus_in;
 
assign CC_JOINER_fila1_bus_out = CC_JOINER_environment_fila1_bus_in;
assign CC_JOINER_fila2_bus_out = CC_JOINER_environment_fila2_bus_in;
assign CC_JOINER_fila3_bus_out = CC_JOINER_environment_fila3_bus_in;
assign CC_JOINER_fila4_bus_out = CC_JOINER_environment_fila4_bus_in;
assign CC_JOINER_fila5_bus_out = CC_JOINER_environment_fila5_bus_in;
assign CC_JOINER_fila6_bus_out = CC_JOINER_environment_fila6_bus_in;
assign CC_JOINER_fila7_bus_out = CC_JOINER_environment_fila7_bus_in;

endmodule
