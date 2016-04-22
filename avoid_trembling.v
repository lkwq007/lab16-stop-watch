//==================================================================================================
//  Filename      : avoid_trembling.v
//  Created On    : 2016-04-18 15:01:39
//  Last Modified : 2016-04-18 15:32:24
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module avoid_trembling(clk,reset,in,out);
	parameter HIGH=0,WAIT_LOW=1,LOW=2,WAIT_HIGH=3;
	input clk,reset,in;
	output out;
	wire en;
	reg timer_clr,timer_done;

	reg[1:0] state=HIGH;

	div #(.N(2**17),.CounterBits(18)) div(.clk(clk),.ci(1),.co(en));
	timer #(.N(8),.CounterBits(3)) 
		timer(.clk(clk),.ci(en),.reset(timer_clr),.co(timer_done));
	assign out=state==HIGH?0:1;
	always @(posedge clk) begin
		if(reset) begin
			state=HIGH;
		end
		else begin
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
	end

endmodule