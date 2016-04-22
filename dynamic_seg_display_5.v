//==================================================================================================
//  Filename      : dynamic_seg_display_5.v
//  Created On    : 2016-04-21 21:42:19
//  Last Modified : 2016-04-22 21:17:15
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 5 数码管动态显示模块
//
//
//==================================================================================================
module dynamic_seg_display_5(clk,scan,minute,second,m_second,a,b,c,d,e,f,g,dp,position);
	input clk,scan;
	input[3:0] m_second;
	input[7:0] minute,second;
	output a,b,c,d,e,f,g,dp;
	output[4:0] position;

	wire[2:0] counter_data;
	wire[3:0] display_data;

	div_q #(.N(5),.CounterBits(3)) counter(.clk(clk),.ci(scan),.co(),.q(counter_data));
	assign dp=counter_data==1?0:1;
	mux_5_to_1 #(.N(4)) mux(.sel(counter_data),
							.in_0(m_second),.in_1(second[3:0]),.in_2(second[7:4]),
							.in_3(minute[3:0]),.in_4(minute[7:4]),.out(display_data));
	seg_decoder segment_display(.data(display_data),.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g));
	decoder_3_to_5 decoder(.data(counter_data),.position(position));

endmodule