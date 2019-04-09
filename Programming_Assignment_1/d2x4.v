//Name : Anshul Kumar Shandilya
//d2x4.v, 2x4 decoder
// compile: ~changw/ivl/bin/iverilog d2x4.v
 // run: ./a.out

module decoder2x4(s1,s0,o0,o1,o2,o3);

	input s1,s0;
	output o0,o1,o2,o3;
	
	wire s1_inv,s0_inv;
	not (s1_inv,s1);
	not(s0_inv,s0);
	and(o0,s1_inv,s0_inv);
	and(o1,s1_inv,s0);
	and(o2,s1,s0_inv);
	and(o3,s1,s0);
	
endmodule

module d2x4_TestModule;

	reg s1, s0;													// two 1-bit flip flops
	wire o0, o1, o2, o3; 										// Output wires

	decoder2x4 decoder_24(s1, s0, o0, o1, o2, o3);				//Creating instance

	initial begin
		$monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b", $time, s1, s0, o0, o1, o2, o3);
		$display("Time\ts1\ts0\to0\to1\to2\to3");
		$display("--------------------------------------------------");
		#3; 
		$finish;
	end 

	always begin
		s1 = 0 ;s0 = 0;
		#1
		s1 = 0 ; s0 = 1;
		#1
		s1 = 1; s0 = 0;
		#1
		s1 = 1; s0 = 1;
		#1;
	end

endmodule


