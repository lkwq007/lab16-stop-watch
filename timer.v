//==================================================================================================
//  Filename      : timer.v
//  Created On    : 2016-04-18 14:58:26
//  Last Modified : 2016-04-18 15:34:40
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : Timer
//
//
//==================================================================================================
module timer(clk,ci,co,reset);
	parameter CounterBits=4,N=1<<CounterBits;
	input clk,ci,reset;
	output co;
	reg[CounterBits-1:0] temp=0;

	assign co=ci&&(temp==N-1);
	always @(posedge clk) begin
		if(reset) begin
			temp=0;
		end
		else begin
			if(ci) begin
				temp=temp+1;
			end
			else begin
				temp=temp;
			end
		end
	end

endmodule