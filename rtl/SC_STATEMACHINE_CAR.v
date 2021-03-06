
//=======================================================
//  MODULE Definition
//=======================================================

module SC_STATEMACHINE_CAR
(

	SC_STATEMACHINE_CAR_CLOCK_50,
	SC_STATEMACHINE_CAR_RESET_InLow,
	SC_STATEMACHINE_CAR_START_InLow,
	SC_STATEMACHINE_CAR_RIGHT_InLow,
	SC_STATEMACHINE_CAR_LEFT_InLow,
	SC_STATEMACHINE_CAR_LOSE_InLow,
	
	SC_STATEMACHINE_CAR_CLEAR_OUT,
	SC_STATEMACHINE_CAR_LOAD_OUT,
	SC_STATEMACHINE_CAR_SHIFT_BUS

);

//=======================================================
//  PARAMETER declarations
//=======================================================

parameter St_RESET   = 3'b000;
parameter St_START   = 3'b001;
parameter St_READY   = 3'b010;
parameter St_RIGHT_0 = 3'b011;
parameter St_RIGHT_1 = 3'b100;
parameter St_LEFT_0  = 3'b101;
parameter St_LEFT_1	= 3'b110;
		
//=======================================================
//  PORT declarations
//=======================================================
 
input SC_STATEMACHINE_CAR_CLOCK_50;
input	SC_STATEMACHINE_CAR_RESET_InLow;
input	SC_STATEMACHINE_CAR_START_InLow;
input	SC_STATEMACHINE_CAR_RIGHT_InLow;
input	SC_STATEMACHINE_CAR_LEFT_InLow;
input SC_STATEMACHINE_CAR_LOSE_InLow;

output reg SC_STATEMACHINE_CAR_CLEAR_OUT;
output reg SC_STATEMACHINE_CAR_LOAD_OUT;
output reg [1:0] SC_STATEMACHINE_CAR_SHIFT_BUS;

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
	
   St_RESET: St_Signal = St_START;

	St_START: if(SC_STATEMACHINE_CAR_START_InLow == 1'b0)
					St_Signal = St_READY;
				else 
					St_Signal = St_START; 

	St_READY: if (SC_STATEMACHINE_CAR_LOSE_InLow == 1'b0)
					St_Signal = St_RESET;
	
				 else if(SC_STATEMACHINE_CAR_RIGHT_InLow == 1'b0)
					St_Signal = St_RIGHT_0;
			
				 else if(SC_STATEMACHINE_CAR_LEFT_InLow == 1'b0)
					St_Signal = St_LEFT_0;	
				
		       else 	
					St_Signal = St_READY;
	
	St_RIGHT_0: St_Signal = St_RIGHT_1;
	
   St_RIGHT_1: if(SC_STATEMACHINE_CAR_RIGHT_InLow == 1'b1)
						St_Signal = St_READY;
				 else
					St_Signal = St_RIGHT_1;
	
	St_LEFT_0: St_Signal = St_LEFT_1; 
	
	St_LEFT_1: if(SC_STATEMACHINE_CAR_LEFT_InLow == 1'b1)
					St_Signal = St_READY;
				 else
					St_Signal = St_LEFT_1;
					
	default: St_Signal = St_RESET;

	endcase
end
	
//-------STATE REGISTER : SEQUENTIAL----------------------------

always @(posedge SC_STATEMACHINE_CAR_CLOCK_50,negedge SC_STATEMACHINE_CAR_RESET_InLow)
	
	if (SC_STATEMACHINE_CAR_RESET_InLow == 1'b0)
		St_Register <= St_RESET;
	else
		St_Register <= St_Signal;
	
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------	
	
always @(*)
	
begin 
	
	case(St_Register)
	
	St_RESET:
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b0;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b1;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b11;
	end
	
	St_START:
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b1;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b0;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b11;
	end
	
	St_READY:
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b1;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b1;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b11;
	end
	
	St_RIGHT_0:
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b1;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b1;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b10;
	end
	
	St_RIGHT_1:
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b1;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b1;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b11;
	end
	
	St_LEFT_0:
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b1;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b1;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b01;
	end	
	
	St_LEFT_1:
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b1;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b1;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b11;
	end

	default :
	begin
   SC_STATEMACHINE_CAR_CLEAR_OUT = 1'b1;
   SC_STATEMACHINE_CAR_LOAD_OUT = 1'b1;
   SC_STATEMACHINE_CAR_SHIFT_BUS = 2'b11;
	end	
	
	endcase
end

endmodule	
