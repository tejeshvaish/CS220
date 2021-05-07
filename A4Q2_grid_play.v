/*module max (x,step,max);
input [3:0] x;
input [1:0] step;
reg [4:0] temp;
//reg [4:0] y = 0;
output wire [3:0] max;

assign temp=(x-step);
if (temp>=0)
 begin
   assign max = temp;
 end
else
 begin
   assign max =0;
 end
endmodule

module min (x,step,min);
input [3:0] x;
input [1:0] step;
reg [4:0]temp;
//input [4:0] y;
output wire [3:0] min;

assign temp = (x+step);
if (temp<15)
 begin
  assign min = temp;
 end
else
 begin
  assign min =15;
 end
endmodule */

module grid_play (clk,direc,step,x_out,y_out);

input [1:0] direc;// 0=north;1=east;2=south;3=west;
input [1:0] step; // number of steps

output wire [3:0] x_out;
output wire [3:0] y_out;

reg [3:0] x_curr;
reg [3:0] y_curr;
//reg [5:0] temp;

initial begin
  x_curr = 0;
  y_curr = 0;
end

always @ (posedge clk ) begin
    if (direc == 0) begin
      min Y_n (.x(y_curr),.step(step),.min(y_out));
    end
    else if (direc == 1) begin
      min X_e (.x(x_curr),.step(step),.min(x_out));
    end
    else if (direc == 2) begin
      max Y_s (.x(y_curr),.step(step),.max(y_out));
    end
    else if (direc == 3) begin
      max X_w (.x(x_curr),.step(step),.max(x_out));
    end
end
