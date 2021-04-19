//
// Generated by Bluespec Compiler (build 00185f79)
//
// On Mon Apr 19 22:46:08 IST 2021
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

module mkTb(CLK,
	    RST_N);
  input  CLK;
  input  RST_N;

  // inlined wires
  wire start_wire$whas, state_set_pw$whas;

  // register gcdVariable_busy
  reg gcdVariable_busy;
  wire gcdVariable_busy$D_IN, gcdVariable_busy$EN;

  // register gcdVariable_x
  reg [31 : 0] gcdVariable_x;
  wire [31 : 0] gcdVariable_x$D_IN;
  wire gcdVariable_x$EN;

  // register gcdVariable_y
  reg [31 : 0] gcdVariable_y;
  wire [31 : 0] gcdVariable_y$D_IN;
  wire gcdVariable_y$EN;

  // register running
  reg running;
  wire running$D_IN, running$EN;

  // register start_reg
  reg start_reg;
  wire start_reg$D_IN, start_reg$EN;

  // register start_reg_1
  reg start_reg_1;
  wire start_reg_1$D_IN, start_reg_1$EN;

  // register state_can_overlap
  reg state_can_overlap;
  wire state_can_overlap$D_IN, state_can_overlap$EN;

  // register state_fired
  reg state_fired;
  wire state_fired$D_IN, state_fired$EN;

  // register state_mkFSMstate
  reg [2 : 0] state_mkFSMstate;
  reg [2 : 0] state_mkFSMstate$D_IN;
  wire state_mkFSMstate$EN;

  // register x
  reg [31 : 0] x;
  wire [31 : 0] x$D_IN;
  wire x$EN;

  // register y
  reg [31 : 0] y;
  wire [31 : 0] y$D_IN;
  wire y$EN;

  // rule scheduling signals
  wire WILL_FIRE_RL_action_l21c20,
       WILL_FIRE_RL_action_l22c9,
       WILL_FIRE_RL_fsm_start,
       WILL_FIRE_RL_idle_l13c17;

  // inputs to muxes for submodule ports
  wire [31 : 0] MUX_gcdVariable_x$write_1__VAL_2;
  wire MUX_start_reg$write_1__SEL_2;

  // remaining internal signals
  wire [31 : 0] x__h147;
  wire abort_whas__4_AND_abort_wget__5_6_OR_state_mkF_ETC___d60,
       gcdVariable_x_ULT_gcdVariable_y___d5;

  // rule RL_action_l22c9
  assign WILL_FIRE_RL_action_l22c9 =
	     gcdVariable_busy && gcdVariable_x == 32'd0 &&
	     state_mkFSMstate == 3'd1 ;

  // rule RL_fsm_start
  assign WILL_FIRE_RL_fsm_start =
	     abort_whas__4_AND_abort_wget__5_6_OR_state_mkF_ETC___d60 &&
	     start_reg ;

  // rule RL_idle_l13c17
  assign WILL_FIRE_RL_idle_l13c17 =
	     !start_wire$whas && state_mkFSMstate == 3'd2 ;

  // rule RL_action_l21c20
  assign WILL_FIRE_RL_action_l21c20 =
	     !gcdVariable_busy && start_wire$whas &&
	     (state_mkFSMstate == 3'd0 || state_mkFSMstate == 3'd2) ;

  // inputs to muxes for submodule ports
  assign MUX_start_reg$write_1__SEL_2 =
	     abort_whas__4_AND_abort_wget__5_6_OR_state_mkF_ETC___d60 &&
	     !start_reg &&
	     !running ;
  assign MUX_gcdVariable_x$write_1__VAL_2 =
	     gcdVariable_x_ULT_gcdVariable_y___d5 ? gcdVariable_y : x__h147 ;

  // inlined wires
  assign start_wire$whas =
	     WILL_FIRE_RL_fsm_start || start_reg_1 && !state_fired ;
  assign state_set_pw$whas =
	     WILL_FIRE_RL_idle_l13c17 || WILL_FIRE_RL_action_l22c9 ||
	     WILL_FIRE_RL_action_l21c20 ;

  // register gcdVariable_busy
  assign gcdVariable_busy$D_IN = !WILL_FIRE_RL_action_l22c9 ;
  assign gcdVariable_busy$EN =
	     WILL_FIRE_RL_action_l22c9 || WILL_FIRE_RL_action_l21c20 ;

  // register gcdVariable_x
  assign gcdVariable_x$D_IN =
	     WILL_FIRE_RL_action_l21c20 ?
	       x :
	       MUX_gcdVariable_x$write_1__VAL_2 ;
  assign gcdVariable_x$EN =
	     gcdVariable_x != 32'd0 ||
	     !gcdVariable_x_ULT_gcdVariable_y___d5 ||
	     WILL_FIRE_RL_action_l21c20 ;

  // register gcdVariable_y
  assign gcdVariable_y$D_IN = WILL_FIRE_RL_action_l21c20 ? y : gcdVariable_x ;
  assign gcdVariable_y$EN =
	     gcdVariable_x_ULT_gcdVariable_y___d5 && gcdVariable_x != 32'd0 ||
	     WILL_FIRE_RL_action_l21c20 ;

  // register running
  assign running$D_IN = 1'd1 ;
  assign running$EN = MUX_start_reg$write_1__SEL_2 ;

  // register start_reg
  assign start_reg$D_IN = !WILL_FIRE_RL_fsm_start ;
  assign start_reg$EN =
	     WILL_FIRE_RL_fsm_start ||
	     abort_whas__4_AND_abort_wget__5_6_OR_state_mkF_ETC___d60 &&
	     !start_reg &&
	     !running ;

  // register start_reg_1
  assign start_reg_1$D_IN = start_wire$whas ;
  assign start_reg_1$EN = 1'd1 ;

  // register state_can_overlap
  assign state_can_overlap$D_IN = state_set_pw$whas || state_can_overlap ;
  assign state_can_overlap$EN = 1'd1 ;

  // register state_fired
  assign state_fired$D_IN = state_set_pw$whas ;
  assign state_fired$EN = 1'd1 ;

  // register state_mkFSMstate
  always@(WILL_FIRE_RL_idle_l13c17 or
	  WILL_FIRE_RL_action_l21c20 or WILL_FIRE_RL_action_l22c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_idle_l13c17: state_mkFSMstate$D_IN = 3'd0;
      WILL_FIRE_RL_action_l21c20: state_mkFSMstate$D_IN = 3'd1;
      WILL_FIRE_RL_action_l22c9: state_mkFSMstate$D_IN = 3'd2;
      default: state_mkFSMstate$D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign state_mkFSMstate$EN =
	     WILL_FIRE_RL_idle_l13c17 || WILL_FIRE_RL_action_l21c20 ||
	     WILL_FIRE_RL_action_l22c9 ;

  // register x
  assign x$D_IN = 32'h0 ;
  assign x$EN = 1'b0 ;

  // register y
  assign y$D_IN = 32'h0 ;
  assign y$EN = 1'b0 ;

  // remaining internal signals
  assign abort_whas__4_AND_abort_wget__5_6_OR_state_mkF_ETC___d60 =
	     (state_mkFSMstate == 3'd0 || state_mkFSMstate == 3'd2) &&
	     (!start_reg_1 || state_fired) ;
  assign gcdVariable_x_ULT_gcdVariable_y___d5 =
	     gcdVariable_x < gcdVariable_y ;
  assign x__h147 = gcdVariable_x - gcdVariable_y ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        gcdVariable_busy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	gcdVariable_x <= `BSV_ASSIGNMENT_DELAY 32'd0;
	gcdVariable_y <= `BSV_ASSIGNMENT_DELAY 32'd0;
	running <= `BSV_ASSIGNMENT_DELAY 1'd0;
	start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 3'd0;
	x <= `BSV_ASSIGNMENT_DELAY 32'd342;
	y <= `BSV_ASSIGNMENT_DELAY 32'd4314;
      end
    else
      begin
        if (gcdVariable_busy$EN)
	  gcdVariable_busy <= `BSV_ASSIGNMENT_DELAY gcdVariable_busy$D_IN;
	if (gcdVariable_x$EN)
	  gcdVariable_x <= `BSV_ASSIGNMENT_DELAY gcdVariable_x$D_IN;
	if (gcdVariable_y$EN)
	  gcdVariable_y <= `BSV_ASSIGNMENT_DELAY gcdVariable_y$D_IN;
	if (running$EN) running <= `BSV_ASSIGNMENT_DELAY running$D_IN;
	if (start_reg$EN) start_reg <= `BSV_ASSIGNMENT_DELAY start_reg$D_IN;
	if (start_reg_1$EN)
	  start_reg_1 <= `BSV_ASSIGNMENT_DELAY start_reg_1$D_IN;
	if (state_can_overlap$EN)
	  state_can_overlap <= `BSV_ASSIGNMENT_DELAY state_can_overlap$D_IN;
	if (state_fired$EN)
	  state_fired <= `BSV_ASSIGNMENT_DELAY state_fired$D_IN;
	if (state_mkFSMstate$EN)
	  state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY state_mkFSMstate$D_IN;
	if (x$EN) x <= `BSV_ASSIGNMENT_DELAY x$D_IN;
	if (y$EN) y <= `BSV_ASSIGNMENT_DELAY y$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    gcdVariable_busy = 1'h0;
    gcdVariable_x = 32'hAAAAAAAA;
    gcdVariable_y = 32'hAAAAAAAA;
    running = 1'h0;
    start_reg = 1'h0;
    start_reg_1 = 1'h0;
    state_can_overlap = 1'h0;
    state_fired = 1'h0;
    state_mkFSMstate = 3'h2;
    x = 32'hAAAAAAAA;
    y = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_action_l22c9)
	$display("GCD(%0d, %0d) = %0d", x, y, gcdVariable_y);
    if (RST_N != `BSV_RESET_VALUE)
      if (running &&
	  abort_whas__4_AND_abort_wget__5_6_OR_state_mkF_ETC___d60 &&
	  !start_reg)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_action_l21c20 && WILL_FIRE_RL_action_l22c9)
	$display("Error: \"testBench.bsv\", line 21, column 20: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_action_l21c20] and\n  [RL_action_l22c9] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule  // mkTb

