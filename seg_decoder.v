//==================================================================================================
//  Filename      : seg_decoder.v
//  Created On    : 2016-04-22 09:39:14
//  Last Modified : 2016-04-22 20:56:40
//  Revision      : 
//  Author        : Lnyan
//  Email         : lkwq007 [at] gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module seg_decoder(data,a,b,c,d,e,f,g);
	input[3:0] data;
	output a,b,c,d,e,f,g;
	reg[6:0] temp=0;

	assign {a,b,c,d,e,f,g}=temp;
	always @(*) begin
		case (data)
			0:temp=7'b000_000_1;
			1:temp=7'b100_111_1;
			2:temp=7'b001_001_0;
			3:temp=7'b000_011_0;
			4:temp=7'b100_110_0;
			5:temp=7'b010_010_0;
			6:temp=7'b010_000_0;
			7:temp=7'b000_111_1;
			8:temp=7'b000_000_0;
			9:temp=7'b000_010_0;
			default:temp=7'b000_000_0;
		endcase
	end

endmodule