//
// Generated by Bluespec Compiler (build 00185f79)
//
// On Sat Apr 10 21:01:07 IST 2021
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

  // register cycle
  reg [31 : 0] cycle;
  wire [31 : 0] cycle$D_IN;
  wire cycle$EN;

  // register rx
  reg [31 : 0] rx;
  wire [31 : 0] rx$D_IN;
  wire rx$EN;

  // register ry
  reg [31 : 0] ry;
  wire [31 : 0] ry$D_IN;
  wire ry$EN;

  // ports of submodule s_fi
  wire [63 : 0] s_fi$D_IN, s_fi$D_OUT;
  wire s_fi$CLR, s_fi$DEQ, s_fi$EMPTY_N, s_fi$ENQ;

  // ports of submodule s_fo
  wire [63 : 0] s_fo$D_IN, s_fo$D_OUT;
  wire s_fo$CLR, s_fo$DEQ, s_fo$EMPTY_N, s_fo$ENQ, s_fo$FULL_N;

  // submodule s_fi
  FIFO2 #(.width(32'd64), .guarded(1'd1)) s_fi(.RST(RST_N),
					       .CLK(CLK),
					       .D_IN(s_fi$D_IN),
					       .ENQ(s_fi$ENQ),
					       .DEQ(s_fi$DEQ),
					       .CLR(s_fi$CLR),
					       .D_OUT(s_fi$D_OUT),
					       .FULL_N(),
					       .EMPTY_N(s_fi$EMPTY_N));

  // submodule s_fo
  FIFO2 #(.width(32'd64), .guarded(1'd1)) s_fo(.RST(RST_N),
					       .CLK(CLK),
					       .D_IN(s_fo$D_IN),
					       .ENQ(s_fo$ENQ),
					       .DEQ(s_fo$DEQ),
					       .CLR(s_fo$CLR),
					       .D_OUT(s_fo$D_OUT),
					       .FULL_N(s_fo$FULL_N),
					       .EMPTY_N(s_fo$EMPTY_N));

  // register cycle
  assign cycle$D_IN = cycle + 32'd1 ;
  assign cycle$EN = 1'd1 ;

  // register rx
  assign rx$D_IN = 32'h0 ;
  assign rx$EN = 1'b0 ;

  // register ry
  assign ry$D_IN = 32'h0 ;
  assign ry$EN = 1'b0 ;

  // submodule s_fi
  assign s_fi$D_IN = 64'h0 ;
  assign s_fi$ENQ = 1'b0 ;
  assign s_fi$DEQ = s_fi$EMPTY_N && s_fo$FULL_N ;
  assign s_fi$CLR = 1'b0 ;

  // submodule s_fo
  assign s_fo$D_IN =
	     { s_fi$D_OUT[63:32] + 32'd15, s_fi$D_OUT[31:0] + 32'd28 } ;
  assign s_fo$ENQ = s_fi$EMPTY_N && s_fo$FULL_N ;
  assign s_fo$DEQ = s_fo$EMPTY_N ;
  assign s_fo$CLR = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cycle <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rx <= `BSV_ASSIGNMENT_DELAY 32'd0;
	ry <= `BSV_ASSIGNMENT_DELAY 32'd0;
      end
    else
      begin
        if (cycle$EN) cycle <= `BSV_ASSIGNMENT_DELAY cycle$D_IN;
	if (rx$EN) rx <= `BSV_ASSIGNMENT_DELAY rx$D_IN;
	if (ry$EN) ry <= `BSV_ASSIGNMENT_DELAY ry$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cycle = 32'hAAAAAAAA;
    rx = 32'hAAAAAAAA;
    ry = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (s_fo$EMPTY_N)
	$display("%0d: rule sink, returned value is Coord { x: %0d, y: %0d }",
		 $signed(cycle),
		 $signed(s_fo$D_OUT[63:32]),
		 $signed(s_fo$D_OUT[31:0]));
    if (RST_N != `BSV_RESET_VALUE)
      if ((cycle ^ 32'h80000000) > 32'h80000007) $finish(32'd0);
  end
  // synopsys translate_on
endmodule  // mkTb

