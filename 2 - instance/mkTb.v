//
// Generated by Bluespec Compiler (build 00185f79)
//
// On Wed Apr  7 20:23:14 IST 2021
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

  // ports of submodule ifc
  wire [31 : 0] ifc$the,
		ifc$the_a,
		ifc$the_answer,
		ifc$the_answer_x,
		ifc$the_answer_y,
		ifc$the_answer_z,
		ifc$the_b,
		ifc$the_c;

  // submodule ifc
  mkModuleDeepThought ifc(.CLK(CLK),
			  .RST_N(RST_N),
			  .the_a(ifc$the_a),
			  .the_answer_x(ifc$the_answer_x),
			  .the_answer_y(ifc$the_answer_y),
			  .the_answer_z(ifc$the_answer_z),
			  .the_b(ifc$the_b),
			  .the_c(ifc$the_c),
			  .the_answer(ifc$the_answer),
			  .RDY_the_answer(),
			  .the(ifc$the),
			  .RDY_the());

  // submodule ifc
  assign ifc$the_a = 32'd10 ;
  assign ifc$the_answer_x = 32'd10 ;
  assign ifc$the_answer_y = 32'd15 ;
  assign ifc$the_answer_z = 32'd17 ;
  assign ifc$the_b = 32'd15 ;
  assign ifc$the_c = 32'd17 ;

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    $display("Hello World! The answer is: %0d", $signed(ifc$the_answer));
    $display("Hello World! The answer is: %0d", $signed(ifc$the));
    $finish(32'd0);
  end
  // synopsys translate_on
endmodule  // mkTb

