//==================================================================================================
//  Filename      : counter.v
//  Created On    : 2016-04-23 21:35:02
//  Last Modified : 2016-04-23 21:37:44
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module counter(clk,ci,clr,co,q);
	parameter N=4,CounterBits=10;
	input clk,ci,clr;
	output co;
	output reg[N-1:0] q=0;

	assign co=ci&&(q==N-1);
	always @(posedge clk) begin
		if(clr) begin
			q=0;
		end
		else begin
			if(ci) begin
				if(q==N-1) begin
					q=0;
				end
				else begin
					q=q+1;
				end
			end
			else begin
				q=q;
			end
		end
	end

endmodule