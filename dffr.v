//==================================================================================================
//  Filename      : dffr.v
//  Created On    : 2016-04-18 14:53:29
//  Last Modified : 2016-05-16 20:58:09
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : D Flip Flop
//
//
//==================================================================================================
module dffr(clk,d,r,q);
	parameter N=1;
	input clk,r;
	input[N-1:0] d;
	output[N-1:0] q;
	reg[N-1:0] q;

	always @(posedge clk) begin
		if(r) begin
			q=0;//置零
		end
		else begin
			q=d;//置数
		end
	end

endmodule