`include "environment.sv"
 
program test (simple tif);
  
  environment env;
  
  initial begin
    env = new(tif);
    env.gen.count = 4;
    env.run();
  end
endprogram
