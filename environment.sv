`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
 
class environment;
  
  generator gen;
  driver drv;
  mailbox mbx;
  virtual simple eif;
  
  function new(virtual simple eif);
    this.eif = eif;
    mbx = new();
    gen = new(mbx);
    drv = new(eif, mbx);
  endfunction
    
  task pretest();
    drv.reset;
  endtask
  
  task test();
    fork
    gen.main();
    drv.main();
    join_any
   endtask
  
  task posttest();
    wait(gen.complete.triggered);
    wait(gen.count == drv.transaction_count);
  endtask
 
  task run();
      pretest();
      test();
      posttest();
     $finish;
  endtask
  
  
endclass
