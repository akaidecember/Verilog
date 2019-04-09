//Name :Anshul Kuamr Shandilya
//m4x1.v, 4x1 multiplexer, arrays and modules
// compile: ~changw/ivl/bin/iverilog m4x1array.v
// run: ./a.out

module DecoderMod(s, o); 

   input s;
   output [0:1] o;

   not(o[0], s);
   assign o[1] = s;
   
endmodule

module MUX4x1(s,d,o);

   input [0:1]s;
   input [0:3] d;
   output o;

   wire [0:1] s0,s1;
   wire [0:7]and_out;
   wire [0:1]or_out;

   DecoderMod s0_decoder(s[0], s0); // create instance
   DecoderMod s1_decoder(s[1], s1); // create instance
 

   and(and_out[0], d[0], s1[0]);
   and(and_out[1], and_out[0], s0[0]);

   and(and_out[2], d[1], s1[0]);
   and(and_out[3], and_out[2], s0[1]);

   and(and_out[4], d[2], s1[1]);
   and(and_out[5], and_out[4], s0[0]);

   and(and_out[6], d[3], s1[1]);
   and(and_out[7], and_out[6], s0[1]);

  
  or(or_out[0],and_out[1],and_out[3]);
  or(or_out[1],and_out[5],and_out[7]);
  or(o,or_out[0],or_out[1]);  
  
endmodule

module m4x1array_TestModule;

	reg [0:1] s;
	reg [0:3]d;
	wire o;

	MUX4x1 mux_4x1(s,d,o);

	initial begin

		$monitor("%0d \t%b%b \t%b%b%b%b \t%b  ",$time,s[1],s[0],d[0],d[1],d[2],d[3],o);
		$display("Time\ts. \td...\to");
		#63;
		$finish;
	
	end
	
initial begin

		s[1]=0; s[0]=0; d=4'b0000;
		#1 
		s[1]=0; s[0]=0; d=4'b0001;
		#1
		s[1]=0; s[0]=0; d=4'b0010;
		#1
		s[1]=0; s[0]=0; d=4'b0011;
		#1
		s[1]=0; s[0]=0; d=4'b0100;
		#1
		s[1]=0; s[0]=0; d=4'b0101;
		#1
		s[1]=0; s[0]=0; d=4'b0110;
		#1
		s[1]=0; s[0]=0; d=4'b0111;
		#1
		s[1]=0; s[0]=0; d=4'b1000;
		#1
		s[1]=0; s[0]=0; d=4'b1001;
		#1
		s[1]=0; s[0]=0; d=4'b1010;
		#1
		s[1]=0; s[0]=0; d=4'b1011;
		#1
		s[1]=0; s[0]=0; d=4'b1100;
		#1
		s[1]=0; s[0]=0; d=4'b1101;
		#1
		s[1]=0; s[0]=0; d=4'b1110;
		#1
		s[1]=0; s[0]=0; d=4'b1111;
		#1
		s[1]=0; s[0]=1; d=4'b0000;
		#1
		s[1]=0; s[0]=1; d=4'b0001;
		#1
		s[1]=0; s[0]=1; d=4'b0010;
		#1
		s[1]=0; s[0]=1; d=4'b0011;
		#1
		s[1]=0; s[0]=1; d=4'b0100;
		#1
		s[1]=0; s[0]=1; d=4'b0101;
		#1
		s[1]=0; s[0]=1; d=4'b0110;
		#1
		s[1]=0; s[0]=1; d=4'b0111;
		#1 
		s[1]=0; s[0]=1; d=4'b1000;
		#1 
		s[1]=0; s[0]=1; d=4'b1001;
		#1
		s[1]=0; s[0]=1; d=4'b1010;
		#1
		s[1]=0; s[0]=1; d=4'b1011;
		#1
		s[1]=0; s[0]=1; d=4'b1100;
		#1
		s[1]=0; s[0]=1; d=4'b1101;
		#1
		s[1]=0; s[0]=1; d=4'b1110;
		#1
		s[1]=0; s[0]=1; d=4'b1111;
		#1
		s[1]=1; s[0]=0; d=4'b0000;
		#1
		s[1]=1; s[0]=0; d=4'b0001;
		#1
		s[1]=1; s[0]=0; d=4'b0010;
		#1
		s[1]=1; s[0]=0; d=4'b0011;
		#1
		s[1]=1; s[0]=0; d=4'b0100;
		#1
		s[1]=1; s[0]=0; d=4'b0101;
		#1
		s[1]=1; s[0]=0; d=4'b0110;
		#1
		s[1]=1; s[0]=0; d=4'b0111;
		#1
		s[1]=1; s[0]=0; d=4'b1000;
		#1
		s[1]=1; s[0]=0; d=4'b1001;
		#1
		s[1]=1; s[0]=0; d=4'b1010;
		#1
		s[1]=1; s[0]=0; d=4'b1011;
		#1
		s[1]=1; s[0]=0; d=4'b1100;
		#1
		s[1]=1; s[0]=0; d=4'b1101;
		#1
		s[1]=1; s[0]=0; d=4'b1110;
		#1
		s[1]=1; s[0]=0; d=4'b1111;
		#1
		s[1]=1; s[0]=1; d=4'b0000;
		#1
		s[1]=1; s[0]=1; d=4'b0001;
		#1
		s[1]=1; s[0]=1; d=4'b0010;
		#1
		s[1]=1; s[0]=1; d=4'b0011;
		#1
		s[1]=1; s[0]=1; d=4'b0100;
		#1
		s[1]=1; s[0]=1; d=4'b0101;
		#1
		s[1]=1; s[0]=1; d=4'b0110;
		#1
		s[1]=1; s[0]=1; d=4'b0111;
		#1
		s[1]=1; s[0]=1; d=4'b1000;
		#1
		s[1]=1; s[0]=1; d=4'b1001;
		#1
		s[1]=1; s[0]=1; d=4'b1010;
		#1
		s[1]=1; s[0]=1; d=4'b1011;
		#1 
		s[1]=1; s[0]=1; d=4'b1100;
		#1 
		s[1]=1; s[0]=1; d=4'b1101;
		#1
		s[1]=1; s[0]=1; d=4'b1110;
		#1
		s[1]=1; s[0]=1; d=4'b1111;

	end 
	
endmodule
