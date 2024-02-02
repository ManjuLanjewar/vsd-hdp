module alu_4_bit(A,B,clk,rst,mode,y);

	input wire [3:0]A,B;
	input clk,rst;
	output reg [7:0]y;
        input[2:0]mode;

    	always@(posedge clk)begin
	   	
        if(rst) begin

	    y<= 8'b0000_0000;
        end
	   // else begin
		case(mode)
           3'b000: y<= A+B;
     	   3'b001: y<= A-B;
	   3'b010: y<= A*B;
	   3'b011: y<= A/B;
	   3'b100: y<= A & B;
	   3'b101: y<= A | B;
 	   3'b110: y<= A ^ B;
	   3'b111: y<= ~A;
           default:y<= 8'b0000_0000;
       endcase
     //  end
      
   end 
endmodule 


