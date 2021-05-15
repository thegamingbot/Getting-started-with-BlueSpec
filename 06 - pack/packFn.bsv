package packFn;

    (*synthesize*)
    module mkTb (Empty);

        Reg#(int) cycle <- mkReg (0);

        rule count_cycles;
            cycle <= cycle + 1;
            if (cycle > 7) $finish(0);
        endrule

        int x;
        x = 10;

        rule r (cycle < 8);
            int a = x;
            a = a * a;
            a = a - 5;

            if (pack(cycle)[0] == 0)
                a = a + 1;
            else 
                a = a + 2;
            if (pack(cycle)[1:0] == 3) 
                a = a + 3;
            for (int k = 20; k < 24; k = k + 1)
                a = a + k;
            $display ("%0d: rule r, a = %0d, pack(cycle) = %0d", cycle, a, pack(cycle));
        endrule: 0

    endmodule: mkTb

endpackage: packFn
