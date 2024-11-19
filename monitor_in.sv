class monitor_in;

  virtual inf vinf;
  
  mailbox monin2scb;
  
  function new(virtual inf vinf ,mailbox monin2scb);
    
    this.vinf = vinf;
    
    this.monin2scb = monin2scb;
    
  endfunction
  // Main monitoring task
  task main;
    //transaction trans_in;
    transaction trans;
    forever begin

      trans = new();
      @(posedge vinf.clk);
      trans.enable = vinf.enable;
      trans.data_in = vinf.data_in;
      trans.load = vinf.load;
      trans.display("[-- Monitor In --]");
    //  @(posedge vinf.clk);
      monin2scb.put(trans);

      // Display the transaction for debugging purposes
     
    end
  endtask
endclass
