//==================================================================================================
//  Filename      : decoder_3_to_5.v
//  Created On    : 2016-04-22 20:54:20
//  Last Modified : 2016-05-16 20:58:26
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 3-5 二进制译码器
//
//
//==================================================================================================
module decoder_3_to_5(data,position);
	input[2:0] data;
	output[4:0] position;
	reg[4:0] temp=0;
	//3-5 二进制译码器
	assign position=temp;
	always @(data) begin
		case (data)
			0:temp<=5'b00001;
			1:temp<=5'b00010;
			2:temp<=5'b00100;
			3:temp<=5'b01000;
			4:temp<=5'b10000;
			default: temp<=5'b00000;
		endcase
	end

endmodule