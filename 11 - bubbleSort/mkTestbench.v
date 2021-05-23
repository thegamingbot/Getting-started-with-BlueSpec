//
// Generated by Bluespec Compiler (build cd96b228)
//
// On Sun May 23 22:57:07 IST 2021
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

module mkTestbench(CLK,
		   RST_N);
  input  CLK;
  input  RST_N;

  // register lfsr_r
  reg [7 : 0] lfsr_r;
  wire [7 : 0] lfsr_r$D_IN;
  wire lfsr_r$EN;

  // register rg_j1
  reg [23 : 0] rg_j1;
  wire [23 : 0] rg_j1$D_IN;
  wire rg_j1$EN;

  // register rg_j2
  reg [23 : 0] rg_j2;
  wire [23 : 0] rg_j2$D_IN;
  wire rg_j2$EN;

  // ports of submodule sorter
  wire [23 : 0] sorter$get, sorter$put_x;
  wire sorter$EN_get, sorter$EN_put, sorter$RDY_get, sorter$RDY_put;

  // rule scheduling signals
  wire WILL_FIRE_RL_rl_drain_outputs;

  // submodule sorter
  mkBubbleSort_nt_UInt20 sorter(.CLK(CLK),
				.RST_N(RST_N),
				.put_x(sorter$put_x),
				.EN_put(sorter$EN_put),
				.EN_get(sorter$EN_get),
				.RDY_put(sorter$RDY_put),
				.get(sorter$get),
				.RDY_get(sorter$RDY_get));

  // rule RL_rl_drain_outputs
  assign WILL_FIRE_RL_rl_drain_outputs = sorter$RDY_get && rg_j2 < 24'd20 ;

  // register lfsr_r
  assign lfsr_r$D_IN =
	     lfsr_r[0] ?
	       { 1'd1, lfsr_r[7:5], ~lfsr_r[4:2], lfsr_r[1] } :
	       { 1'd0, lfsr_r[7:1] } ;
  assign lfsr_r$EN = sorter$RDY_put && rg_j1 < 24'd20 ;

  // register rg_j1
  assign rg_j1$D_IN = rg_j1 + 24'd1 ;
  assign rg_j1$EN = sorter$RDY_put && rg_j1 < 24'd20 ;

  // register rg_j2
  assign rg_j2$D_IN = rg_j2 + 24'd1 ;
  assign rg_j2$EN = WILL_FIRE_RL_rl_drain_outputs ;

  // submodule sorter
  assign sorter$put_x = { 16'd0, lfsr_r } ;
  assign sorter$EN_put = sorter$RDY_put && rg_j1 < 24'd20 ;
  assign sorter$EN_get = WILL_FIRE_RL_rl_drain_outputs ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        lfsr_r <= `BSV_ASSIGNMENT_DELAY 8'd1;
	rg_j1 <= `BSV_ASSIGNMENT_DELAY 24'd0;
	rg_j2 <= `BSV_ASSIGNMENT_DELAY 24'd0;
      end
    else
      begin
        if (lfsr_r$EN) lfsr_r <= `BSV_ASSIGNMENT_DELAY lfsr_r$D_IN;
	if (rg_j1$EN) rg_j1 <= `BSV_ASSIGNMENT_DELAY rg_j1$D_IN;
	if (rg_j2$EN) rg_j2 <= `BSV_ASSIGNMENT_DELAY rg_j2$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    lfsr_r = 8'hAA;
    rg_j1 = 24'hAAAAAA;
    rg_j2 = 24'hAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (sorter$RDY_put && rg_j1 < 24'd20)
	$display("%0d", $unsigned({ 16'd0, lfsr_r }));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_drain_outputs)
	$display("%0d", $unsigned(sorter$get));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_drain_outputs && rg_j2 == 24'd19) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTestbench

