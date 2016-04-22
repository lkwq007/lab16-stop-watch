//==================================================================================================
//  Filename      : div_q.v
//  Created On    : 2016-04-22 09:26:42
//  Last Modified : 2016-04-22 09:30:18
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 输出状态的分频器/计数器
//
//
//==================================================================================================
module div_q(clk,ci,co,q);
	parameter N=4,CounterBits=10;
	input clk,ci;
	output co;
	output reg[N-1:0] q=0;

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