//==================================================================================================
//  Filename      : counter.v
//  Created On    : 2016-04-23 21:35:02
//  Last Modified : 2016-05-16 20:57:13
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : N 进制计数器
//
//
//==================================================================================================
module counter(clk,ci,clr,co,q);
	parameter N=10,CounterBits=4;
	input clk,ci,clr;
	output co;
	output reg[CounterBits-1:0] q=0;

	assign co=ci&&(q==N-1);//进位
	always @(posedge clk) begin
		if(clr) begin
			q=0;//清零
		end
		//计数
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