`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: zju
// Engineer:qmj
//
// Create Date:   14:28:15 08/05/2012
// Design Name:   stopwatch
// Module Name:   E:/lab16_new_201208/ise/stopwatch_tb.v
// Project Name:  stopwatch
// Verilog Test Fixture created by ISE for module: stopwatch
////////////////////////////////////////////////////////////////////////////////

module stopwatch_tb_v;
   parameter DELY=10; 
	// Inputs
	reg clk;
	reg ButtonIn;
	reg reset_n;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire dp;
	wire [4:0] position;
	wire led0;
	wire led1;
	wire led2;

	// Instantiate the Unit Under Test (UUT)
	stopwatch #(.sim(1'b1)) uut (
		.clk(clk), 
		.ButtonIn(ButtonIn), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.dp(dp), 
		.position(position), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.reset_n(reset_n)	);

	always #(DELY/2) clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		ButtonIn = 1;
		reset_n = 0;
		#(DELY*32) reset_n = 1;
		//start
		#(DELY*5) ButtonIn = 0;
		#(DELY*80) ButtonIn = 1;
    #(DELY*5000)  ButtonIn = 0;//stop
		#(DELY*60) ButtonIn = 1;
		#(DELY*30) ButtonIn = 0;//reset
		#(DELY*60) ButtonIn = 1;
		#(DELY*10) $stop;
	end
	
	
	
   
    reg[6:0] num; 
    always @(*)
       case({a,b,c,d,e,f,g})
           7'b0000001:num=48;//"0" ASCII Code 
           7'b1001111:num=49;//"1" ASCII Code 
           7'b0010010:num=50;
           7'b0000110:num=51;
           7'b1001100:num=52;
           7'b0100100:num=53;
           7'b0100000:num=54;
           7'b0001111:num=55;
           7'b0000000:num=56;
           7'b0000100:num=57;//"9" ASCII Code 
           default:num=63;		 //"?" ASCII Code
       endcase
       wire[6:0] num0,num1, num2,num3,num4;
       
       assign    num0=position[0]? num:7'd0;
       assign    num1=position[1]? num:7'd0;
       assign    num2=position[2]? num:7'd0;
       assign    num3=position[3]? num:7'd0;  
       assign    num4=position[4]? num:7'd0; 
  	
endmodule

