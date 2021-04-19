package Tb1;

    import multiple::*;

    (* synthesize *)
    module mkTb ();
        Ifc_type ifc <- mkModuleDeepThought;
        rule theUltimateAnswer; 
            $display ("Hello World! The answer is: %0d",ifc.the_answer (10, 15, 17));
            $display ("Hello World! The answer is: %0d",ifc.the (10, 15, 17));
            $finish (0);
        endrule
    endmodule: mkTb

endpackage: Tb1
