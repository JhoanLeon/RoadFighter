transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/Random1.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_COUNTER_VEL3.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_COUNTER_VEL2.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_COUNTER_VEL1.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_REGGENERAL.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_COUNTER_TRANSITION.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_STATEMACHINE_ENVIRONMENT.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_STATEMACHINE_CAR.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_REGSHIFTER_CAR.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SI_DEBOUNCE.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/shift_reg_start_done.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/max7219_ctrl.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/IMAGEN.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/CC_TRANSITION.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/CC_SELECTOR_SCREEN.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/CC_JOINER.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/BB_SYSTEM.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_COUNTER_VELOCITY.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_COUNTER_SCORE.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_REGISTER_ENVIRONMENT.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/CC_COMPARATOR_LEVEL.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_GENERATOR_ENVIRONMENT.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/CC_COMPARATOR_LOSE.v}
vlog -vlog01compat -work work +incdir+D:/Projects/Proyectos\ Quartus/PRJ01_ROADFIGHTER/rtl {D:/Projects/Proyectos Quartus/PRJ01_ROADFIGHTER/rtl/SC_STATEMACHINE_RANDOM.v}

