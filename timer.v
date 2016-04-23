//==================================================================================================
//  Filename      : timer.v
//  Created On    : 2016-04-18 14:58:26
//  Last Modified : 2016-04-23 21:05:54
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : Timer
//
//
//==================================================================================================
module timer(clk,clr,ci,co);
	parameter N=12,CounterBits=4;
	input clk,clr,ci;
	output co;
	reg[CounterBits-1:0] temp=0;

	assign co=ci&&(temp==N-1);
	always @(posedge clk) begin
		if(clr) begin
			temp=0;
		end
		else begin
			if(ci) begin
				temp=temp+1;
			end
			else begin
				temp=temp;
			end
		end
	end

endmodule