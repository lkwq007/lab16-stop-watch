//==================================================================================================
//  Filename      : div_q.v
//  Created On    : 2016-04-22 09:26:42
//  Last Modified : 2019-02-14 09:21:49
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 可输出状态的 N 分频器/计数器
//
//==================================================================================================
module div_q(clk,ci,co,q);
	parameter N=10,CounterBits=4;
	input clk,ci;
	output co;
	output reg[CounterBits-1:0] q=0;
	//可输出状态的 N 分频器/计数器
	assign co=ci&&(q==N-1);
	always @(posedge clk) begin
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

endmodule