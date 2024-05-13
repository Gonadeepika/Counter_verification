interface count_if(input bit clock);


logic [3:0] din;
logic [3:0] count;
logic load;
logic up_down;
logic resetn;




clocking dr_cb @(posedge clock);
default input #1 output #1;
output din;
output load;
output up_down;
endclocking






clocking wr_cb @(posedge clock);
default input #1 output #1;
input din;
input load;
input up_down;
endclocking





clocking rd_cb @(posedge clock);
default input #1 output #1;
input count;
endclocking


modport DRV (clocking dr_cb);



modport WR_MON(clocking wr_cb);



modport RD_MON(clocking rd_cb);


endinterface




