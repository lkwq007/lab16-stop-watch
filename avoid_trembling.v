//==================================================================================================
//  Filename      : avoid_trembling.v
//  Created On    : 2016-04-18 15:01:39
//  Last Modified : 2019-02-14 09:21:59
//  Revision      : final version
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 防颤模块控制器
//
//
//==================================================================================================
module avoid_trembling(clk,reset,in,out,timer_clr,timer_done);
	parameter HIGH=0,WAIT_LOW=1,LOW=2,WAIT_HIGH=3;
	input clk,reset,in,timer_done;
	output out,timer_clr;
	
	reg[1:0] state=HIGH;

	assign out=state==HIGH?0:1;//非 HIGH 状态输出为高电平
	assign timer_clr=(state==HIGH||state==LOW);//HIGH 与 LOW 状态保证定时器清零
	always @(posedge clk) begin
		if(reset) begin
			state=HIGH;
		end
		case(state)
			HIGH: begin
				if(in==0) begin
					state=WAIT_LOW;//出现低电平，进入 WAIT_LOW 状态，同时计时器开始工作
				end
			end
			WAIT_LOW: begin
				if(timer_done) begin
					state=LOW;//计时结束，进入 LOW 状态，计时器保持清零
				end
			end
			LOW: begin
				if(in) begin
					state=WAIT_HIGH;//出现高电平，进入 WAIT_HIGH 状态，计时器开始工作
				end
			end
			WAIT_HIGH: begin
				if(timer_done) begin
					state=HIGH;//计时结束，恢复 HIGH 状态
				end
			end
		endcase
	end

endmodule