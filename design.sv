// Code your design here
module adder(
input clk,reset,load,load1,
  input [3:0] a,b,
  output [4:0] sum,
  output [4:0] sub
);
  
  reg [4:0] temp;
  reg [4:0] temp1;
  
  always@(posedge clk) begin
    if(reset)
      temp <= 0;
      temp1<=0;
  end
  
  always@(posedge clk) begin
    if(load) 
      temp <= a + b;
  end
  
  always@(posedge clk)
    if(load1) begin
    if(a>b)
      temp1 <= a-b;
    else
      temp1 <= b-a;
    end
  
  assign sum = temp;
  assign sub = temp1;
  
  
endmodule
