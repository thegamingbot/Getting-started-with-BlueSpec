package variable;

    typedef struct {int a; int b; Bool c;} New
    deriving(Bits);

    (* synthesize *)
    module mkTb();

        let s1 = New{a: 1, b: 2, c: True};

        rule print;
            $display("%0d, %0d, %x", s1.a, s1.b, s1.c);
            $finish;
        endrule: print

    endmodule: mkTb

endpackage: variable
