package  count_pkg;


int no_of_transactions=1;

`include "count_trans.sv"
`include "gen.sv"
`include "wr_drv.sv"
`include "wr_mon.sv"
`include "rd_mon.sv"
`include "rf_mod.sv"

`include "sb.sv"
`include "counter_env.sv"
`include "test.sv"

endpackage

	
