//==================================================================================================
//  Filename      : dffr.v
//  Created On    : 2016-04-18 14:53:29
//  Last Modified : 2016-04-18 15:06:48
//  Revision      : alpha v20160418
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
			q=0;
		end
		else begin
			q=d;
		end
	end

endmodule