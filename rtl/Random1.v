// http://simplefpga.blogspot.com.co/2013/02/random-number-generator-in-verilog-fpga.html

module Random1 #(parameter DATAWIDTH_BUS=8) 
(
    input clock,
    input reset,
    output [DATAWIDTH_BUS-1:0] rnd 
);

wire feedback;
 
reg [DATAWIDTH_BUS-1:0] random, random_next; //, random_done;
 
always @ (posedge clock or posedge reset)
begin
 if (reset)
 begin
  random <= 8'b10000001; //An LFSR cannot have an all 0 state, thus reset to FF
 end
 else
 begin
  random <= random_next;
 end
end
 
always @ (*)
begin
  random_next = {random[6:0], feedback}; //shift left the xor'd every posedge clock
end
 
assign feedback = random[7] ^ random[5] ^ random[3] ^ random[0];  

assign rnd[DATAWIDTH_BUS-1:0] = random[DATAWIDTH_BUS-1:0];

endmodule
