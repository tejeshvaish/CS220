module A3Q2_fsm_top;

   reg clk;
   reg [1:0]x;
   wire [3:0]y;

   fsm FSM (clk, x, y);

   always @ (posedge clk) begin
      $display("Time = %d, x = %d, current_state = %d", $time, x, y);
   end

   initial begin
      forever begin
         clk = 0;
         #5
         clk = 1;
         #5
         clk = 0;
      end
   end
/*
S3 2’b00 S4
S3 2’b01 S5
S3 2’b1x S6

S10 2’b00 S11
S10 2’b01, S12
2’b1x
*/
   initial begin
      #3
      x=2'b00;
      #10
      x=2'b00;
      #10
      x=2'b00;
      #10
      x=2'b11;
      #10
      x=2'b10;
      #10
      x=2'b11;
      #10
      x=2'b00;
      #10
      x=2'b00;
      #10
      x=2'b11;
      #10
      x=2'b00;
      #10
      x=2'b00;
   end

   initial begin
      #120
      $finish;
   end

endmodule
