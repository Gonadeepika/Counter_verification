class count_driver;
virtual count_if.DRV dr_if;




count_trans data2drv;



mailbox#(count_trans)gen2dr;




function new(virtual count_if.DRV dr_if,
mailbox #(count_trans)gen2dr);
begin
this.dr_if=dr_if;
this.gen2dr=gen2dr;
end
endfunction






virtual task drive;
begin
@(dr_if.dr_cb);
dr_if.dr_cb.load<=data2drv.load;
dr_if.dr_cb.din<=data2drv.data_in;
dr_if.dr_cb.up_down<=data2drv.up_down;
end
endtask


virtual task start;
fork
forever
begin
gen2dr.get(data2drv);
drive();
end
join_none
endtask
endclass







 
