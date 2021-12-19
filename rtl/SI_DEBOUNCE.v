/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
// FROM: DeBounce_v.v https://eewiki.net/pages/viewpage.action?pageId=13599139

//////////////////////// Button Debounceer ///////////////////////////////////////
//***********************************************************************
// FileName: DeBounce_v.v
// FPGA: MachXO2 7000HE
// IDE: Diamond 2.0.1 
//
// HDL IS PROVIDED "AS IS." DIGI-KEY EXPRESSLY DISCLAIMS ANY
// WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
// BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
// DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
// PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
// BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
// ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
// DIGI-KEY ALSO DISCLAIMS ANY LIABILITY FOR PATENT OR COPYRIGHT
// INFRINGEMENT.
//
// Version History
// Version 1.0 04/11/2013 Tony Storey
// Initial Public Release
// Small Footprint Button Debouncer

//`timescale 1 ns / 100 ps
module  SI_DEBOUNCE 
	(
	input 			SI_DEBOUNCE1_CLOCK_50, SI_DEBOUNCE1_RESET_InLow, SI_DEBOUNCE1_button_In,				// inputs
	output reg 	SI_DEBOUNCE1_button_Out													// output
	);
//// ---------------- internal constants --------------
	parameter N = 11 ;		// (2^ (21-1) )/ 38 MHz =  ms debounce time
////---------------- internal variables ---------------
	reg  [N-1 : 0]	q_reg;							// timing regs
	reg  [N-1 : 0]	q_next;
	reg DFF1, DFF2;									// input flip-flops
	wire q_add;											// control flags
	wire q_reset;
//// ------------------------------------------------------

////contenious assignment for counter control
	assign q_reset = (DFF1  ^ DFF2);		// xor input flip flops to look for level chage to reset counter
	assign  q_add = ~(q_reg[N-1]);			// add to counter when q_reg msb is equal to 0
	
//// combo counter to manage q_next	
	always @ ( q_reset, q_add, q_reg)
		begin
			case( {q_reset , q_add})
				2'b00 :
						q_next <= q_reg;
				2'b01 :
						q_next <= q_reg + 1'b1;
				default :
						q_next <= { N {1'b0} };
			endcase 	
		end
	
//// Flip flop inputs and q_reg update
	always @ ( posedge SI_DEBOUNCE1_CLOCK_50 )
		begin
			if(SI_DEBOUNCE1_RESET_InLow ==  1'b0)
				begin
					DFF1 <= 1'b0;
					DFF2 <= 1'b0;
					q_reg <= { N {1'b0} };
				end
			else
				begin
					DFF1 <= SI_DEBOUNCE1_button_In;
					DFF2 <= DFF1;
					q_reg <= q_next;
				end
		end
	
//// counter control
	always @ ( posedge SI_DEBOUNCE1_CLOCK_50 )
		begin
			if(q_reg[N-1] == 1'b1)
					SI_DEBOUNCE1_button_Out <= DFF2;
			else
					SI_DEBOUNCE1_button_Out <= SI_DEBOUNCE1_button_Out;
		end

	endmodule


