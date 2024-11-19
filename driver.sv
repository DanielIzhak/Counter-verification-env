class driver;

int num_transactions;


virtual inf vinf;

mailbox gen2drv;

function new(virtual inf vinf, mailbox gen2drv);
		//get the interface 
		this.vinf = vinf;
		//get the mailbox handle from env
		this.gen2drv = gen2drv;
	endfunction 

task reset;
wait(!vinf.rst_n);
$display("[ --DRIVER--] ----RESET START");
vinf.data_in <= 0;
vinf.enable <= 0;
vinf.load <= 0;
wait(vinf.rst_n);
$display("[--DRIVER--] --- RESET ENDED ---");
endtask

task main;
forever begin
transaction trans;
gen2drv.get(trans);


@(posedge vinf.clk);

vinf.load = trans.load;  
vinf.data_in <= trans.data_in; 
vinf.enable <= trans.enable;
 #1;

//@(posedge vinf.clk);
 //@(posedge vinf.clk); 
//vinf.enable <= trans.enable;  
//trans.count <= vinf.count;
  
trans.display("[ -- Driver --]");
num_transactions++;
end
endtask  

  
endclass