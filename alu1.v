module alu1(in1, in2, cin, opcode, out, cout);

   input in1;
   input in2;
   input cin;
   input opcode;


   wire b;
   assign b = xor(in2,opcode);

   output out;
   wire out;
   output cout;
   wire cout;



   assign out = in1 ^ b ^ cin;
   assign cout = (in1 & b) | (b & cin) | (cin & in1);

endmodule
