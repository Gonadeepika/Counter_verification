class count_rd_mon;




virtual count_if.RD_MON rdmon_if;





count_trans data2sb,rd_data;





mailbox #(count_trans)mon2sb;





function new(virtual count_if.RD_MON rdmon_if,
mailbox #(count_trans)mon2sb);
begin
this.rdmon_if=rdmon_if;
this.mon2sb=mon2sb;
this.rd_data=new();
end
endfunction





virtual task monitor();
begin
@(rdmon_if.rd_cb);
/*data2send=new trans_h;
gen2dr.put(data2send);
end
end
join_none
endtask
endclass*/



begin
rd_data.count=rdmon_if.rd_cb.count;
rd_data.display("from read monitor");
end
end
endtask









virtual task start();
fork
forever
begin
monitor();
data2sb=new rd_data;
mon2sb.put(data2sb);
end
join_none
endtask
endclass






