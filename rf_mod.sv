class count_model;



count_trans wr_data;





static  logic [3:0] ref_count=0;



mailbox #(count_trans)wrmon2rm;
mailbox #(count_trans)rm2sb;




function new(mailbox #(count_trans)wrmon2rm,
mailbox #(count_trans)rm2sb);
this.wrmon2rm=wrmon2rm;
this.rm2sb=rm2sb;
endfunction 


virtual task count_mod(count_trans model_counter);
begin
if(model_counter.load)
ref_count<=model_counter.data_in;
wait(model_counter.load==0);
begin
if(model_counter.up_down==0)
begin

if(ref_count>12)
ref_count<=4'd0;
else

ref_count<=ref_count+1'd1;
end
else if(model_counter.up_down==1)
begin
if((ref_count>10)||(ref_count<2))
ref_count<=4'd10;
else
ref_count<=ref_count-1'b1;
end
end
end
endtask





virtual task start();
fork
begin
forever
begin
wrmon2rm.get(wr_data);
count_mod(wr_data);
wr_data.count=ref_count;
rm2sb.put(wr_data);
end
end
join_none
endtask
endclass






