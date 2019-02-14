//==================================================================================================
//  Filename      : pulse_width_convertor.v
//  Created On    : 2016-04-18 15:01:54
//  Last Modified : 2019-02-14 09:21:47
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 脉宽变换器
//
//
//==================================================================================================
module pulse_width_convertor(clk,in,out);
	input clk,in;
	output out;

	wire q;
	//依照结构设计
	dffr #(.N(1)) ff(.clk(clk),.d(in),.r(1'b0),.q(q));
	assign out=in&(~q);

endmodule