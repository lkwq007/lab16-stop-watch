`timescale 1ns / 10ps

module button_press_unit_tb;
  reg clk,ButtonIn,reset,timer_en;
  wire ButtonOut;
  parameter delay=160;
//  
   initial begin
      clk = 0;	reset = 1;	ButtonIn = 1;
      #(delay*2) reset=0;
      #(5_000_000)     
       repeat (23) 
         begin
           #(110_000) ButtonIn=1;
           #(110_000) ButtonIn=0;
         end
       #(100_000_000) 
         repeat (28)
            begin
            #(110_000) ButtonIn=0;
            #(110_000) ButtonIn=1;
          end
       #(30_000_000) 
       $stop;
      end
 //     
    always #(delay/2) clk=~clk;
 //
    initial begin
        timer_en=0;
        #(delay/2)
        repeat(60)
          begin
            #(delay*15624) timer_en=1;
            #(delay)       timer_en=0;
          end   
       end
button_press_unit   button_press_unit_inst(
  .clk(clk),
  .reset(reset),
  .ButtonIn(ButtonIn),
  .timer_en(timer_en),
  .ButtonOut(ButtonOut)
   );

endmodule
