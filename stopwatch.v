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
    clk,                   //��ʱ�ӣ�100Mhz
	 ButtonIn,              // �������룬�͵�ƽ��Ч
	 a,                     // a~gΪ�߶αʻ��룬dpΪС����
	 b,
	 c,
	 d,
	 e,
	 f,
	 g, 
	 dp,
	 position ,            //��̬ɨ���λѡ�ź�
	 led0     ,            //���ӵĲ����źţ������жϷ�Ƶģ���������
	 led1     ,            //���ӵĲ����źţ������жϰ�������ģ���������
	 led2     ,            //���ӵĲ����źţ������ж����������������
	 reset_n               //��λ�źţ��͵�ƽ��Ч
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
 //-------���ó���simĿ�ģ����ڷ��棬��Ӱ���ۺϺ�??��-------//
    parameter sim=0;
 //-------���øߵ�ƽ��Ч�ĸ�λ�ź�reset-------//
    wire reset;
	 assign reset=~reset_n;
 
 //--------DCMģ��ʵ������--------------------// 	 
   
    wire sys_clk;        //ϵͳ��ʱ�ӣ�6.25Mhz
    stopwatch_dcm  dcm_inst(
        .CLKIN_IN(clk), 
        .CLKDV_OUT(sys_clk), 
        .CLKIN_IBUFG_OUT(), 
        .CLK0_OUT(), 
        .LOCKED_OUT());

 //--------��Ƶ��ʵ������--------------------// 	 

    wire  pulse400Hz;
    wire  pulse10Hz;
	 //15625��Ƶ������ʱ������Ƶ����Ϊ2
	 div #(.N(sim?2:125000),.CounterBits(sim?1:17))  div_15625(
		  .clk(sys_clk), 
		  .ci(1'b1), 
		  .co(pulse400Hz) );
	 //40��Ƶ������ʱ������Ƶ����Ϊ10
	 div #(.N(sim?10:40),.CounterBits(sim?4:6))  div_40(
		  .clk(sys_clk), 
		  .ci(pulse400Hz), 
		  .co(pulse10Hz)); 
 
 //--------��������ʵ������--------------------// 	
 //
	wire ButtonOut;  
	  button_press_unit   button_press_unit(
		.clk(sys_clk),
		.button_in(ButtonIn),
		.timer_en(pulse400Hz),
		.button_out( ButtonOut),
		.reset(reset));
 
//--------��������ʵ������-------------------// 
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


//--------��ʱģ���ʵ������-��ͬѧ�Լ����-------------------//  
	wire[3:0] q_ms;
	wire[7:0] q_ss,q_mm;
	stopwatch_counter counter(.clk(sys_clk),.clr(clear),.stop(stop),.count(count),
								.q_ms(q_ms),.q_ss(q_ss),.q_mm(q_mm),.ci(pulse10Hz),.co());
 
 
 

//-------- ��̬��ʾ��ʵ������--��ͬѧ�Լ����-------------------// 	 
	dynamic_seg_display_5 displayer(.clk(sys_clk),.scan(pulse400Hz),
									.minute(q_mm),.second(q_ss),.m_second(q_ms),
									.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.dp(dp),.position(position));    


	 
	
//	 --------����ģ�����--------------------//
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
