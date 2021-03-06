//
// Generated by Bluespec Compiler (build cd96b228)
//
// On Sun May 30 12:23:54 IST 2021
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkTestBench(CLK,
		   RST_N);
  input  CLK;
  input  RST_N;

  // register counter_counter
  reg [3 : 0] counter_counter;
  reg [3 : 0] counter_counter$D_IN;
  wire counter_counter$EN;

  // register flag1
  reg flag1;
  wire flag1$D_IN, flag1$EN;

  // register flag2
  reg flag2;
  wire flag2$D_IN, flag2$EN;

  // register step
  reg [31 : 0] step;
  reg [31 : 0] step$D_IN;
  wire step$EN;

  // rule scheduling signals
  wire WILL_FIRE_RL_r4, WILL_FIRE_RL_r5, WILL_FIRE_RL_r6;

  // inputs to muxes for submodule ports
  wire [3 : 0] MUX_counter_counter$write_1__VAL_1,
	       MUX_counter_counter$write_1__VAL_2,
	       MUX_counter_counter$write_1__VAL_3,
	       MUX_counter_counter$write_1__VAL_4,
	       MUX_counter_counter$write_1__VAL_5,
	       MUX_counter_counter$write_1__VAL_6;
  wire MUX_counter_counter$write_1__SEL_1;

  // remaining internal signals
  wire [4 : 0] SEXT_counter_counter_PLUS_24___d27,
	       SEXT_counter_counter_PLUS_25___d20,
	       SEXT_counter_counter_PLUS_28___d48,
	       SEXT_counter_counter_PLUS_2___d5,
	       SEXT_counter_counter_PLUS_4___d37,
	       SEXT_counter_counter_PLUS_7___d13,
	       SEXT_counter_counter____d4;

  // rule RL_r4
  assign WILL_FIRE_RL_r4 = step == 32'd4 && !flag1 ;

  // rule RL_r5
  assign WILL_FIRE_RL_r5 = step == 32'd4 && !flag2 && !WILL_FIRE_RL_r4 ;

  // rule RL_r6
  assign WILL_FIRE_RL_r6 = step == 32'd4 && flag1 && flag2 ;

  // inputs to muxes for submodule ports
  assign MUX_counter_counter$write_1__SEL_1 =
	     WILL_FIRE_RL_r5 || step == 32'd1 ;
  assign MUX_counter_counter$write_1__VAL_1 =
	     ((SEXT_counter_counter_PLUS_7___d13 ^ 5'h10) <= 5'd23) ?
	       (((SEXT_counter_counter_PLUS_7___d13 ^ 5'h10) < 5'd8) ?
		  4'd8 :
		  SEXT_counter_counter_PLUS_7___d13[3:0]) :
	       4'd7 ;
  assign MUX_counter_counter$write_1__VAL_2 =
	     ((SEXT_counter_counter_PLUS_2___d5 ^ 5'h10) <= 5'd23) ?
	       (((SEXT_counter_counter_PLUS_2___d5 ^ 5'h10) < 5'd8) ?
		  4'd8 :
		  SEXT_counter_counter_PLUS_2___d5[3:0]) :
	       4'd7 ;
  assign MUX_counter_counter$write_1__VAL_3 =
	     ((SEXT_counter_counter_PLUS_25___d20 ^ 5'h10) <= 5'd23) ?
	       (((SEXT_counter_counter_PLUS_25___d20 ^ 5'h10) < 5'd8) ?
		  4'd8 :
		  SEXT_counter_counter_PLUS_25___d20[3:0]) :
	       4'd7 ;
  assign MUX_counter_counter$write_1__VAL_4 =
	     ((SEXT_counter_counter_PLUS_24___d27 ^ 5'h10) <= 5'd23) ?
	       (((SEXT_counter_counter_PLUS_24___d27 ^ 5'h10) < 5'd8) ?
		  4'd8 :
		  SEXT_counter_counter_PLUS_24___d27[3:0]) :
	       4'd7 ;
  assign MUX_counter_counter$write_1__VAL_5 =
	     ((SEXT_counter_counter_PLUS_4___d37 ^ 5'h10) <= 5'd23) ?
	       (((SEXT_counter_counter_PLUS_4___d37 ^ 5'h10) < 5'd8) ?
		  4'd8 :
		  SEXT_counter_counter_PLUS_4___d37[3:0]) :
	       4'd7 ;
  assign MUX_counter_counter$write_1__VAL_6 =
	     ((SEXT_counter_counter_PLUS_28___d48 ^ 5'h10) <= 5'd23) ?
	       (((SEXT_counter_counter_PLUS_28___d48 ^ 5'h10) < 5'd8) ?
		  4'd8 :
		  SEXT_counter_counter_PLUS_28___d48[3:0]) :
	       4'd7 ;

  // register counter_counter
  always@(MUX_counter_counter$write_1__SEL_1 or
	  MUX_counter_counter$write_1__VAL_1 or
	  step or
	  MUX_counter_counter$write_1__VAL_2 or
	  MUX_counter_counter$write_1__VAL_3 or
	  MUX_counter_counter$write_1__VAL_4 or
	  WILL_FIRE_RL_r4 or
	  MUX_counter_counter$write_1__VAL_5 or
	  WILL_FIRE_RL_r6 or MUX_counter_counter$write_1__VAL_6)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_counter_counter$write_1__SEL_1:
	  counter_counter$D_IN = MUX_counter_counter$write_1__VAL_1;
      step == 32'd0:
	  counter_counter$D_IN = MUX_counter_counter$write_1__VAL_2;
      step == 32'd2:
	  counter_counter$D_IN = MUX_counter_counter$write_1__VAL_3;
      step == 32'd3:
	  counter_counter$D_IN = MUX_counter_counter$write_1__VAL_4;
      WILL_FIRE_RL_r4:
	  counter_counter$D_IN = MUX_counter_counter$write_1__VAL_5;
      WILL_FIRE_RL_r6:
	  counter_counter$D_IN = MUX_counter_counter$write_1__VAL_6;
      default: counter_counter$D_IN = 4'b1010 /* unspecified value */ ;
    endcase
  end
  assign counter_counter$EN =
	     WILL_FIRE_RL_r5 || step == 32'd1 || step == 32'd0 ||
	     step == 32'd2 ||
	     step == 32'd3 ||
	     WILL_FIRE_RL_r4 ||
	     WILL_FIRE_RL_r6 ;

  // register flag1
  assign flag1$D_IN = 1'd1 ;
  assign flag1$EN = WILL_FIRE_RL_r4 ;

  // register flag2
  assign flag2$D_IN = 1'd1 ;
  assign flag2$EN = WILL_FIRE_RL_r5 ;

  // register step
  always@(step)
  begin
    case (1'b1) // synopsys parallel_case
      step == 32'd0: step$D_IN = 32'd1;
      step == 32'd1: step$D_IN = 32'd2;
      step == 32'd2: step$D_IN = 32'd3;
      step == 32'd3: step$D_IN = 32'd4;
      default: step$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign step$EN =
	     step == 32'd0 || step == 32'd1 || step == 32'd2 ||
	     step == 32'd3 ;

  // remaining internal signals
  assign SEXT_counter_counter_PLUS_24___d27 =
	     SEXT_counter_counter____d4 + 5'd24 ;
  assign SEXT_counter_counter_PLUS_25___d20 =
	     SEXT_counter_counter____d4 + 5'd25 ;
  assign SEXT_counter_counter_PLUS_28___d48 =
	     SEXT_counter_counter____d4 + 5'd28 ;
  assign SEXT_counter_counter_PLUS_2___d5 =
	     SEXT_counter_counter____d4 + 5'd2 ;
  assign SEXT_counter_counter_PLUS_4___d37 =
	     SEXT_counter_counter____d4 + 5'd4 ;
  assign SEXT_counter_counter_PLUS_7___d13 =
	     SEXT_counter_counter____d4 + 5'd7 ;
  assign SEXT_counter_counter____d4 =
	     { counter_counter[3], counter_counter } ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        counter_counter <= `BSV_ASSIGNMENT_DELAY 4'd0;
	flag1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	flag2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	step <= `BSV_ASSIGNMENT_DELAY 32'd0;
      end
    else
      begin
        if (counter_counter$EN)
	  counter_counter <= `BSV_ASSIGNMENT_DELAY counter_counter$D_IN;
	if (flag1$EN) flag1 <= `BSV_ASSIGNMENT_DELAY flag1$D_IN;
	if (flag2$EN) flag2 <= `BSV_ASSIGNMENT_DELAY flag2$D_IN;
	if (step$EN) step <= `BSV_ASSIGNMENT_DELAY step$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    counter_counter = 4'hA;
    flag1 = 1'h0;
    flag2 = 1'h0;
    step = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (step == 32'd0) $display($signed(counter_counter));
    if (RST_N != `BSV_RESET_VALUE)
      if (step == 32'd1) $display($signed(counter_counter));
    if (RST_N != `BSV_RESET_VALUE)
      if (step == 32'd2) $display($signed(counter_counter));
    if (RST_N != `BSV_RESET_VALUE)
      if (step == 32'd3) $display($signed(counter_counter));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_r4) $display($signed(counter_counter));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_r5) $display($signed(counter_counter));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_r6) $display($signed(counter_counter));
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_r6) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTestBench

