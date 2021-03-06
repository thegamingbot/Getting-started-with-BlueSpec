//
// Generated by Bluespec Compiler (build cd96b228)
//
// On Sat May 22 23:10:00 IST 2021
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

module testbench(CLK,
		 RST_N);
  input  CLK;
  input  RST_N;

  // register fib_a
  reg [31 : 0] fib_a;
  wire [31 : 0] fib_a$D_IN;
  wire fib_a$EN;

  // register fib_active
  reg fib_active;
  wire fib_active$D_IN, fib_active$EN;

  // register fib_b
  reg [31 : 0] fib_b;
  wire [31 : 0] fib_b$D_IN;
  wire fib_b$EN;

  // register fib_j
  reg [31 : 0] fib_j;
  wire [31 : 0] fib_j$D_IN;
  wire fib_j$EN;

  // register n
  reg [7 : 0] n;
  wire [7 : 0] n$D_IN;
  wire n$EN;

  // ports of submodule fib_result_fifo
  wire [31 : 0] fib_result_fifo$D_IN, fib_result_fifo$D_OUT;
  wire fib_result_fifo$CLR,
       fib_result_fifo$DEQ,
       fib_result_fifo$EMPTY_N,
       fib_result_fifo$ENQ,
       fib_result_fifo$FULL_N;

  // ports of submodule inputs
  wire [7 : 0] inputs$D_IN, inputs$D_OUT;
  wire inputs$CLR, inputs$DEQ, inputs$EMPTY_N, inputs$ENQ, inputs$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_display_results,
       WILL_FIRE_RL_fib_loop,
       WILL_FIRE_RL_fib_n_is_zero,
       WILL_FIRE_RL_fib_the_end,
       WILL_FIRE_RL_loop;

  // inputs to muxes for submodule ports
  wire [31 : 0] MUX_fib_a$write_1__VAL_1,
		MUX_fib_j$write_1__VAL_1,
		MUX_fib_j$write_1__VAL_2;
  wire MUX_fib_active$write_1__SEL_1;

  // submodule fib_result_fifo
  FIFOL1 #(.width(32'd32)) fib_result_fifo(.RST(RST_N),
					   .CLK(CLK),
					   .D_IN(fib_result_fifo$D_IN),
					   .ENQ(fib_result_fifo$ENQ),
					   .DEQ(fib_result_fifo$DEQ),
					   .CLR(fib_result_fifo$CLR),
					   .D_OUT(fib_result_fifo$D_OUT),
					   .FULL_N(fib_result_fifo$FULL_N),
					   .EMPTY_N(fib_result_fifo$EMPTY_N));

  // submodule inputs
  SizedFIFO #(.p1width(32'd8),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(1'd1)) inputs(.RST(RST_N),
				     .CLK(CLK),
				     .D_IN(inputs$D_IN),
				     .ENQ(inputs$ENQ),
				     .DEQ(inputs$DEQ),
				     .CLR(inputs$CLR),
				     .D_OUT(inputs$D_OUT),
				     .FULL_N(inputs$FULL_N),
				     .EMPTY_N(inputs$EMPTY_N));

  // rule RL_display_results
  assign WILL_FIRE_RL_display_results =
	     fib_result_fifo$EMPTY_N && inputs$EMPTY_N ;

  // rule RL_loop
  assign WILL_FIRE_RL_loop = !fib_active && inputs$FULL_N && n <= 8'd20 ;

  // rule RL_fib_loop
  assign WILL_FIRE_RL_fib_loop = fib_active && fib_j > 32'd1 ;

  // rule RL_fib_the_end
  assign WILL_FIRE_RL_fib_the_end =
	     fib_result_fifo$FULL_N && fib_active && fib_j == 32'd1 ;

  // rule RL_fib_n_is_zero
  assign WILL_FIRE_RL_fib_n_is_zero =
	     fib_result_fifo$FULL_N && fib_active && fib_j == 32'd0 ;

  // inputs to muxes for submodule ports
  assign MUX_fib_active$write_1__SEL_1 =
	     WILL_FIRE_RL_fib_n_is_zero || WILL_FIRE_RL_fib_the_end ;
  assign MUX_fib_a$write_1__VAL_1 = fib_a + fib_b ;
  assign MUX_fib_j$write_1__VAL_1 = fib_j - 32'd1 ;
  assign MUX_fib_j$write_1__VAL_2 = { 24'd0, n } ;

  // register fib_a
  assign fib_a$D_IN =
	     WILL_FIRE_RL_fib_loop ? MUX_fib_a$write_1__VAL_1 : 32'd1 ;
  assign fib_a$EN = WILL_FIRE_RL_fib_loop || WILL_FIRE_RL_loop ;

  // register fib_active
  assign fib_active$D_IN = !MUX_fib_active$write_1__SEL_1 ;
  assign fib_active$EN =
	     WILL_FIRE_RL_fib_n_is_zero || WILL_FIRE_RL_fib_the_end ||
	     WILL_FIRE_RL_loop ;

  // register fib_b
  assign fib_b$D_IN = WILL_FIRE_RL_fib_loop ? fib_a : 32'd0 ;
  assign fib_b$EN = WILL_FIRE_RL_fib_loop || WILL_FIRE_RL_loop ;

  // register fib_j
  assign fib_j$D_IN =
	     WILL_FIRE_RL_fib_loop ?
	       MUX_fib_j$write_1__VAL_1 :
	       MUX_fib_j$write_1__VAL_2 ;
  assign fib_j$EN = WILL_FIRE_RL_fib_loop || WILL_FIRE_RL_loop ;

  // register n
  assign n$D_IN = n + 8'd1 ;
  assign n$EN = WILL_FIRE_RL_loop ;

  // submodule fib_result_fifo
  assign fib_result_fifo$D_IN = WILL_FIRE_RL_fib_the_end ? fib_a : 32'd0 ;
  assign fib_result_fifo$ENQ =
	     WILL_FIRE_RL_fib_the_end || WILL_FIRE_RL_fib_n_is_zero ;
  assign fib_result_fifo$DEQ = WILL_FIRE_RL_display_results ;
  assign fib_result_fifo$CLR = 1'b0 ;

  // submodule inputs
  assign inputs$D_IN = n ;
  assign inputs$ENQ = WILL_FIRE_RL_loop ;
  assign inputs$DEQ = WILL_FIRE_RL_display_results ;
  assign inputs$CLR = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        fib_active <= `BSV_ASSIGNMENT_DELAY 1'd0;
	n <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (fib_active$EN)
	  fib_active <= `BSV_ASSIGNMENT_DELAY fib_active$D_IN;
	if (n$EN) n <= `BSV_ASSIGNMENT_DELAY n$D_IN;
      end
    if (fib_a$EN) fib_a <= `BSV_ASSIGNMENT_DELAY fib_a$D_IN;
    if (fib_b$EN) fib_b <= `BSV_ASSIGNMENT_DELAY fib_b$D_IN;
    if (fib_j$EN) fib_j <= `BSV_ASSIGNMENT_DELAY fib_j$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    fib_a = 32'hAAAAAAAA;
    fib_active = 1'h0;
    fib_b = 32'hAAAAAAAA;
    fib_j = 32'hAAAAAAAA;
    n = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_display_results)
	$display("fib(%2d)=%6d",
		 $unsigned(inputs$D_OUT),
		 $unsigned(fib_result_fifo$D_OUT));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_display_results && n == 8'd21) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // testbench

