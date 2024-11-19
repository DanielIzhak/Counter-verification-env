class monitor_out;

virtual inf vinf;
  
  mailbox monout2scb;
  
  function new(virtual inf vinf ,mailbox monout2scb);
    
    this.vinf = vinf;
    
   this.monout2scb = monout2scb;
    
  endfunction
  // Main monitoring task
  task main;
     //transaction trans_out;
    forever begin
      transaction trans;
      trans = new();
      //@(posedge vinf.clk);
      //trans.enable = vinf.enable;
      //trans.load = vinf.load;
      
      @(posedge vinf.clk);
      trans.count = vinf.count;
      trans.display("[-- Monitor Out --]");
      monout2scb.put(trans);

      // Display the transaction for debugging purposes
    
    end
  endtask
endclass