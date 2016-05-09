//==================================================================================================
//  Filename      : control_2.v
//  Created On    : 2016-04-23 21:13:07
//  Last Modified : 2016-05-09 15:20:45
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module control_2 (clk,button_out,clear,count,stop,reset);
	parameter RESET=2'b00,TIMING=2'b01,END=2'b11;
	input clk,button_out,reset;
	output clear,count,stop;

	reg[1:0] state=RESET;
	assign clear=(state==RESET);
	assign count=(state==TIMING);
	assign stop=(state==END);
	always @(posedge clk) begin
		if(reset) begin
			state=RESET;
		end
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