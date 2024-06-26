// Anshul Kumar Shandilya
// count16.v, Verilog Programming Assignment #4

module TestMod;
   reg CLK;
   wire [0:15] Q;
   wire [3:0] C;

   always begin // this is clock wave
      CLK = 0;  // 0 for half cycle (#1)
      #1;
      CLK = 1;  // 1 for half cycle (#1)
      #1;
   end

   RippleMod my_ripple(CLK, Q);
   CoderMod my_coder(Q, C);

   initial #36 $finish;
   
   initial begin
      $display("Time\tCLK\t Q\t\t\t\t\tC\t\t C");
      $monitor("%4d\t%3d\t %b\t%b\t%2d", $time, CLK, Q, C, C);
   end
   
endmodule

module CoderMod(Q, C);

   input [0:15] Q;
   output [3:0] C;
   
   or(C[0], Q[1], Q[3], Q[5], Q[7], Q[9], Q[11], Q[13], Q[15]);
   or(C[1], Q[2], Q[3], Q[6], Q[7], Q[10], Q[11], Q[14], Q[15]);
   or(C[2], Q[4], Q[5], Q[6], Q[7], Q[12], Q[13], Q[14], Q[15]);
   or(C[3], Q[8], Q[9], Q[10], Q[11], Q[12], Q[13], Q[14], Q[15]);
   
endmodule

module RippleMod(CLK, Q);

   input CLK;
   output [0:15] Q;
   reg [0:15] Q;

   initial Q = 16'b1000000000000000;

   always @(posedge CLK) begin
      Q[0]  <= Q[15];
      Q[1]  <= Q[0];
      Q[2]  <= Q[1];
      Q[3]  <= Q[2];
      Q[4]  <= Q[3];
      Q[5]  <= Q[4];
      Q[6]  <= Q[5];
      Q[7]  <= Q[6];
      Q[8]  <= Q[7];
      Q[9]  <= Q[8];
      Q[10] <= Q[9];
      Q[11] <= Q[10];
      Q[12] <= Q[11];
      Q[13] <= Q[12];
      Q[14] <= Q[13];
      Q[15] <= Q[14];
   end

endmodule


