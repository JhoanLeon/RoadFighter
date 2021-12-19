
//=======================================================
//  MODULE Definition
//=======================================================

module BB_SYSTEM(

//////////// INPUTS ///////////
	
BB_SYSTEM_CLOCK_50,	//Clock de todo el sistema 50MHz
BB_SYSTEM_RESET_InLow,
BB_SYSTEM_START_InLow,
BB_SYSTEM_RIGHT_InLow,
BB_SYSTEM_LEFT_InLow,

//////////// OUTPUTS //////////

LED,

BB_SYSTEM_DIN_Out,	//Salidas para el control de la matriz de leds
BB_SYSTEM_NCS_Out,
BB_SYSTEM_CLK_Out

);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

input wire BB_SYSTEM_CLOCK_50;
input wire BB_SYSTEM_RESET_InLow;
input wire BB_SYSTEM_START_InLow;
input wire BB_SYSTEM_RIGHT_InLow;
input wire BB_SYSTEM_LEFT_InLow;

output BB_SYSTEM_DIN_Out;
output BB_SYSTEM_NCS_Out;
output BB_SYSTEM_CLK_Out;

output[7:0] LED;

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire start_signal_wire; 
wire right_signal_wire;
wire left_signal_wire;

wire clear_machine_to_register_car;
wire load_machine_to_register_car;
wire[1:0] shift_machine_to_register_car;

wire[7:0] car_bus_to_joiner;

wire transition_count_to_machine;
wire lose_comparator_to_machine;
wire win_comparator_to_machine;
wire down_velocity_to_machine;
wire clear_machine_to_environment;
wire load_machine_to_environment;
wire enable_count_transition_machine;
wire screenselector_machine;
wire[2:0] selectiontransition_machine;

wire[7:0] counter_score;
wire[1:0] level_signal_bus;

wire[7:0] data_cars_to_environment;

wire[7:0] environment_joiner_bus_fila7;
wire[7:0] environment_joiner_bus_fila6;
wire[7:0] environment_joiner_bus_fila5;
wire[7:0] environment_joiner_bus_fila4;
wire[7:0] environment_joiner_bus_fila3;
wire[7:0] environment_joiner_bus_fila2;
wire[7:0] environment_joiner_bus_fila1;
wire[7:0] environment_joiner_bus_fila0;

wire[7:0] joiner_selector_bus_fila7;
wire[7:0] joiner_selector_bus_fila6;
wire[7:0] joiner_selector_bus_fila5;
wire[7:0] joiner_selector_bus_fila4;
wire[7:0] joiner_selector_bus_fila3;
wire[7:0] joiner_selector_bus_fila2;
wire[7:0] joiner_selector_bus_fila1;
wire[7:0] joiner_selector_bus_fila0;

wire[7:0] transition_selector_bus_fila7;
wire[7:0] transition_selector_bus_fila6;
wire[7:0] transition_selector_bus_fila5;
wire[7:0] transition_selector_bus_fila4;
wire[7:0] transition_selector_bus_fila3;
wire[7:0] transition_selector_bus_fila2;
wire[7:0] transition_selector_bus_fila1;
wire[7:0] transition_selector_bus_fila0;

wire[7:0] selector_img_bus_fila7;
wire[7:0] selector_img_bus_fila6;
wire[7:0] selector_img_bus_fila5;
wire[7:0] selector_img_bus_fila4;
wire[7:0] selector_img_bus_fila3;
wire[7:0] selector_img_bus_fila2;
wire[7:0] selector_img_bus_fila1;
wire[7:0] selector_img_bus_fila0;

wire[2:0] add_max;
wire[7:0] data_max;

//=======================================================
//  Structural coding
//=======================================================

SI_DEBOUNCE DB_START_u0	//Antirrebote para el botón de start
(

.SI_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50), 
.SI_DEBOUNCE1_RESET_InLow(~BB_SYSTEM_RESET_InLow), 
.SI_DEBOUNCE1_button_In(~BB_SYSTEM_START_InLow),
.SI_DEBOUNCE1_button_Out(start_signal_wire)	

);


SI_DEBOUNCE DB_RIGHT_u0	//Antirrebote para el botón de right
(

.SI_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50), 
.SI_DEBOUNCE1_RESET_InLow(~BB_SYSTEM_RESET_InLow), 
.SI_DEBOUNCE1_button_In(~BB_SYSTEM_RIGHT_InLow),
.SI_DEBOUNCE1_button_Out(right_signal_wire)	

);


SI_DEBOUNCE DB_LEFT_u0	//Antirrebote para el botón de left
(

.SI_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50), 
.SI_DEBOUNCE1_RESET_InLow(~BB_SYSTEM_RESET_InLow), 
.SI_DEBOUNCE1_button_In(~BB_SYSTEM_LEFT_InLow),
.SI_DEBOUNCE1_button_Out(left_signal_wire)	

);


SC_STATEMACHINE_CAR SC_STATEMACHINE_CAR_u0 //Máquina de estados para el movimiento del carro principal
(

.SC_STATEMACHINE_CAR_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_STATEMACHINE_CAR_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_STATEMACHINE_CAR_START_InLow(start_signal_wire),
.SC_STATEMACHINE_CAR_RIGHT_InLow(right_signal_wire),
.SC_STATEMACHINE_CAR_LEFT_InLow(left_signal_wire),
.SC_STATEMACHINE_CAR_LOSE_InLow(lose_comparator_to_machine),
	
.SC_STATEMACHINE_CAR_CLEAR_OUT(clear_machine_to_register_car),
.SC_STATEMACHINE_CAR_LOAD_OUT(load_machine_to_register_car),
.SC_STATEMACHINE_CAR_SHIFT_BUS(shift_machine_to_register_car)

);


SC_REGSHIFTER_CAR SC_REGSHIFTER_CAR_u0 //Registro de desplazamiento del carro principal
(

.SC_REGSHIFTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_REGSHIFTER_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_REGSHIFTER_clear_InLow(clear_machine_to_register_car), 
.SC_REGSHIFTER_load_InLow(load_machine_to_register_car), 
.SC_REGSHIFTER_shift_InBus(shift_machine_to_register_car),

.SC_REGSHIFTER_data_OutBUS(car_bus_to_joiner)

);


SC_STATEMACHINE_ENVIRONMENT SC_STATEMACHINE_ENVIRONMENT_u0 //Máquina de estados que controla el ambiente y las transiciones
(

.SC_STATEMACHINE_ENVIRONMENT_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_STATEMACHINE_ENVIRONMENT_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_STATEMACHINE_ENVIRONMENT_START_InLow(start_signal_wire),
.SC_STATEMACHINE_ENVIRONMENT_TRANSITION_InLow(transition_count_to_machine),	
.SC_STATEMACHINE_ENVIRONMENT_LOSE_InLow(lose_comparator_to_machine),
.SC_STATEMACHINE_ENVIRONMENT_WIN_InLow(win_comparator_to_machine),
.SC_STATEMACHINE_ENVIRONMENT_DOWN_InLow(down_velocity_to_machine),
.SC_STATEMACHINE_ENVIRONMENT_LEVEL_InBus(level_signal_bus),

.SC_STATEMACHINE_ENVIRONMENT_CLEAR_Out(clear_machine_to_environment),
.SC_STATEMACHINE_ENVIRONMENT_LOAD_Out(load_machine_to_environment),
.SC_STATEMACHINE_ENVIRONMENT_ENABLECOUNT_Out(enable_count_transition_machine),
.SC_STATEMACHINE_ENVIRONMENT_SCREENSELECTOR_Out(screenselector_machine),
.SC_STATEMACHINE_ENVIRONMENT_SELECTIONTRAN_OutBus(selectiontransition_machine)

);


SC_REGISTER_ENVIRONMENT SC_REGISTER_ENVIRONMENT_u0 //Arreglo 8x8 de registros de ambiente
(

.SC_REGISTER_ENVIRONMENT_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_REGISTER_ENVIRONMENT_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_REGISTER_ENVIRONMENT_clear_InLow(clear_machine_to_environment), 
.SC_REGISTER_ENVIRONMENT_load_InLow(load_machine_to_environment), 
.SC_REGISTER_ENVIRONMENT_data_InBUS(data_cars_to_environment), 

.SC_REGISTER_ENVIRONMENT_data7_OutBUS(environment_joiner_bus_fila7),
.SC_REGISTER_ENVIRONMENT_data6_OutBUS(environment_joiner_bus_fila6),
.SC_REGISTER_ENVIRONMENT_data5_OutBUS(environment_joiner_bus_fila5),
.SC_REGISTER_ENVIRONMENT_data4_OutBUS(environment_joiner_bus_fila4),
.SC_REGISTER_ENVIRONMENT_data3_OutBUS(environment_joiner_bus_fila3),
.SC_REGISTER_ENVIRONMENT_data2_OutBUS(environment_joiner_bus_fila2),
.SC_REGISTER_ENVIRONMENT_data1_OutBUS(environment_joiner_bus_fila1),
.SC_REGISTER_ENVIRONMENT_data0_OutBUS(environment_joiner_bus_fila0)

);


SC_GENERATOR_ENVIRONMENT SC_GENERATOR_ENVIRONMENT_u0 //Bloque que genera los carros del ambiente
(

.SC_GENERATOR_ENVIRONMENT_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_GENERATOR_ENVIRONMENT_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_GENERATOR_ENVIRONMENT_START_InLow(start_signal_wire),
.SC_GENERATOR_ENVIRONMENT_LEVEL_InBus(level_signal_bus),
.SC_GENERATOR_ENVIRONMENT_DOWN_InLow(down_velocity_to_machine),

.SC_GENERATOR_ENVIRONMENT_Data_OutBus(data_cars_to_environment)

);


CC_COMPARATOR_LOSE CC_COMPARATOR_LOSE_u0 //si suma de carro mas ambiente es igual a ambiente es porque mato carro, sino, está bien
(

.CC_COMPARATOR_LOSE_BusJoined(joiner_selector_bus_fila0),
.CC_COMPARATOR_LOSE_BusNorm(environment_joiner_bus_fila0),

.CC_COMPARATOR_LOSE_loseout(lose_comparator_to_machine)

);


SC_COUNTER_SCORE SC_COUNTER_SCORE_u0 //Contador de puntaje del jugador para ver cuando gana
(

.SC_COUNTER_SCORE_CLOCK(BB_SYSTEM_CLOCK_50),
.SC_COUNTER_SCORE_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_COUNTER_SCORE_COUNT(load_machine_to_environment),
.SC_COUNTER_SCORE_CLEARCOUNT(clear_machine_to_environment),
	
.SC_COUNTER_SCORE_REGCOUNT(counter_score),
.SC_COUNTER_SCORE_ENDCOUNT(win_comparator_to_machine)

);


CC_COMPARATOR_LEVEL CC_COMPARATOR_LEVEL_u0
(

.CC_COMPARATOR_LEVEL_BusIn(counter_score),
.CC_COMPARATOR_LEVEL_OutBus(level_signal_bus)

);


SC_COUNTER_VELOCITY SC_COUNTER_VELOCITY_u0
(

.SC_COUNTER_VELOCITY_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_COUNTER_VELOCITY_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_COUNTER_VELOCITY_ENABLE_InLow(1'b0),
.SC_COUNTER_VELOCITY_SELECTIONVEL_InBus(level_signal_bus),

.SC_COUNTER_VELOCITY_COUNT_Out(down_velocity_to_machine)

);


SC_COUNTER_TRANSITION SC_COUNTER_TRANSITION_u0 
(
	
.SC_COUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
.SC_COUNTER_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.SC_COUNTER_count_InLow(enable_count_transition_machine),
	
.SC_COUNTER_eoc_OutLow(transition_count_to_machine)

);


CC_JOINER CC_JOINER_u0
(

.CC_JOINER_car_fila0_bus_in(car_bus_to_joiner),

.CC_JOINER_environment_fila7_bus_in(environment_joiner_bus_fila7),
.CC_JOINER_environment_fila6_bus_in(environment_joiner_bus_fila6),
.CC_JOINER_environment_fila5_bus_in(environment_joiner_bus_fila5),
.CC_JOINER_environment_fila4_bus_in(environment_joiner_bus_fila4),
.CC_JOINER_environment_fila3_bus_in(environment_joiner_bus_fila3),
.CC_JOINER_environment_fila2_bus_in(environment_joiner_bus_fila2),
.CC_JOINER_environment_fila1_bus_in(environment_joiner_bus_fila1),
.CC_JOINER_environment_fila0_bus_in(environment_joiner_bus_fila0),

.CC_JOINER_fila7_bus_out(joiner_selector_bus_fila7),
.CC_JOINER_fila6_bus_out(joiner_selector_bus_fila6),
.CC_JOINER_fila5_bus_out(joiner_selector_bus_fila5),
.CC_JOINER_fila4_bus_out(joiner_selector_bus_fila4),
.CC_JOINER_fila3_bus_out(joiner_selector_bus_fila3),
.CC_JOINER_fila2_bus_out(joiner_selector_bus_fila2),
.CC_JOINER_fila1_bus_out(joiner_selector_bus_fila1),
.CC_JOINER_fila0_bus_out(joiner_selector_bus_fila0)

);


CC_TRANSITION CC_TRANSITION_u0
(

.transition_statemachine_ctrl(selectiontransition_machine), //000 start, 001 go, 010 lose, 011 win, 100 level1, 101 level2, 110 level3

.transition_fila7_bus_out(transition_selector_bus_fila7),
.transition_fila6_bus_out(transition_selector_bus_fila6),
.transition_fila5_bus_out(transition_selector_bus_fila5),
.transition_fila4_bus_out(transition_selector_bus_fila4),
.transition_fila3_bus_out(transition_selector_bus_fila3),
.transition_fila2_bus_out(transition_selector_bus_fila2),
.transition_fila1_bus_out(transition_selector_bus_fila1),
.transition_fila0_bus_out(transition_selector_bus_fila0)

);


CC_SELECTOR_SCREEN CC_SELECTOR_SCREEN_u0 
(

.selector_mux_screen(screenselector_machine), //0 juego, 1 transición

.selector_transition_fila7_bus_in(transition_selector_bus_fila7),
.selector_transition_fila6_bus_in(transition_selector_bus_fila6),
.selector_transition_fila5_bus_in(transition_selector_bus_fila5),
.selector_transition_fila4_bus_in(transition_selector_bus_fila4),
.selector_transition_fila3_bus_in(transition_selector_bus_fila3),
.selector_transition_fila2_bus_in(transition_selector_bus_fila2),
.selector_transition_fila1_bus_in(transition_selector_bus_fila1),
.selector_transition_fila0_bus_in(transition_selector_bus_fila0),

.selector_joiner_fila7_bus_in(joiner_selector_bus_fila7),
.selector_joiner_fila6_bus_in(joiner_selector_bus_fila6),
.selector_joiner_fila5_bus_in(joiner_selector_bus_fila5),
.selector_joiner_fila4_bus_in(joiner_selector_bus_fila4),
.selector_joiner_fila3_bus_in(joiner_selector_bus_fila3),
.selector_joiner_fila2_bus_in(joiner_selector_bus_fila2),
.selector_joiner_fila1_bus_in(joiner_selector_bus_fila1),
.selector_joiner_fila0_bus_in(joiner_selector_bus_fila0),

.selector_img_fila7_bus_out(selector_img_bus_fila7),
.selector_img_fila6_bus_out(selector_img_bus_fila6),
.selector_img_fila5_bus_out(selector_img_bus_fila5),
.selector_img_fila4_bus_out(selector_img_bus_fila4),
.selector_img_fila3_bus_out(selector_img_bus_fila3),
.selector_img_fila2_bus_out(selector_img_bus_fila2),
.selector_img_fila1_bus_out(selector_img_bus_fila1),
.selector_img_fila0_bus_out(selector_img_bus_fila0)

);


IMAGEN IMG_u0	//Módulo utilizado para funcionamiento de la matriz
(

.img_select_add(add_max),
.img_fila7_bus_in(selector_img_bus_fila7),
.img_fila6_bus_in(selector_img_bus_fila6),
.img_fila5_bus_in(selector_img_bus_fila5),
.img_fila4_bus_in(selector_img_bus_fila4),
.img_fila3_bus_in(selector_img_bus_fila3),
.img_fila2_bus_in(selector_img_bus_fila2),
.img_fila1_bus_in(selector_img_bus_fila1),
.img_fila0_bus_in(selector_img_bus_fila0),
.img_data_max_in(data_max)

);


matrix_ctrl MAXC_u0	//Módulo de control de la matriz
(

.max7219_din(BB_SYSTEM_DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add_max),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InLow) 

);

assign LED = counter_score;

endmodule
