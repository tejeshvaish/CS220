`timescale 1ns / 1ps

module processor(in, inst,op, rr1_wr, rr2_wd, we, 
	cf, zf, sf, inv, clk, 
	sf_e, e, rs, rw, d, c, b, a);


	input [2:0] in;

    input [4:0] reg_number;

	input clk;
	
    input [4:0] op,rr1_wr, rr2_wd;
	
	output cf, inv;

	reg inv;
	
	wire [15:0] ans;
	reg  opcode;
	reg [15:0] read_reg_1, read_reg_2;
	reg [15:0] write_reg, write_data;
    
	wire [15:0] rrd1, rrd2;
	

	regfile regfile_instance ( 
		.bit1(in[0]),
        .bit2(in[1]),
        .bit3(in[2]), 
		.clk(clk), 
		.rr1(read_reg_1), 
		.rr2(read_reg_2), 
		.wr(write_reg), 
		.wd(write_data), 
		.rrd1(rrd1), 
		.rrd2(rrd2)
	);

	alu4 alu4_instance (
		.in1(rrd1), 
		.in2(rrd2), 
		.opcode(opcode), 
		.ans(ans), 
		.cf(cf), 
		
	);
	
	always@(posedge clk)
	    begin
			if (in == 3'b000) begin
				
				write_reg = op;
			    write_data = ans;
				
			end

			else if (in == 3'b001) begin
				
					read_reg_1 = instruction;
				
			end

            else if (in == 3'b010) begin
                
                read_reg_1 = instruction;

            end


			else begin
				inv = 1;
			end
			
		end
	   
       

	end

endmodule