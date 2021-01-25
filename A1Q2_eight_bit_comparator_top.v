module eight_bit_comparator_top;

   reg [7:0] A;
   reg [7:0] B;

   wire l_out,g_out,e_out;

   eight_bit_comparator COMPARE (.a(A), .b(B), .l_out(l_out), .g_out(g_out), .e_out(e_out));

   always @ (A or B or l_out or g_out or e_out) begin
        #0 $display("<%d> : A = %d , B = %d , less = %d , equal = %b , greater = %b \n",$time, A, B,l_out,e_out,g_out);
   end

   initial begin
      #30
      $finish;
   end

   //testbench
   initial begin

      A = 0; B = 0;
      #5
      A =25; B =25;
      #5
      A = 128; B =127;
      #5
      A =39; B =16;
      #5
      A =37; B =79;
      #5
      A =20; B =100;
    end

endmodule
