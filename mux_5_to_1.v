//==================================================================================================
//  Filename      : mux_5_to_1.v
//  Created On    : 2016-04-22 21:00:46
//  Last Modified : 2016-04-22 21:06:40
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 五选一数据选择器
//
//
//==================================================================================================
module mux_5_to_1(sel,in_0,in_1,in_2,in_3,in_4,out);
	parameter N=4;
	input[N-1:0] in_0,in_1,in_2,in_3,in_4;
	input[2:0] sel;
	output[N-1:0] out;

	reg[N-1:0] temp;

	assign out=temp;
	always@(*) begin
		case (sel)
			0:temp=in_0;
			1:temp=in_1;
			2:temp=in_2;
			3:temp=in_3;
			4:temp=in_4;
	end

endmodule