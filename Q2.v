                module one_bit_comparator (a,b,l_pv,g_pv,e_pv,l,g,e);
                    input a,b,l_pv,g_pv,e_pv;

                    output l,g,e;
                    wire l,g,e;

                    assign l = l_pv | (e_pv & ~a & b);
                    assign g = g_pv | (e_pv & a & ~b);
                    assign e = e_pv & ((a & b) | (~a & ~b));

                endmodule

                module three_bit_comparator (a,b,l_out,g_out,e_out);

                input [2:0]a;
                input [2:0]b;

                output l_out,g_out,e_out; // final output
                wire l_out,g_out,e_out;

                wire [3:0]l;
                wire [3:0]g;
                wire [3:0]e;

                assign l[3] = 1'b0;
                assign g[3] = 1'b0;
                assign e[3] = 1'b1;

                one_bit_comparator FA2 (a [2],b [2],l [3],g [3],e [3],l [2],g [2],e [2]);
                one_bit_comparator FA1 (a [1],b [1],l [2],g [2],e [2],l [1],g [1],e [1]);
                one_bit_comparator FA0 (a [0],b [0],l [1],g [1],e [1],l_out,g_out,e_out);

                endmodule


module min_return (arr,min_index,clk);

input [2:0] arr [0:3];
input clk;

output reg [1:0]min_index;
integer temp_min_index;

reg [2:0] temp_min;
integer i;
reg [2:0] arri;
output wire l_out,g_out,e_out;

three_bit_comparator compare (.a(arri),.b(temp_min),.l_out(l_out),.g_out(g_out),.e_out(e_out));

always @ ( posedge clk ) begin
   //for loop on 4 elements hange temp_max when finds max;
   temp_min_index=0;
   temp_min= arr[temp_min_index];
   
   for (i= 2 ; i<=4 ; i++)  begin
        arri = arr[i];
        if (l_out == 1) begin
            temp_min_index=i;
            temp_min= arr[temp_min_index];
        end
    end
    
    assign min_index=temp_min_index;

end

endmodule
