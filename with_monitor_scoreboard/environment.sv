`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
 
class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  mailbox mbx;
  mailbox m2c;
  virtual simple eif;
  
  function new(virtual simple eif);
    this.eif = eif;
    mbx = new();
    m2c=new();
    gen = new(mbx);
    drv = new(eif, mbx);
    mon= new(eif,m2c);
    scb =new(m2c);
  endfunction
    
  task pretest();
    drv.reset;
  endtask
  
  task test();
    fork
    gen.main();
    drv.main();
    mon.main();
    scb.main();
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
