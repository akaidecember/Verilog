// Anshul Kumar Shandilya
// adder.v, 137 Verilog Programming Assignment #2

module TestMod;   
                  
   parameter STDIN = 32'h8000_0000; 								// I/O address of keyboard input channel

   reg [7:0] str [1:3]; 											// typing in 2 chars at a time (decimal # and Enter key)
   reg [4:0] X, Y;      										// 5-bit X, Y to sum
   wire [4:0] S;        										// 5-bit Sum to see as result
   wire C5;             										// like to know this as well from result of adder

   BigAdder BA(X,Y,S,C5);

   initial 
   begin
   
      $display("Enter X (two digit 00~15 since max is 01111): ");
      str[1] = $fgetc(STDIN);
      str[2] = $fgetc(STDIN);
	  str[3] = $fgetc(STDIN);
	  X = (str[1] - 48)*10 + (str[2] - 48);
	  
	  $display("Enter Y (two digit 00~15 since max is 01111): ");
      str[1] = $fgetc(STDIN);
      str[2] = $fgetc(STDIN);
	  str[3] = $fgetc(STDIN);
	  Y = (str[1] - 48)*10 + (str[2] - 48);

      #10; 		                                        		// wait until adder gets them processed
	  
      $display("X = %d (%b)\tY = %d (%b)", X,X,Y,Y);
      $display("Result = %d (%b) and C5 = %d", S, S, C5);
	  
   end
   
endmodule

module BigAdder(X, Y, S, C5);

	input [4:0] X, Y;   											// two 5-bit input items
	output [4:0] S;        										// S should be similar
	output C5;      											// another output for a different size
	wire C0,C1,C2,C3;      										// declare temporary wires

	FullAdderMod a0(X[0], Y[0], 1'b0 , S[0], C0);
	FullAdderMod a1(X[1], Y[1], C0, S[1], C1);
	FullAdderMod a2(X[2], Y[2], C1, S[2], C2);
	FullAdderMod a3(X[3], Y[3], C2, S[3], C3);
	FullAdderMod a4(X[4], Y[4], C3, S[4], C5);
   
endmodule

module FullAdderMod(X, Y, Cin, S, Cout); 						// single-bit adder module
	
	input X,Y,Cin;
	output Cout,S;
	
	//[Cout,S] = X + Y + Cin;
	assign S = X ^ Y ^ Cin;
	assign Cout = (X & Cin) | (X & Y) | (Y & Cin);

	
endmodule