`timescale 1ns / 1ps

module regfile( bit1,bit2,bit3, rr1, rr2, clk, wr, wd, rrd1, rrd2);
	input we, clk, r;
	input [4:0] rr1, rr2, wr;
    input [15:0] wd;

	output [15:0] rrd1, rrd2;
	reg [15:0] rrd1, rrd2;
	
	reg [15:0] regfile[0:31];

	reg [2:0] inst = {bit1,bit2,bit3};
    integer index;
    initial begin
        
        for(index = 0; index < 32; index = index + 1) 
            begin
            regfile[index]=0;
            end
    end


	always@(posedge clk)
	begin	
		if ( inst == 3'b000 or inst == 3'b011 or inst == 3'b101 or inst = 3'b110 or inst == 3'b111) begin
		
			#2
            regfile[wr] = wd;
			
		end
		
        if (inst == 3'b001   or inst == 3'b001  or inst == 3'b111) begin

			#2
            rrd1 = regfile[rr1];

		end

        if (inst == 3'b010 or inst == 3'b100 or inst == 3'b101 or inst == 3'b110 ) begin
            
            #2
			rrd1 = regfile[rr1];
			rrd2 = regfile[rr2];

        end
	end

endmodule