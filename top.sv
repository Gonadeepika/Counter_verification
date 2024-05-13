
module  count_top();
import count_pkg::*;

reg clock;
count_if  DUV_IF(clock);
 
count_test t_h;
count_test t_h1;
count_test t_h2;

rtl xyz(.clk(clock),
.din(DUV_IF.din),
.load(DUV_IF.load),
.up_down(DUV_IF.up_down),
.resetn(DUV_IF.resetn),
.count(DUV_IF.count));


initial
   begin
      clock=1'b0;
      forever
       begin
        #10 clock=~clock;
       end
end

initial
   begin

/*	`ifdef VCS
         $fsdbDumpvars(0, top);
        `endif	*/

     if($test$plusargs("TEST1"))
      begin
        t_h = new(DUV_IF,DUV_IF,DUV_IF);
         
no_of_transactions=500;
          t_h.build();
          t_h.run();
         $finish;
      end

     if($test$plusargs("TEST2"))
      begin
        t_h1 = new(DUV_IF,DUV_IF,DUV_IF);
         
no_of_transactions=500;
          t_h1.build();
          t_h1.run();
         $finish;
      end






if($test$plusargs("TEST3"))
      begin
        t_h2 = new(DUV_IF,DUV_IF,DUV_IF);
         
no_of_transactions=500;
          t_h2.build();
          t_h2.run();
         $finish;
      end


 
   end
endmodule

