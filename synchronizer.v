//==================================================================================================
//  Filename      : synchronizer.v
//  Created On    : 2016-04-18 15:06:06
//  Last Modified : 2016-04-18 15:09:21
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module synchronizer(asynch_in,clk,reset,synch_out);
	input asynch_in,clk,reset;
	output synch_out;
	wire q;

	dffr #(.N(1)) ff_1(.d(asynch_in),.clk(clk),.reset(r),.q(q));
	dffr #(.N(1)) ff_2(.d(q),.clk(clk),.reset(r),.q(synch_out));

endmodule