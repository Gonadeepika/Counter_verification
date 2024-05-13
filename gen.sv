class count_gen;
count_trans trans_h;
count_trans data2send;



mailbox #(count_trans)gen2dr;




function new (mailbox #(count_trans)gen2dr);
this.gen2dr=gen2dr;
this.trans_h=new;
endfunction





virtual task start;
fork
begin
for(int i=0; i<no_of_transactions; i++)
begin
assert(this.trans_h.randomize());
data2send=new trans_h;
gen2dr.put(data2send);
end
end
join_none
endtask
endclass






