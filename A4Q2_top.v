module A4Q2_top;
reg [3:0] x_curr;
reg [3:0] y_curr;
reg [1:0] step;
reg [1:0] direc;// 0 = north,1=east; 2= south; 3= west;
wire clk;

grid_play play (.clk(clk),.direc(direc),.step(step),.x_out(x_curr),.y_out(y_curr));

always @ (clk or direc or step or x_out or y_out ) begin
   $display ("time: %d; Direction= %d ; Number of Steps =%d; Final Position= (%d,%d)\n",$time,direc,step,x_curr,y_curr);
end

initial begin
   //clk= 1b'1;
   #3
   direc=3;
   step=3;
   #10
   direc=0;
   step=3;
   #10
   direc=1;
   step=1;
   #10
   direc=1;
   step=3;
   #10
   direc=3;
   step=3;
   #10
   direc=2;
   step=0;
   #10
   direc=1;
   step=3;
   #10
   direc=0;
   step=2;
   #10
   direc=3;
   step=2;
   #10
   direc=0;
   step=1;
    #2$finish;
end

always
    begin
    #5 clock = ~clock;
    end

endmodule
