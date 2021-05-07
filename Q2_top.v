module min_return_top;
reg [2:0] arr [0:3];
wire [1:0] min_index;
reg clk;

min_return MIN (.arr(arr),.min_index(min_index),.clk(clk));

always @ ( posedge clk or min_index  ) begin
   $display ("time: %d; arr_1 = %b; arr_2 = %b; arr_3 = %b; arr_4 = %b; min_index = %d\n",$time,arr[0],arr[1],arr[2],arr[3],min_index);
end

initial
  begin
   arr[0]=2;
   arr[1]=3;
   arr[2]=4;
   arr[3]=1;
   $display("\n");

   #10
   arr[0]=0;
   arr[1]=2;
   arr[2]=0;
   arr[3]=1;
   $display("\n");

   #10
   arr[0]=7;
   arr[1]=3;
   arr[2]=5;
   arr[3]=6;
   $display("\n");

   #10
   arr[0]=5;
   arr[1]=4;
   arr[2]=1;
   arr[3]=4;
   $display("\n");

   #10
   arr[0]=4;
   arr[1]=0;
   arr[2]=6;
   arr[3]=0;
   $display("\n");

   #10
   arr[0]=5;
   arr[1]=4;
   arr[2]=5;
   arr[3]=1;
   $display("\n");
   #10
   arr[0]=3;
   arr[1]=3;
   arr[2]=3;
   arr[3]=3;
   $display("\n");

   #10
   arr[0]=6;
   arr[1]=3;
   arr[2]=3;
   arr[3]=2;
   $display("\n");

   #10
   arr[0]=2;
   arr[1]=7;
   arr[2]=1;
   arr[3]=5;
   $display("\n");

   #10
   arr[0]=5;
   arr[1]=2;
   arr[2]=4;
   arr[3]=6;
   $display("\n");

   #10 $finish;

  end

always
    begin
     clk = 0;
     #5
     clk =1;
     #5
     clk =0;
    end

endmodule
