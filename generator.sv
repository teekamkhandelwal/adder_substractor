class generator;
  transaction trans;
  mailbox mbx;
  event complete;
  int count;
  
  function new(mailbox mbx);
    this.mbx = mbx;    
  endfunction
  
  task main();
    repeat(count) begin
      trans = new();
      trans.randomize();
      mbx.put(trans);  
    end
 -> complete;   
  endtask  
endclass
