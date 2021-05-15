package dataDoc;
    (* synthesize *)
    module mkTb (Empty);
        Reg#(int) step <- mkReg(0);
        Reg#(Int#(16)) int16 <- mkReg('h800);
        Reg#(UInt#(16)) uint16 <- mkReg('h800);

        rule step0 ( step == 0 );
            $display("== step 0 ==");
            // UInt#(16) foo = -1; // uncomment this to see error
            UInt#(16) foo = 'h1fff;
            $display("foo = %x", foo);
            foo = foo & 5;
            $display("foo = %x", foo);
            // [] is not legal for UInt (as it is for Bit)
            // $display("foo[0] = %x", foo[0]); // uncomment this and see error
            foo = 'hffff;
            $display("foo = %x", foo);
            // and it wraps just like you would expect it to
            foo = foo + 1;
            $display("foo = %x", foo);
            // beware the < 0 is never true (this is an unsigned number)
            // in fact, the compiler will display this the same as
            // $display("fooneg = %x", 1'd0);
            $display("fooneg = %x", foo < 0) ;
            // this is a quick way to get min and max
            UInt#(16) maxUInt16 = unpack('1); // all 1's
            UInt#(16) minUInt16 = unpack(0);
            $display("maxUInt16 = %x", maxUInt16);
            $display("minUInt16 = %x", minUInt16);
            $display("%x < %x == %x (unsigned)", minUInt16, maxUInt16, minUInt16 < maxUInt16);
            step <= step + 1;
        endrule
        //////////////////////////////////////////////////////////////////////
        rule step1 ( step == 1 );
            $display("\n== step 1 ==");
            // this is a quick way to get min and max
            Int#(16) maxInt16 = unpack({1'b0,'1}); // 'h011111
            Int#(16) minInt16 = unpack({1'b1,'0}); // 'h100000
            $display("maxInt16 = %x", maxInt16);
            $display("minInt16 = %x", minInt16);
            $display("%x < %x == %x (signed)", minInt16, maxInt16, minInt16 < maxInt16);
            // you can't do bit manipulation directly...
            // uncomment this to see the error generated
            // $display("error1 = %x", minInt16[4]);
            $display("maxInt16/4 = %x", maxInt16 / 4);
            int16 <= int16 / 4;
            step <= step + 1;
        endrule
        //////////////////////////////////////////////////////////////////////
        rule step2 ( step == 2 );
            $display("\n== step 2 ==");
            Int#(32) bar = 10;
            int foo = bar;
            $display("foo is 32 bits = %b", foo);
            bit onebit = 1;
            Bit#(1) anotherbit = onebit;
            $display("this is 1 bit = %b", onebit);
            step <= step + 1;
        endrule
        //////////////////////////////////////////////////////////////////////
        rule step3 ( step == 3 );
            $display("\n== step 3 ==");
            Bool b1 = True;
            Bool b2 = True;
            Bool b3 = b1 && b2;
            if ( b1 )
            $display("b1 is True");
            bit onebit = 1;
            // if (onebit) // uncomment this to see the type error
            // $display("onebit is a 1");
            if (onebit == 1)
            $display("onebit is a 1");
            step <= step + 1;
        endrule
        //////////////////////////////////////////////////////////////////////
        rule step4 ( step == 4 );
            $display ("\n=== ===");
            $display ("All done");
            $finish (0);
        endrule
    endmodule: mkTb
endpackage: dataDoc
