`timescale 1ns/1ps
module tb_alu_4_bit;

  reg[3:0] A,B;
  reg clk,rst;
  reg [2:0]mode;
  wire[7:0]y;
  alu_4_bit uut(
	  .A(A),
          .B(B),
	  .mode(mode),
	  .y(y),
           .clk(clk),
	   .rst(rst)
   );

   always #5 clk=~clk;
   initial begin
             rst=1; A=0; B=0; mode=0; clk=0;

	   #10 rst=0; 

         /*repeat(15) begin
	     #20; 
             A=$random;
             B=$random;
	     mode=$random;
         end
         */ 
	 #30; mode = 3'b000; A = 4'b1010; B = 4'b1000; // ADD   18  carry generate 
	 #30; mode = 3'b001; A = 4'b1010; B = 4'b0010; // SUB   08
         #30; mode = 3'b010; A = 4'b1010; B = 4'b0010; // MUL   20
	 #30; mode = 3'b011; A = 4'b1010; B = 4'b0010; // Div   05
         #30; mode = 3'b100; A = 4'b1010; B = 4'b0010; // AND  0000_0010
	 #30; mode = 3'b101; A = 4'b1011; B = 4'b0010; // OR   0000_1011
         #30; mode = 3'b110; A = 4'b1110; B = 4'b0101; // MUL   70
	 #30; mode = 3'b111; A = 4'b1100; B = 4'b0011; // NOT A  00000_0101
	 #30; mode = 3'b101; A = 4'b1111; B = 4'b0011; // OR     0000_1111   
	 #30; mode = 3'b001; A = 4'b0101; B = 4'b1111; // SUB    -10  => 0001_0110  borrow is generated   
	 #30; mode = 3'b011; A = 4'b1010; B = 4'b0010; //Div
	 #30; mode = 3'b111; A = 4'b1100; B = 4'b0011; //NOT A   0000_1111 carry not generated 
 
      end

   // end

 initial begin 
     $dumpfile("tb_alu_4_bit.vcd");
     $dumpvars(0,tb_alu_4_bit);
    #400;
  $finish;
end
endmodule


