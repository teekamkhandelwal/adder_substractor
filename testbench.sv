// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"
 
 
module tb;
  bit clk;
  bit reset;
  
  simple tbi(clk,reset);
  test t1 (tbi);
  
  adder a1 (clk,reset, tbi.load,tbi.load1, tbi.a, tbi.b, tbi.sum, tbi.sub);
 
  
  always #5 clk =~clk;
  
  initial begin
    reset = 1;
    #5 reset = 0;
  end
  
  initial begin
   $dumpfile("dump.vcd"); $dumpvars;
    
  end
   
  
endmodule
