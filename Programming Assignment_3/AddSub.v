// Anshul Kumar Shandilya
// AddSub.v, 137 Verilog Programming Assignment #3

module TestMod;   
                  
   parameter STDIN = 32'h8000_0000; 							// I/O address of keyboard input channel

   reg [7:0] str [1:3], str1[1:2]; 						
   reg [4:0] X, Y;      										// 5-bit X, Y to sum
   reg Op;
   wire [4:0] S;        										// 5-bit Sum to see as result
   wire C4,C5;             									// like to know this as well from result of adder

   BigAdder BA(X,Y,Op,S,C4,C5);
   
   initial 
   begin
   
      $display("Enter X (two digit 00 ~ 15): ");
      str[1] = $fgetc(STDIN);
      str[2] = $fgetc(STDIN);
	  str[3] = $fgetc(STDIN);
	  X = (str[1] - 48)*10 + (str[2] - 48);
	  
	  $display("Enter Y (two digit 00 ~ 15): ");
      str[1] = $fgetc(STDIN);
      str[2] = $fgetc(STDIN);
	  str[3] = $fgetc(STDIN);
	  Y = (str[1] - 48)*10 + (str[2] - 48);
	  
	  $display("Enter either '+' or '-': ");
	  str1[1] = $fgetc(STDIN);
	  str1[2] = $fgetc(STDIN);
	  
	  if(str1[1] == 43)
		Op = str1[1] + 5;
	  else
		Op = str1[1] + 4;
		
      #20; 		                                        		// wait until adder gets them processed
	  
      $display("X = %b (%d)\tY = %b (%d)\tC0 = %d", X,X,Y,Y,Op);
      $display("Result = %b (as unsigned %d)", S, S);
	  $display("C4 = %b\tC5 = %b\tE = %b",C4,C5,C4^C5);
	  
	  if(C4^C5 == 0)
		$display("Since E is 0, C5 is not needed");
	  else	
		$display("Since E is 1, correct with C5 in front: %b%b", C5, S);
	  
   end
     
endmodule

module BigAdder(X, Y, Op, S, C3, C5);

	input [4:0] X, Y;
	input Op;
	output [4:0] S;        										// S should be similar
	output C3,C5;      											// another output for a different size
	wire C1,C2,C0,C5,Y1,Y2,Y3,Y4;     	

	xor(Y1, Y[0], Op);
	xor(Y2, Y[1], Op);
	xor(Y3, Y[2], Op);
	xor(Y4, Y[3], Op);
	xor(Y5, Y[4], Op);

	FullAdderMod a0(X[0], Y1, Op, S[0], C0);
	FullAdderMod a1(X[1], Y2, C0, S[1], C1);
	FullAdderMod a2(X[2], Y3, C1, S[2], C2);
	FullAdderMod a3(X[3], Y4, C2, S[3], C3);
	FullAdderMod a4(X[4], Y5, C3, S[4], C5);
   
endmodule

module FullAdderMod(X, Y, Cin, S, Cout); 						// single-bit adder module
	
	input X,Y,Cin;
	output Cout,S;
	
	assign S = X ^ Y ^ Cin;
	assign Cout = (X & Cin) | (X & Y) | (Y & Cin);

endmodule