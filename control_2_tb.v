`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: zju
// Engineer:qmj

////////////////////////////////////////////////////////////////////////////////

module control_2_tb_v;
   parameter delay=160;
	// Inputs
	reg clk;
	reg ButtonOut;
	reg reset;

	// Outputs
	wire clear;
	wire count;
	wire stop;

	// Instantiate the Unit Under Test (UUT)
	control_2 control_2_tb(
		.clk(clk), 
		.button_out(ButtonOut), 
		.clear(clear), 
		.count(count), 
		.stop(stop), 
		.reset(reset)
	);

	initial 
	begin
		// Initialize Inputs
		clk = 0;
		ButtonOut = 0;
		reset = 1;
		#(delay*4.5) reset = 0;
		repeat (5)
		 begin
		   #(delay*10) ButtonOut = 1;
		   #(delay)    ButtonOut = 0;
		 end
		#(delay*10)		$stop;
	end
     
		// 
	always 
		#(delay/2) clk=~clk;


      
		
endmodule

