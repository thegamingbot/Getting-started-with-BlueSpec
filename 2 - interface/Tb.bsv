package Tb;
    (* synthesize *)
    module mkTb ();
        Ifc_type ifc <- mkModuleDeepThought;
        rule theUltimateAnswer;
            $display ("Hello World! The answer is: %0d",ifc.the_answer (10, 15, 17));
            $display ("Hello World! The answer is: %0d",ifc.the (10, 15, 17));
            $finish (0);
        endrule
    endmodule: mkTb

    interface Ifc_type;
        method int the_answer (int x, int y, int z);
        method int the (int a, int b, int c);
    endinterface: Ifc_type

    (* synthesize *)
    module mkModuleDeepThought (Ifc_type);
        method int the_answer (int x, int y, int z);
            return x + y + z;
        endmethod

        method int the (int x, int y, int z);
            return x + y - z;
        endmethod
    endmodule: mkModuleDeepThought
endpackage: Tb
