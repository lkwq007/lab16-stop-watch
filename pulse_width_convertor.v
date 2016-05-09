//==================================================================================================
//  Filename      : pulse_width_convertor.v
//  Created On    : 2016-04-18 15:01:54
//  Last Modified : 2016-04-18 15:06:55
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module pulse_width_convertor(clk,in,out);
	input clk,in;
	output out;

	wire q;

	dffr #(.N(1)) ff(.clk(clk),.d(in),.r(1'b0),.q(q));
	assign out=in&(~q);

endmodule