//==================================================================================================
//  Filename      : div.v
//  Created On    : 2016-04-18 14:53:59
//  Last Modified : 2016-04-18 15:35:56
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : Div
//
//
//==================================================================================================
module div(clk,ci,co);
	parameter CounterBits=4,N=1<<CounterBits;
	input clk,ci;
	output co;
	reg[CounterBits-1:0] temp=0;

	assign co=ci&&(temp==N-1);
	always @(posedge clk) begin
		if(ci) begin
			if(temp==N-1) begin
				temp=0;
			end
			else begin
				temp=temp+1;
			end
		end
		else begin
			temp=temp;
		end
	end
	
endmodule