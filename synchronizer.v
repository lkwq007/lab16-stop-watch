//==================================================================================================
//  Filename      : synchronizer.v
//  Created On    : 2016-04-18 15:06:06
//  Last Modified : 2019-02-14 09:21:43
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 同步器
//
//
//==================================================================================================
module synchronizer(asynch_in,clk,reset,synch_out);
	input asynch_in,clk,reset;//asynch_in 异步输入
	output synch_out;//同步输出
	wire q;
	//结构描述
	dffr #(.N(1)) ff_1(.d(asynch_in),.clk(clk),.r(reset),.q(q));
	dffr #(.N(1)) ff_2(.d(q),.clk(clk),.r(reset),.q(synch_out));

endmodule