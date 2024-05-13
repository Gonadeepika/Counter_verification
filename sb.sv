class count_sb;


event DONE;
count_trans rm_data;
count_trans sb_data;
count_trans cov_data;

static int ref_data=0, r_data=0, data_verified=0;


mailbox #(count_trans)ref2sb;
mailbox #(count_trans)rdm2sb;
//mailbox #(count_trans) ref2sb;
//mailbox #(count_trans) rdm2sb;

covergroup counter_coverage;
resetn : coverpoint cov_data.resetn {bins resetn = {0};}
Load : coverpoint cov_data.load {bins load = {[0:11]};}
up_down : coverpoint cov_data.up_down {bins up_down = {[0:11]};}
data_in : coverpoint cov_data.data_in { bins data_in = {[0:11]};}
count : coverpoint cov_data.count { bins count = {[0:11]};}
ldxdin : cross Load,data_in;
moxldxxin: cross up_down,Load,data_in;
endgroup


function new(mailbox #(count_trans)ref2sb,
mailbox #(count_trans)rdm2sb);
this.ref2sb=ref2sb;
this.rdm2sb=rdm2sb;
counter_coverage=new();
endfunction





virtual task start();
fork
forever   
begin
ref2sb.get(rm_data);
ref_data++;
rdm2sb.get(sb_data);
r_data++;
check(sb_data);

end

join_none
endtask









virtual task check(count_trans rdata);
begin
if(rm_data.count==rdata.count)
$display("count matches");
else
$display("count not matching");
end
cov_data=rm_data;
counter_coverage.sample();
data_verified++;
if(data_verified >=no_of_transactions+2);
begin
-> DONE;

end
endtask




virtual function void report();
$display("-------- SCOREBOARD REPORT-------");
$display("data generated =%d", rm_data);
$display("data verified =%d", data_verified);
$display("------------");
endfunction
endclass



