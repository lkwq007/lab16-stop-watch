//==================================================================================================
//  Filename      : avoid_trembling.v
//  Created On    : 2016-04-18 15:01:39
//  Last Modified : 2016-04-23 21:45:15
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module avoid_trembling(clk,reset,in,out,timer_clr,timer_done);
	parameter HIGH=0,WAIT_LOW=1,LOW=2,WAIT_HIGH=3;
	input clk,reset,in,timer_done;
	output out;
	output reg timer_clr;
	
	reg[1:0] state=HIGH;

	assign out=state==HIGH?0:1;
	always @(posedge clk) begin
		if(reset) begin
			state=HIGH;
		end
		case(state)
			HIGH: begin
				timer_clr=1;
				if(in==0) begin
					state=WAIT_LOW;
				end
			end
			WAIT_LOW: begin
				timer_clr=0;
				if(timer_done) begin
					state=LOW;
				end
			end
			LOW: begin
				timer_clr=1;
				if(in) begin
					state=WAIT_HIGH;
				end
			end
			WAIT_HIGH: begin
				timer_clr=0;
				if(timer_done) begin
					state=HIGH;
				end
			end
		endcase
	end

endmodule