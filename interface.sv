interface inf( input logic clk,rst_n);
  logic [7:0] count;
  logic [7:0] data_in; 
  logic load; 
  logic enable;
 

  modport DUT(input clk,rst_n, enable,load, data_in, output count);
  
endinterface
 
  