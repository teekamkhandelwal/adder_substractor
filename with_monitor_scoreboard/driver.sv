class driver;
  virtual simple vif;
  transaction trans;
  mailbox mbx;
  int transaction_count;
  
  function new(virtual simple vif, mailbox mbx);
    this.vif = vif;
    this.mbx = mbx;
  endfunction
  
  task reset();
    wait(vif.reset);
    vif.a <= 0;
    vif.b <= 0;
    vif.load <= 0;
    vif.load1 <=0;
    wait(!vif.reset);
    $display("Design Reseted"); 
  endtask
  
  
  task main();
    forever begin
    trans = new();
      mbx.get(trans);
      @(posedge vif.clk);
      vif.a <= $random;
      vif.b <= $random;
      vif.load <= 1;
      repeat(2)
      @(posedge vif.clk);
      vif.load <= 0;
      trans.sum = vif.sum;
      trans.display("driver");
      @(posedge vif.clk);
      vif.a <= $random;
      vif.b <= $random;
      vif.load1<=1;
      repeat(3)
      @(posedge vif.clk);
        vif.load1<=0;
      trans.sub = vif.sub;
      trans.display("driver");
   @(posedge vif.clk);
      $display("Driver Completed");
      transaction_count++;
      end
  endtask
endclass
