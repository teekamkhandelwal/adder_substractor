class scoreboard;
mailbox m2s;
  int no_tran;
  function new(mailbox m2s);
    this.m2s=m2s;
  endfunction
  task main;
    transaction trans;
    forever begin
      m2s.get(trans);
      if((trans.a+trans.b)==trans.sum)
        $display("sum is successful");
      else if  (trans.a>trans.b) begin
        if((trans.a-trans.b)==trans.sub)
          $display("sustraction susces");
        else 
          $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(trans.a-trans.b),trans.sub);
        
      end
      else if (trans.a<trans.b) begin
        if((trans.b-trans.a)==trans.sub)
          $display("sustraction susces");
        else 
          $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(trans.b-trans.a),trans.sub);
      end
      else
        $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(trans.b+trans.a),trans.sum);
           no_tran++;
      trans.display("[ Scoreboard ]");
        
    end
  endtask
endclass
