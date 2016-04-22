//==================================================================================================
//  Filename      : button_press_unit.v
//  Created On    : 2016-04-21 20:51:47
//  Last Modified : 2016-04-21 21:34:25
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 按键处理模块
//
//
//==================================================================================================
module button_press_unit(clk,timer_en,reset,button_in,button_out);
	input clk,button_in;
	output button_out;

	wire syn_out,avoid_out;

	synchronizer syn(.clk(clk),.asynch_in(button_in),.reset(0),.synch_out(syn_out));
	avoid_trembling avoid(.clk(timer_en),.reset(reset),.in(syn_out),.out(avoid_out));
	pulse_width_convertor pw_convertor(.clk(clk),.in(avoid_out),.out(button_out));

endmodule