
//=======================================================
//  MODULE Definition
//=======================================================

module SI_STATEMACHINE_NAVE
(

	SI_STATEMACHINE_NAVE_CLOCK_50,
	SI_STATEMACHINE_NAVE_RESET_InLow,
	SI_STATEMACHINE_NAVE_START_InLow,
	SI_STATEMACHINE_NAVE_RIGHT_InLow,
	SI_STATEMACHINE_NAVE_LEFT_InLow,
	SI_STATEMACHINE_NAVE_INDICATOR_InBus,
	
	SI_STATEMACHINE_NAVE_CLEAR_OUT,
	SI_STATEMACHINE_NAVE_LOAD_OUT,
	SI_STATEMACHINE_NAVE_SHIFT_BUS

);

//=======================================================
//  PARAMETER declarations
//=======================================================

	parameter St_Init   = 3'b000;
	parameter St_Wait	  = 3'b001;
	parameter St_Start  = 3'b010;
	parameter St_Ready  = 3'b011;
	parameter St_Right  = 3'b100;
	parameter St_KeepR  = 3'b101;
	parameter St_Left	  = 3'b110;
	parameter St_KeepL  = 3'b111;
		
//=======================================================
//  PORT declarations
//=======================================================
 
input SI_STATEMACHINE_NAVE_CLOCK_50;
input	SI_STATEMACHINE_NAVE_RESET_InLow;
input	SI_STATEMACHINE_NAVE_START_InLow;
input	SI_STATEMACHINE_NAVE_RIGHT_InLow;
input	SI_STATEMACHINE_NAVE_LEFT_InLow;
input [1:0] SI_STATEMACHINE_NAVE_INDICATOR_InBus;

output reg SI_STATEMACHINE_NAVE_CLEAR_OUT;
output reg SI_STATEMACHINE_NAVE_LOAD_OUT;
output reg [1:0] SI_STATEMACHINE_NAVE_SHIFT_BUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [2:0] St_Register;
reg [2:0] St_Signal;

//=======================================================
//  Structural coding
//=======================================================
	
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	
always @(*)

begin 
	
	case(St_Register)
	
   St_Init: St_Signal = St_Wait;

	St_Wait: if(SI_STATEMACHINE_NAVE_START_InLow == 0)
	         St_Signal=St_Start;
				else 
				St_Signal=St_Wait;

	St_Start: St_Signal = St_Ready; 

	St_Ready: if(SI_STATEMACHINE_NAVE_RIGHT_InLow == 0 && (SI_STATEMACHINE_NAVE_INDICATOR_InBus == 2'b11 || SI_STATEMACHINE_NAVE_INDICATOR_InBus == 2'b01))
				St_Signal = St_Right;
			
				 else if(SI_STATEMACHINE_NAVE_LEFT_InLow == 0 && (SI_STATEMACHINE_NAVE_INDICATOR_InBus == 2'b11 || SI_STATEMACHINE_NAVE_INDICATOR_InBus == 2'b10))
				St_Signal = St_Left;	
				
		       else 	
				 St_Signal = St_Ready;
	
	St_Right: St_Signal = St_KeepR;
	
   St_KeepR: if(SI_STATEMACHINE_NAVE_RIGHT_InLow == 1)
	          St_Signal = St_Ready;
				 
				 else
				 St_Signal = St_KeepR;
	
	St_Left: St_Signal = St_KeepL; 
	
	St_KeepL: if(SI_STATEMACHINE_NAVE_LEFT_InLow == 1)
	          St_Signal = St_Ready;
				 
				 else
				 St_Signal = St_KeepL;  

	endcase
end
	
//-------STATE REGISTER : SEQUENTIAL----------------------------

always @(posedge SI_STATEMACHINE_NAVE_CLOCK_50,negedge SI_STATEMACHINE_NAVE_RESET_InLow)
	
	if (SI_STATEMACHINE_NAVE_RESET_InLow == 0)
		St_Register <= St_Init;
	else
		St_Register <= St_Signal;
	
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------	
	
always @(*)
	
begin 
	
	case(St_Register)
	
	St_Init:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 1;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 1;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b11;
	end
	
	St_Wait:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 0;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 1;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b11;
	end
	
	St_Start:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 1;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 0;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b11;
	end
	
	St_Ready:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 1;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 1;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b11;
	end
	
	St_Right:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 1;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 1;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b10;
	end
	
	St_KeepR:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 1;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 1;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b11;
	end
	
	St_Left:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 1;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 1;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b01;
	end	
	
	St_KeepL:
	begin
   SI_STATEMACHINE_NAVE_CLEAR_OUT = 1;
   SI_STATEMACHINE_NAVE_LOAD_OUT = 1;
   SI_STATEMACHINE_NAVE_SHIFT_BUS = 2'b11;
	end	
	
	endcase
end

	endmodule	
