//==================================================================================================
//  Filename      : control_2.v
//  Created On    : 2016-04-23 21:13:07
//  Last Modified : 2019-02-14 09:21:54
//  Revision      : final
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 秒表控制器
//
//
//==================================================================================================
module control_2 (clk,button_out,clear,count,stop,reset);
	parameter RESET=2'b00,TIMING=2'b01,END=2'b11;
	input clk,button_out,reset;
	output clear,count,stop;

	reg[1:0] state=RESET;
	assign clear=(state==RESET);//清零
	assign count=(state==TIMING);//计数（计时）
	assign stop=(state==END);//停止
	always @(posedge clk) begin
		if(reset) begin
			state=RESET;//状态重置
		end
		//状态轮换
		case (state)
			RESET: begin
				if(button_out) begin
					state=TIMING;
				end
			end
			TIMING: begin
				if(button_out) begin
					state=END;
				end
			end
			END: begin
				if(button_out) begin
					state=RESET;
				end
			end
		endcase
	end

endmodule