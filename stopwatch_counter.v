//==================================================================================================
//  Filename      : stopwatch_counter.v
//  Created On    : 2016-04-23 21:29:44
//  Last Modified : 2016-04-23 22:07:17
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 计时模块
//
//
//==================================================================================================
module stopwatch_counter(clk,clr,count,stop,ci,co,q_ms,q_ss,q_mm);
	input clk,clr,ci,count,stop;
	output co;
	output[3:0] q_ms;
	output[7:0] q_mm,q_ss;

	wire ms_co,ss_co,en;

	assign en=ci&&count&&(!stop);
	counter #(.N(10),.CounterBits(4)) ms_counter(.clk(clk),.clr(clr),.q(q_ms),.ci(en),.co(ms_co));
	bcd_counter #(.N(8'b0101_1001)) ss_counter(.clk(clk),.reset(clr),.q(q_ss),.ci(ms_co),.co(ss_co));
	bcd_counter #(.N(8'b0101_1001)) mm_counter(.clk(clk),.reset(clr),.q(q_mm),.ci(ss_co),.co(co));

endmodule