//==================================================================================================
//  Filename      : mux_5_to_1.v
//  Created On    : 2016-04-22 21:00:46
//  Last Modified : 2019-02-14 09:21:47
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : N 位五选一数据选择器 
//
//==================================================================================================
module mux_5_to_1(sel,in_0,in_1,in_2,in_3,in_4,out);
	parameter N=4;
	input[N-1:0] in_0,in_1,in_2,in_3,in_4;
	input[2:0] sel;
	output[N-1:0] out;

	reg[N-1:0] temp;
	//N 位五选一数据选择器 
	assign out=temp;
	always@(*) begin
		case (sel)
			0:temp=in_0;
			1:temp=in_1;
			2:temp=in_2;
			3:temp=in_3;
			4:temp=in_4;
			default: temp=0;
		endcase
	end

endmodule