//Name :Anshul Kumar Shandilya
//m4x1.v, 4x1 multiplexer, gate synthesis
// compile: ~changw/ivl/bin/iverilog m4x1.v
// run: ./a.out

module MUX4x1(s1,s0,d0,d1,d2,d3,o);

	input s1,s0,d0,d1,d2,d3;	
	output o;	
	wire s1_inv, s0_inv, and_out0, and_out1, and_out2, and_out3, and_out4, and_out5, and_out6, and_out7, or_out0, or_out1;


	not(s1_inv,s1);
	not(s0_inv,s0);

   and(and_out0, d0, s1_inv);
   and(and_out1, and_out0, s0_inv);

   and(and_out2, d1, s1_inv);
   and(and_out3, and_out2, s0);

   and(and_out4, d2, s1);
   and(and_out5, and_out4, s0_inv);

   and(and_out6, d3, s1);
   and(and_out7, and_out6, s0);

   or(or_out0,and_out1,and_out3);
   or(or_out1,and_out5,and_out7);
   or(o,or_out0,or_out1);
   
endmodule

module m4x1_TestModule;

	reg s1,s0,d0,d1,d2,d3;
	wire o;

	MUX4x1 mux_4x1(s1,s0,d0,d1,d2,d3,o);

	initial begin
		$monitor("%0d\t%b\t%b \t%b \t%b \t%b \t%b \t%b  ",$time,s1,s0,d0,d1,d2,d3,o);
		$display("Time\ts1\ts0\td0\td1\td2\td3\to");
		#63;
		$finish;
	end

	initial begin
	
		s1=0; s0=0; d0=0; d1=0; d2=0; d3=0;
		#1 
		s1=0; s0=0; d0=0; d1=0; d2=0; d3=1;
		#1
		s1=0; s0=0; d0=0; d1=0; d2=1; d3=0;
		#1
		s1=0; s0=0; d0=0; d1=0; d2=1; d3=1;
		#1
		s1=0; s0=0; d0=0; d1=1; d2=0; d3=0;
		#1
		s1=0; s0=0; d0=0; d1=1; d2=0; d3=1;
		#1
		s1=0; s0=0; d0=0; d1=1; d2=1; d3=0;
		#1 
		s1=0; s0=0; d0=0; d1=1; d2=1; d3=1;
		#1
		s1=0; s0=0; d0=1; d1=0; d2=0; d3=0;
		#1
		s1=0; s0=0; d0=1; d1=0; d2=0; d3=1;
		#1
		s1=0; s0=0; d0=1; d1=0; d2=1; d3=0;
		#1 
		s1=0; s0=0; d0=1; d1=0; d2=1; d3=1;
		#1 
		s1=0; s0=0; d0=1; d1=1; d2=0; d3=0;
		#1
		s1=0; s0=0; d0=1; d1=1; d2=0; d3=1;
		#1
		s1=0; s0=0; d0=1; d1=1; d2=1; d3=0;
		#1
		s1=0; s0=0; d0=1; d1=1; d2=1; d3=1;
		#1
		s1=0; s0=1; d0=0; d1=0; d2=0; d3=0;
		#1
		s1=0; s0=1; d0=0; d1=0; d2=0; d3=1;
		#1
		s1=0; s0=1; d0=0; d1=0; d2=1; d3=0;
		#1
		s1=0; s0=1; d0=0; d1=0; d2=1; d3=1;
		#1
		s1=0; s0=1; d0=0; d1=1; d2=0; d3=0;
		#1
		s1=0; s0=1; d0=0; d1=1; d2=0; d3=1;
		#1
		s1=0; s0=1; d0=0; d1=1; d2=1; d3=0;
		#1
		s1=0; s0=1; d0=0; d1=1; d2=1; d3=1;
		#1
		s1=0; s0=1; d0=1; d1=0; d2=0; d3=0;
		#1
		s1=0; s0=1; d0=1; d1=0; d2=0; d3=1;
		#1
		s1=0; s0=1; d0=1; d1=0; d2=1; d3=0;
		#1
		s1=0; s0=1; d0=1; d1=0; d2=1; d3=1;
		#1
		s1=0; s0=1; d0=1; d1=1; d2=0; d3=0;
		#1
		s1=0; s0=1; d0=1; d1=1; d2=0; d3=1;
		#1
		s1=0; s0=1; d0=1; d1=1; d2=1; d3=0;
		#1
		s1=0; s0=1; d0=1; d1=1; d2=1; d3=1;
		#1
		s1=1; s0=0; d0=0; d1=0; d2=0; d3=0;
		#1
		s1=1; s0=0; d0=0; d1=0; d2=0; d3=1;
		#1
		s1=1; s0=0; d0=0; d1=0; d2=1; d3=0;
		#1
		s1=1; s0=0; d0=0; d1=0; d2=1; d3=1;
		#1
		s1=1; s0=0; d0=0; d1=1; d2=0; d3=0;
		#1 
		s1=1; s0=0; d0=0; d1=1; d2=0; d3=1;
		#1 
		s1=1; s0=0; d0=0; d1=1; d2=1; d3=0;
		#1 
		s1=1; s0=0; d0=0; d1=1; d2=1; d3=1;
		#1 
		s1=1; s0=0; d0=1; d1=0; d2=0; d3=0;
		#1 
		s1=1; s0=0; d0=1; d1=0; d2=0; d3=1;
		#1
		s1=1; s0=0; d0=1; d1=0; d2=1; d3=0;
		#1
		s1=1; s0=0; d0=1; d1=0; d2=1; d3=1;
		#1 
		s1=1; s0=0; d0=1; d1=1; d2=0; d3=0;
		#1 
		s1=1; s0=0; d0=1; d1=1; d2=0; d3=1;
		#1 
		s1=1; s0=0; d0=1; d1=1; d2=1; d3=0;
		#1 
		s1=1; s0=0; d0=1; d1=1; d2=1; d3=1;
		#1 
		s1=1; s0=1; d0=0; d1=0; d2=0; d3=0;
		#1 
		s1=1; s0=1; d0=0; d1=0; d2=0; d3=1;
		#1 
		s1=1; s0=1; d0=0; d1=0; d2=1; d3=0;
		#1
		s1=1; s0=1; d0=0; d1=0; d2=1; d3=1;
		#1
		s1=1; s0=1; d0=0; d1=1; d2=0; d3=0;
		#1
		s1=1; s0=1; d0=0; d1=1; d2=0; d3=1;
		#1
		s1=1; s0=1; d0=0; d1=1; d2=1; d3=0;
		#1
		s1=1; s0=1; d0=0; d1=1; d2=1; d3=1;
		#1
		s1=1; s0=1; d0=1; d1=0; d2=0; d3=0;
		#1
		s1=1; s0=1; d0=1; d1=0; d2=0; d3=1;
		#1 
		s1=1; s0=1; d0=1; d1=0; d2=1; d3=0;
		#1
		s1=1; s0=1; d0=1; d1=0; d2=1; d3=1;
		#1
		s1=1; s0=1; d0=1; d1=1; d2=0; d3=0;
		#1
		s1=1; s0=1; d0=1; d1=1; d2=0; d3=1;
		#1
		s1=1; s0=1; d0=1; d1=1; d2=1; d3=0;
		#1
		s1=1; s0=1; d0=1; d1=1; d2=1; d3=1;
		
	end 
	
endmodule
