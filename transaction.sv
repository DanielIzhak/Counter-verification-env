class transaction;

bit [7:0]count;
rand bit [7:0]data_in;
rand bit enable;
rand bit load;

function void display (string name);

$display("----------------");
$display("-%s",name);
$display("-data_in = %d, enable = %d , load = %d",data_in,enable,load);
$display("-count = %d",count);
$display("----------------");
endfunction

  constraint enable_c {enable dist {1:=90, 0:=10};}  
  
endclass 


