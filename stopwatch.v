`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: zju
// Engineer:qmj 
// 
// Create Date:    09:37:45 08/17/2012 
// Design Name: 
// Module Name:    stopwatch_top 
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////
module stopwatch(
    clk,                   //主时钟，100Mhz
	 ButtonIn,              // 按键输入，低电平有效
	 a,                     // a~g为七段笔划码，dp为小数点
	 b,
	 c,
	 d,
	 e,
	 f,
	 g, 
	 dp,
	 position ,            //动态扫描的位选信号
	 led0     ,            //附加的测试信号，用于判断分频模块正常与否
	 led1     ,            //附加的测试信号，用于判断按键处理模块正常与否
	 led2     ,            //附加的测试信号，用于判断秒表控制器正常与否
	 reset_n               //复位信号，低电平有效
	 );
    input clk;
    input ButtonIn;
	 input reset_n;
    output a;
    output b;
    output c;
    output d;
    output e;
    output f;
    output g;
	 output dp;
    output [4:0] position;
	 output led0 ;
	 output led1 ;	
	 output led2 ; 
 //-------设置常数sim目的，便于仿真，不影响综合和??现-------//
    parameter sim=0;
 //-------设置高电平有效的复位信号reset-------//
    wire reset;
	 assign reset=~reset_n;
 
 //--------DCM模块实例调用--------------------// 	 
   
    wire sys_clk;        //系统主时钟，6.25Mhz
    stopwatch_dcm  dcm_inst(
        .CLKIN_IN(clk), 
        .CLKDV_OUT(sys_clk), 
        .CLKIN_IBUFG_OUT(), 
        .CLK0_OUT(), 
        .LOCKED_OUT());

 //--------分频器实例调用--------------------// 	 

    wire  pulse400Hz;
    wire  pulse10Hz;
	 //15625分频，仿真时，将分频比设为2
	 div #(.N(sim?2:125000),.CounterBits(sim?1:17))  div_15625(
		  .clk(sys_clk), 
		  .ci(1'b1), 
		  .co(pulse400Hz) );
	 //40分频，仿真时，将分频比设为10
	 div #(.N(sim?10:40),.CounterBits(sim?4:6))  div_40(
		  .clk(sys_clk), 
		  .ci(pulse400Hz), 
		  .co(pulse10Hz)); 
 
 //--------按键处理实例调用--------------------// 	
 //
	wire ButtonOut;  
	  button_press_unit   button_press_unit(
		.clk(sys_clk),
		.button_in(ButtonIn),
		.timer_en(pulse400Hz),
		.button_out( ButtonOut),
		.reset(reset));
 
//--------秒表控制器实例调用-------------------// 
 // 
  wire clear;
	wire count;
	wire stop;	
	 control_2   control_inst(
	   .clk(sys_clk), 
	   .button_out(ButtonOut),//ButtonOut(ButtonOut)
	   .clear(clear), 
	   .count(count), 
	   .stop(stop),
	   .reset(reset));


//--------计时模块的实例调用-由同学自己添加-------------------//  
	wire[3:0] q_ms;
	wire[7:0] q_ss,q_mm;
	stopwatch_counter counter(.clk(sys_clk),.clr(clear),.stop(stop),.count(count),
								.q_ms(q_ms),.q_ss(q_ss),.q_mm(q_mm),.ci(pulse10Hz),.co());
 
 
 

//-------- 动态显示的实例调用--由同学自己添加-------------------// 	 
	dynamic_seg_display_5 displayer(.clk(sys_clk),.scan(pulse400Hz),
									.minute(q_mm),.second(q_ss),.m_second(q_ms),
									.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.dp(dp),.position(position));    


	 
	
//	 --------测试模块调用--------------------//
   reg led0=0;
	 reg led1=0;
	//
   always @(posedge sys_clk)
	   if(pulse10Hz) led0=~led0;
	//
   always @(posedge sys_clk)
	   if(ButtonOut) led1=~led1;
   //
   assign led2=count;	
		
endmodule
