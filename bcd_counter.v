//==================================================================================================
//  Filename      : BcdCounter.v
//  Created On    : 2016-03-30 21:31:52
//  Last Modified : 2016-04-22 21:29:49
//  Revision      : Alpha
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : N base 8421 BCD Counter
//
//
//==================================================================================================
module bcd_counter(clk,reset,ci,co,q);
	parameter N=8'b0101_1001;
	input clk,reset,ci;
	output co;
	output[7:0] q;
	reg[7:0] q=0;

	assign co=ci&&(q==N);
	always @(posedge clk) begin
		if(reset)
			q=0;
		else begin
			if(ci) begin
				if(q==N) begin
					q=0;
				end
				else if(q[3:0]==9) begin
					q[3:0]=0;
					q[7:4]=q[7:4]+1;
				end
				else begin
					q[3:0]=q[3:0]+1;
				end
			end
			
		end
	end

endmodule