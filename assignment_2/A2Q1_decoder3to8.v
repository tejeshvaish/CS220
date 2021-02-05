module decoder3to8 (Y , a);

 input [2:0] Y; // Y represents form Y2 Y1 Y0 //i.e. 110 represents Y2=1,Y1=1,Y0=0 i.e. 6 .
 output [7:0] a; // a represents form a0 a1 a2 a3 a4 a5 a6 a7 //i.e. 00000010 represents a0=0 a1=0 a2=0 a3=0 a4=0 a5=0 a6=1 a7=0 .
 wire [7:0] a;

 // using SoP ways to represent a_i.
 assign a[0] = ~Y[2] & ~Y[1] & ~Y[0];
 assign a[1] = ~Y[2] & ~Y[1] & Y[0];
 assign a[2] = ~Y[2] & Y[1] & ~Y[0];
 assign a[3] = ~Y[2] & Y[1] & Y[0];
 assign a[4] = Y[2] & ~Y[1] & ~Y[0];
 assign a[5] = Y[2] & ~Y[1] & Y[0];
 assign a[6] = Y[2] & Y[1] & ~Y[0];
 assign a[7] = Y[2] & Y[1] & Y[0];

endmodule
