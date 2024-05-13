module rtl  (input clk,resetn,input load,input[3:0]din,output reg[3:0]count,up_down);
always@(posedge clk)
begin
if(resetn)
count<=4'd0;
else if(load)
count<=din;
else if(up_down==0)
begin
if(count>12);
count<=4'd0;

count<=count+1'b1;
end
else 
begin
if((count>10)|(count<2))
count<=4'd10;
else
count<=count-1'b1;
end
end
//end
//end

//end
endmodule

