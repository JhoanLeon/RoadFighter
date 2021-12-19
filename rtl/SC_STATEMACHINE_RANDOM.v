
//=======================================================
//  MODULE Definition
//=======================================================

module SC_STATEMACHINE_RANDOM
(

	SC_STATEMACHINE_RANDOM_CLOCK_50,
	SC_STATEMACHINE_RANDOM_RESET_InLow,
	SC_STATEMACHINE_RANDOM_START_InLow,
	SC_STATEMACHINE_RANDOM_DOWN_InLow,
	SC_STATEMACHINE_RANDOM_LEVEL_InLow,
	
	SC_STATEMACHINE_RANDOM_SELECTION

);

//=======================================================
//  PARAMETER declarations
//=======================================================

parameter St_RESET   = 3'b000;
parameter St_START   = 3'b001;
parameter St_READY   = 3'b010;
parameter St_LEVEL1 	= 3'b011;
parameter St_LEVEL2  = 3'b100;
parameter St_LEVEL3  = 3'b101;
parameter St_LEVEL0  = 3'b110;
parameter St_LEVEL00 = 3'b111;
		
//=======================================================
//  PORT declarations
//=======================================================
 
input SC_STATEMACHINE_RANDOM_CLOCK_50;
input	SC_STATEMACHINE_RANDOM_RESET_InLow;
input	SC_STATEMACHINE_RANDOM_START_InLow;

input	SC_STATEMACHINE_RANDOM_DOWN_InLow;
input[1:0]	SC_STATEMACHINE_RANDOM_LEVEL_InLow;
	
output reg	SC_STATEMACHINE_RANDOM_SELECTION;

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

	St_START: if(SC_STATEMACHINE_RANDOM_START_InLow == 1'b0)
					St_Signal = St_READY;
				else 
					St_Signal = St_START; 

	St_READY: if(SC_STATEMACHINE_RANDOM_LEVEL_InLow == 2'b01 && SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
					St_Signal = St_LEVEL1;
				 else if(SC_STATEMACHINE_RANDOM_LEVEL_InLow == 2'b10 && SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
					St_Signal = St_LEVEL2;
				 else if(SC_STATEMACHINE_RANDOM_LEVEL_InLow == 2'b11 && SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
					St_Signal = St_LEVEL3;
				 else
					St_Signal = St_READY;
					
	St_LEVEL1: if(SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
						St_Signal = St_READY;
				  else
						St_Signal = St_LEVEL1;
	
   St_LEVEL2: if(SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
						St_Signal = St_LEVEL0;
				  else
						St_Signal = St_LEVEL2;
	
   St_LEVEL3: if(SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
						St_Signal = St_LEVEL0;
				  else
						St_Signal = St_LEVEL3;
						
	St_LEVEL0: if(SC_STATEMACHINE_RANDOM_LEVEL_InLow == 2'b10 && SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
						St_Signal = St_READY;
				  else if(SC_STATEMACHINE_RANDOM_LEVEL_InLow == 2'b11 && SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
						St_Signal = St_LEVEL00;
				  else
						St_Signal = St_LEVEL0;
						
	St_LEVEL00: if(SC_STATEMACHINE_RANDOM_DOWN_InLow == 1'b0)
						St_Signal = St_READY;
				  else
						St_Signal = St_LEVEL00;
					
	default: St_Signal = St_RESET;

	endcase
end
	
//-------STATE REGISTER : SEQUENTIAL----------------------------

always @(posedge SC_STATEMACHINE_RANDOM_CLOCK_50,negedge SC_STATEMACHINE_RANDOM_RESET_InLow)
	
	if (SC_STATEMACHINE_RANDOM_RESET_InLow == 1'b0)
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
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end
	
	St_START:
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end
	
	St_READY:
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b1;
	end
	
	St_LEVEL1:
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end
	
	St_LEVEL2:
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end
	
	St_LEVEL3:
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end
	
	St_LEVEL0:
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end
	
	St_LEVEL00:
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end

	default :
	begin
   SC_STATEMACHINE_RANDOM_SELECTION = 1'b0;
	end	
	
	endcase
end

endmodule	
