class scoreboard;
  
  //create mailbox handle
  mailbox monin2scb;
  mailbox monout2scb;
  //count the number of transactions
  int num_transactions;
 // logic [7:0] scb_count;
  logic [7:0]expected_count;
  
  //constructior
  
  function new(mailbox monin2scb,mailbox monout2scb);
    
   //get the mailbox handle from environment
    this.monin2scb = monin2scb;
    this.monout2scb = monout2scb;
  endfunction
  
  task main;
    transaction transin;
    transaction transout;
    //forever begin
      //fork
    //  monin2scb.get(trans_in);
      //monout2scb.get(trans_out);
      //if(trans_in.load) begin            
        //    trans_out.count = trans_in.data_in;
        
        
           // if (trans.count==scb_count)
             // $display("result is expected");
            //else 
            //  $error("wrong result");
         // end
          //if(!trans_in.load && trans_in.enable) begin
            //scb_count++;
          
        //    if (trans_out.count==scb_count)
          //    $display("result is expected");
			//else 
              //$error("wrong result");
          //end
      //num_transactions++;
     // trans_in.display("[--Scoreboard_in--]");
      //trans_out.display("[--Scoreboard_out--]");
//endclass
    //end
  //endtask
  forever begin
      // Get transactions from the input and output mailboxes
    monin2scb.get(transin);
    monout2scb.get(transout);

      // Update expected count based on load and enable signals
    if (transin.load) begin
        expected_count = transin.data_in;
    end
       else if (transin.enable) begin
        expected_count = expected_count + 8'h01;
      end

      // Compare expected count with actual count
    if (transout.count !== expected_count) begin
      $error("Scoreboard Mismatch: Expected %d, Got %d", 
               expected_count, transout.count);
    end
    else begin
      $display("Scoreboard Match: Count %d", transout.count);
      end
    end
 
  endtask


  
endclass


  