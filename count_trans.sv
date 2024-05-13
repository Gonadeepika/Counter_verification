 class count_trans;


rand logic [3:0] data_in;
rand logic load;
rand logic up_down;
logic resetn;
logic [3:0] count;




constraint c1{data_in inside {[2:0]};}

constraint c3 {load dist {1:=30,0:=70};}
constraint c4 {up_down dist {0:=50, 1:=50};}


/*function void post_randomize();
if(load==1||load==0)
no_of_load++;
if(mode==1||mode==0)
no_of_mode++;
endfunction*/



virtual function void display(input string s);
begin
$display("-----------%s-------",s);
$display("up_down=%d", up_down);
$display("load=%d", load);
$display("data_in=%d", data_in);
$display("count=%d", count);
$display("resetn=%d", resetn);
$display("--------");
end
endfunction
endclass

