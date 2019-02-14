//==================================================================================================
//  Filename      : stopwatch_counter.v
//  Created On    : 2016-04-23 21:29:44
//  Last Modified : 2019-02-14 09:21:45
//  Revision      : final
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
	output[3:0] q_ms;//毫秒
	output[7:0] q_mm,q_ss;//分钟，秒

	wire ms_co,ss_co,en;//毫秒进位，秒进位，使能信号

	assign en=ci&&count&&(!stop);//使能信号
	counter #(.N(10),.CounterBits(4)) ms_counter(.clk(clk),.clr(clr),.q(q_ms),.ci(en),.co(ms_co));//10 进制计数器，毫秒
	bcd_counter #(.N(8'b0101_1001)) ss_counter(.clk(clk),.reset(clr),.q(q_ss),.ci(ms_co),.co(ss_co));//六十进制计数器，秒
	bcd_counter #(.N(8'b0101_1001)) mm_counter(.clk(clk),.reset(clr),.q(q_mm),.ci(ss_co),.co(co));//六十进制计数器，分钟

endmodule