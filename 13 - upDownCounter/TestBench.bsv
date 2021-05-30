package TestBench;
    
    import UpDownCounter::*;

    (* synthesize *)
    module mkTestBench();

        UpDownCounter_Ifc counter <- mkUpDownCounter;

        Reg#(Int#(32)) step <- mkReg(0);
        Reg#(Bool) flag1 <- mkReg(False);
        Reg#(Bool) flag2 <- mkReg(False);

        function Action print (Bool is1, Int#(4) inp);
            action
                let x <- (is1 ? counter.count1(inp) : counter.count2(inp));
                $display(x);
            endaction
        endfunction

        rule r0 (step == 0);
            print(True, 2);
            step <= 1;
        endrule

        rule r1 (step == 1);
            print(True, 7);
            step <= 2;
        endrule

        rule r2 (step == 2);
            print(True, -8);
            step <= 3;
        endrule

        rule r3 (step == 3);
            print(True, -8);
            step <= 4;
        endrule

        rule r4 (step == 4 && !flag1);
            print(True, 4);
            flag1 <= True;
        endrule

        rule r5 (step == 4 && !flag2);
            print(False, 7);
            flag2 <= True;
        endrule

        rule r6 (step == 4 && flag1 && flag2);
            print(False, -4);
            $finish;
        endrule

    endmodule : mkTestBench

endpackage : TestBench
