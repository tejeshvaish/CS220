
`define TICK #2

module fsm (clk, x, y);

   input clk;
   
   input [1:0] x;

   output [3:0]y;

   wire [3:0]y;

   reg [3:0] states;

   reg [2:0] micro[12:0];
   reg [3:0] dis3[3:0];
   reg [3:0] dis10[3:0];

   wire [2:0] minstr;



   initial begin
      states = 0;
  
      micro[0]=0;
      micro[1]=0;
      micro[2]=0;
      micro[3]=1;
      micro[4]=3;
      micro[5]=3;
      micro[6]=0;
      micro[7]=0;
      micro[8]=0;
      micro[9]=0;
      micro[10]=2;
      micro[11]=4;
      micro[12]=4;

      dis3[0]= 4'b0100;
      dis3[1]= 4'b0101;
      dis3[2]= 4'b0110;
      dis3[3]= 4'b0110;

      dis10[0]=4'b1011;
      dis10[1]=4'b1100;
      dis10[2]=4'b1100;
      dis10[3]=4'b1100;

   end

 
   
   
   assign minstr = micro[states];
   assign y = states;
  
   
   always @(posedge clk)

      begin 
      
      case (minstr) 
      
      0: begin
      states = `TICK states + 1;
      end

      1: begin

      states = `TICK dis3[x];
      
      end



      2: begin
      
      states =`TICK  dis10[x];

      end

      3: begin
      
      states =`TICK  4'b0111;
      
      end

      
      4: begin

      states = `TICK 4'b0000;
      end

      endcase


end






endmodule
