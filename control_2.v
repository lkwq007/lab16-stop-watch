//==================================================================================================
//  Filename      : control_2.v
//  Created On    : 2016-04-23 21:13:07
//  Last Modified : 2016-04-23 21:24:07
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module control_2 (clk,button_out,clear,count,stop,reset);
	parameter RESET=0,TIMING=1,END=2;
	input clk,button_out,reset;
	output reg clear,count,stop;

	reg[1:0] state=RESET;

	always @(posedge clk) begin
		if(reset) begin
			state=RESET;
		end
		case (state)
			RESET: begin
				clear=1;
				count=0;
				stop=0;
				if(button_out) begin
					state=TIMING;
				end
			end
			TIMING: begin
				clear=0;
				count=1;
				stop=0;
				if(button_out) begin
					state=END;
				end
			end
			END: begin
				clear=0;
				count=0;
				stop=1;
				if(button_out) begin
					state=RESET;
				end
			end
		endcase
	end

endmodule