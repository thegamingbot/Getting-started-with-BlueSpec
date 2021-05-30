package UpDownCounter;

    interface UpDownCounter_Ifc;
        method ActionValue#(Int#(4)) count1 (Int#(4) inp);
        method ActionValue#(Int#(4)) count2 (Int#(4) inp);
    endinterface
    
    module mkUpDownCounter(UpDownCounter_Ifc);
        
        Reg#(Int#(4)) counter <- mkReg(0);

        function ActionValue#(Int#(4)) modify (Int#(4) inp);
            actionvalue
                Int#(5) temp = extend(counter) + extend(inp);
                if (temp > 7) counter <= 7;
                else if (temp < -8) counter <= -8;
                else counter <= truncate(temp);
                return counter;
            endactionvalue
        endfunction : modify

        method count1 (Int#(4) inp) = modify(inp);
        method count2 (Int#(4) inp) = modify(inp);

    endmodule : mkUpDownCounter

endpackage : UpDownCounter
