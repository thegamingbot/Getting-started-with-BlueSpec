package BubbleSort;

    import Vector::*;

    interface BubbleSort_IFC #(numeric type n_t, type t);
        method Action put (t x);
        method ActionValue #(t) get;
    endinterface

    module mkBubbleSort(BubbleSort_IFC #(n_t, t))
        provisos(Bits #(t, wt), Ord #(t), Eq #(t));
        
        Integer n = valueOf(n_t);
        Integer jMax = n-1;

        Reg#(UInt #(16)) counter <- mkReg(0);
        Vector#(n_t, Reg#(Maybe#(t))) arr <- replicateM (mkReg(tagged Invalid));

        for (Integer i = 0; i < n-1; i = i+1)
            rule rl_swap_i (arr[i] > arr[i+1]);
                arr[i] <= arr[i+1];
                arr[i+1] <= arr[i];
            endrule

        function Bool done ();
            Bool b = (counter == fromInteger(n));
            for (Integer i = 0; i < n-1; i = i+1)
                b = b && (arr[i] <= arr[i+1]);
            return b;
        endfunction

        method Action put (t x) if ((counter < fromInteger(n)) && arr[jMax] == tagged Invalid);
            arr[jMax] <= tagged Valid x;
            counter <= counter + 1;
        endmethod

        method ActionValue#(t) get () if (arr[0] matches tagged Valid .x0 &&& done);
            writeVReg (arr, shiftInAtN(readVReg (arr), tagged Invalid));
            if (arr[1] == tagged Invalid)
                counter <= 0;
            return x0;
        endmethod
    endmodule: mkBubbleSort

    instance Ord#(Maybe#(t))
    provisos(Ord#(t));
        function Bool \<=  (Maybe#(t) mx1, Maybe#(t) mx2);
            case(tuple2(mx1, mx2)) matches
                {tagged Valid .x1, tagged Valid .x2}: return (x1 <= x2);
                {tagged Valid .x1, tagged Invalid}: return True;
                {tagged Invalid, tagged Valid .x2}: return False;
                {tagged Invalid, tagged Invalid}: return True;
            endcase
        endfunction
    endinstance

endpackage: BubbleSort
