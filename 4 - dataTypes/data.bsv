package data;

    (*synthesize*)
    module mkTb();
    
        Reg#(UInt#(16)) variable <- mkReg('h43a);
        Reg#(Bool) boo <- mkReg(True);

        function Action print (String s);

            return action

                Bool b1 = True;
                if (!b1)
                    $display("%0d", variable);
                $display("%x", boo);
                $display("Hi, "+s);

            endaction;

        endfunction: print

        rule init;
        
            String s = "thegamingbot";
            print(s);
            $finish;
        
        endrule

    endmodule: mkTb

endpackage: data
