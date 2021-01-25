/* Implement an eight-bit ripple carry adder using eight one-bit full adders.
Organize the design as follows.
Write a module for one-bit full adder. 
Write another module for eight-bit ripple carry adder that instantiates
eight one-bit full adders and connects them properly to build an eight-bit ripple carry adder. 
Write a top
module to test the eight-bit adder. Make sure to display your inputs, sum, and carry out. 
Your top module
must have ten different inputs. Put one time unit delay between consecutive inputs. 
Place one module in one
verilog file i.e., you will have three verilog files. As a hint, the module skeletons are given below.*/

module one_bit_full_adder (a, b, cin, sum, cout);

   input a;
   input b;
   input cin;

   output sum;
   wire sum;
   output cout;
   wire cout;
   
  
   assign sum  = a^b^cin; // sum bit
   assign cout = ((a&b) | (b&cin) | (a&cin)); //carry bit
      // $display("time=%d: %b + %b + %b = %b, cout = %b\n",$time,a,b,cin,sum,cout);
      
endmodule
