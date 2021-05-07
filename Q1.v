module top;

	reg clk;
	
    reg [31:0]inst[0:7];  

	reg [3:0]w3;  //  for  counting inst that write to $3
	reg [3:0]w4;  //  for  counting inst that write to $4
	reg [3:0]w5;  //  for  counting inst that write to $5
	reg [3:0]w6;  //  for  counting inst that write to $6


	reg [3:0]i; // for counting i inst 
	reg [3:0]j; // for counting j inst 
	reg [3:0]r; // for counting r inst

	reg [2:0]PC; //program counter 3 bits as there are only 8 instions at max


    initial begin

		inst[0]=32'b00100000000001000011010001010110;   //  1st instruction inilization
		inst[1]=32'b00100000000001011111111111111111;   // 2nd instruction inilization
		inst[2]=32'b00000000101001000011000000100000;   // 3rd instruction inilization
		inst[3]=32'b00100000000000110000000000000111;   // 4th instruction inilization
		inst[4]=32'b00000000110000110011000000000100;  // 5th instruction inilization
		inst[5]=32'b00000000000000110001100001000010;  // 6th instruction inilization
		inst[6]=32'b10001100100001011001101010111100;   // 7th instruction inilization
		inst[7]=32'b00001000000100100011010001010110;   // 8th instruction inilization

		PC=3'b000;

		i=4'b0000;
		j=4'b0000;
		r=4'b0000;

		w3=4'b0000;
		w4=4'b0000;
		w5=4'b0000;
		w6=4'b0000;

	end
	
    reg [31:0] curr_inst;

	always @(posedge clk) begin

        curr_inst = inst[PC];

		if(curr_inst[31:26] == 6'b000000)begin
			r<=r+1;
			if(curr_inst[15:11]==5'b00011)begin
				w3<=w3+1;
			end
			else if(curr_inst[15:11]==5'b00100)begin
				w4<=w4+1;
			end
			else if(curr_inst[15:11]==5'b00101)begin
				w5<=w5+1;
			end
			else if(curr_inst[15:11]==5'b00110)begin
				w6<=w6+1;
			end
		end
		
        else if((curr_inst[31:26]==6'b000010) || (curr_inst[31:26]==6'b000011))begin
			j<=j+1;
		end
		
        
        else begin
			i<=i+1;
			if(curr_inst[20:16]==5'b00011)begin
				w3<=w3+1;
			end
			else if(curr_inst[20:16]==5'b00100)begin
				w4<=w4+1;
			end
			else if(curr_inst[20:16]==5'b00101)begin
				w5<=w5+1;
			end
			else if(curr_inst[20:16]==5'b00110)begin
				w6<=w6+1;
			end
		end

		PC<=PC+1;
	end
	
    
    
    
    initial begin
		forever begin
			clk=0;
			#5
			clk=5;
			#5
			clk=0;
		end
	end
	
    
    initial begin
		#81
		$display("Number of I inst = %d\nNumber of J inst = %d\nNumber of R inst = %d", i, j, r);
		$display("Number of insruction which write to $3=%d,$4=%d,$5=%d,$6=%d", w3, w4, w5, w6);
		#1  
		$finish;
	end


endmodule