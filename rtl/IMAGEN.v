/*
Universidad de los Andes
Departamento Ingeniería Eléctrica y Electrónica
Arquitectura y Diseño de Sistemas Digitales

Módulo imagen FPGA - Max7219

Autor:José Francisco Molano Pulido (jf.molano1587@uniandes.edu.co)
*/

//=======================================================
//  MODULE Definition
//=======================================================
module IMAGEN
(
	img_select_add,
	
	img_fila7_bus_in,
	img_fila6_bus_in,
	img_fila5_bus_in,
	img_fila4_bus_in,
	img_fila3_bus_in,
	img_fila2_bus_in,
	img_fila1_bus_in,
	img_fila0_bus_in,
	
	img_data_max_in
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [7:0]	img_fila7_bus_in;
input	[7:0] img_fila6_bus_in;
input	[7:0] img_fila5_bus_in;
input	[7:0] img_fila4_bus_in;
input	[7:0] img_fila3_bus_in;
input	[7:0] img_fila2_bus_in;
input	[7:0] img_fila1_bus_in;
input	[7:0] img_fila0_bus_in;

input wire [2:0] img_select_add;
output wire [7:0] img_data_max_in;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
																  
assign img_data_max_in = (img_select_add==3'b000)?{img_fila0_bus_in[7],img_fila1_bus_in[7],img_fila2_bus_in[7],img_fila3_bus_in[7],img_fila4_bus_in[7],img_fila5_bus_in[7],img_fila6_bus_in[7],img_fila7_bus_in[7]}:
					          (img_select_add==3'b001)?{img_fila0_bus_in[6],img_fila1_bus_in[6],img_fila2_bus_in[6],img_fila3_bus_in[6],img_fila4_bus_in[6],img_fila5_bus_in[6],img_fila6_bus_in[6],img_fila7_bus_in[6]}:
					          (img_select_add==3'b010)?{img_fila0_bus_in[5],img_fila1_bus_in[5],img_fila2_bus_in[5],img_fila3_bus_in[5],img_fila4_bus_in[5],img_fila5_bus_in[5],img_fila6_bus_in[5],img_fila7_bus_in[5]}:
					          (img_select_add==3'b011)?{img_fila0_bus_in[4],img_fila1_bus_in[4],img_fila2_bus_in[4],img_fila3_bus_in[4],img_fila4_bus_in[4],img_fila5_bus_in[4],img_fila6_bus_in[4],img_fila7_bus_in[4]}:
					          (img_select_add==3'b100)?{img_fila0_bus_in[3],img_fila1_bus_in[3],img_fila2_bus_in[3],img_fila3_bus_in[3],img_fila4_bus_in[3],img_fila5_bus_in[3],img_fila6_bus_in[3],img_fila7_bus_in[3]}:
					          (img_select_add==3'b101)?{img_fila0_bus_in[2],img_fila1_bus_in[2],img_fila2_bus_in[2],img_fila3_bus_in[2],img_fila4_bus_in[2],img_fila5_bus_in[2],img_fila6_bus_in[2],img_fila7_bus_in[2]}:
					          (img_select_add==3'b110)?{img_fila0_bus_in[1],img_fila1_bus_in[1],img_fila2_bus_in[1],img_fila3_bus_in[1],img_fila4_bus_in[1],img_fila5_bus_in[1],img_fila6_bus_in[1],img_fila7_bus_in[1]}:
																  {img_fila0_bus_in[0],img_fila1_bus_in[0],img_fila2_bus_in[0],img_fila3_bus_in[0],img_fila4_bus_in[0],img_fila5_bus_in[0],img_fila6_bus_in[0],img_fila7_bus_in[0]};

endmodule
