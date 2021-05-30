package UpDownCounter;

    interface UpDownCounter_Ifc;
        method ActionValue#(Int#(4)) count1 (Int#(4) inp);
        method ActionValue#(Int#(4)) count2 (Int#(4) inp);
    endinterface
    
    module mkUpDownCounter(UpDownCounter_Ifc);
        
        Reg#(Int#(4)) counter [2] <- mkCReg(2, 0);

        function ActionValue#(Int#(4)) modify (Integer p, Int#(4) inp);
            actionvalue
                Int#(5) temp = extend(counter[p]) + extend(inp);
                if (temp > 7) counter[p] <= 7;
                else if (temp < -8) counter[p] <= -8;
                else counter[p] <= truncate(temp);
                return counter[p];
            endactionvalue
        endfunction : modify

        method ActionValue#(Int#(4)) count1 (Int#(4) inp);
            let x <- modify(0, inp);
            return x;
        endmethod

        method ActionValue#(Int#(4)) count2 (Int#(4) inp);
            let x <- modify(1, inp);
            return x;
        endmethod

    endmodule : mkUpDownCounter

endpackage : UpDownCounter
