//==================================================================================================
//  Filename      : button_press_unit.v
//  Created On    : 2016-04-21 20:51:47
//  Last Modified : 2016-05-16 20:54:27
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 按键处理模块
//
//
//==================================================================================================
module button_press_unit(clk,timer_en,reset,button_in,button_out);
	input clk,button_in,timer_en,reset;
	output button_out;

	wire syn_out,avoid_out,timer_done,timer_clr;

	synchronizer syn(.clk(clk),.asynch_in(button_in),.reset(1'b0),.synch_out(syn_out));//同步器
	timer #(.N(12),.CounterBits(4)) timer(.clk(clk),.ci(timer_en),.co(timer_done),.clr(timer_clr));//30 ms计时器
	avoid_trembling avoid(.clk(clk),.reset(reset),.in(syn_out),.out(avoid_out),.timer_done(timer_done),.timer_clr(timer_clr));//控制器
	pulse_width_convertor pw_convertor(.clk(clk),.in(avoid_out),.out(button_out));//脉宽变换

endmodule