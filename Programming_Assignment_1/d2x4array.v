//Name : Anshul Kumar Shandilya
//d2x4array.v, 2x4 decoder, arrays and modules
// compile: ~changw/ivl/bin/iverilog d2x4array.v
// run: ./a.out

module decoder2x4(s,o);

	input [1:0] s;
	output [3:0] o;
	
	wire [1:0] s_inv;
	not (s_inv[1],s[1]);
	not(s_inv[0],s[0]);
	and(o[0],s_inv[1],s_inv[0]);
	and(o[1],s_inv[1],s[0]);
	and(o[2],s[1],s_inv[0]);
	and(o[3],s[1],s[0]);
	
endmodule

module d2x4array_TestModule;
   reg [1:0]s;											// Input 
   wire [3:0]o;										 	// Output wires

   decoder2x4 decoder_24(s,o);

   initial begin
      $monitor("%0d \t%b%b\t%b%b%b%b", $time, s[1], s[0], o[0], o[1], o[2], o[3]);
      $display("Time\ts\to");
      $display("--------------------------------------------------");
	  #3;
	  $finish;
   end  

	always begin

		s[1] = 0 ;s[0] = 0;
		#1
		s[1] = 0 ; s[0] = 1;
		#1
		s[1]= 1; s[0] = 0;
		#1
		s[1] = 1; s[0] = 1;
		#1;
	end

endmodule


