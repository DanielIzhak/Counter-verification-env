// Code your design here

module counter_sv (inf.DUT i_inf
 
);
 

  always_ff @ (posedge i_inf.clk or negedge i_inf.rst_n) begin
    if (!i_inf.rst_n)
    i_inf.count <= 8'h00;
    else if (i_inf.load) begin
  i_inf.count <= i_inf.data_in; 
    end
      else if (i_inf.enable) begin
     i_inf.count <= i_inf.count + 8'h01; 
end
  end

endmodule