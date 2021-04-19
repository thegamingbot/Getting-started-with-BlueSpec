package multiple;

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
endpackage: multiple
