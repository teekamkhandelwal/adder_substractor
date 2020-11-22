class monitor;
  
  virtual simple vif;
  mailbox m2s;
  
  function new(virtual simple vif, mailbox m2s );
    this.vif=vif;
    this.m2s=m2s;
  endfunction
  task main;
 forever begin
 transaction trans;
   trans=new();
   @(posedge vif.clk);
   trans.a=vif.a;
   trans.b=vif.b;
   @(posedge vif.clk);
   trans.sum=vif.sum;
   trans.sub=vif.sub;
   @(posedge vif.clk);
   m2s.put(trans);
   trans.display("monitor");
 end
  endtask
endclass
