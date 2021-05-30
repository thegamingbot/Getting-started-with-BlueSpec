package TestBench;

    import GetPut::*;
    import ClientServer::*;

    import Shifter_Ifc::*;
    import Shifter::*;

    (* synthesize *)
    module mkTestBench ();
        Shifter_Ifc#(16) shifter <- mkShifter_16_4;

        Reg#(Bit#(5)) inp <- mkReg (0);

        rule rl_gen (inp < 16);
            shifter.request.put(tuple2(16'h01, truncate(inp)));
            inp <= inp + 1;
            $display ("Input : 0000000000000001 << %2d", inp);
        endrule

        rule rl_drain;
            let z <- shifter.response.get ();
            $display ("Output: %16b", z);
            if (z == 16'h8000) $finish ();
        endrule
    endmodule: mkTestBench

    (* synthesize *)
    module mkShifter_16_4 (Shifter_Ifc #(16));
        let m <- mkShifter;
        return m;
    endmodule

endpackage: TestBench
