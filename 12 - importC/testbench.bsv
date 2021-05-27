import "BDPI" rand32 = function ActionValue#(Bit#(32)) bsv_rand32;
import FIFO::*;

(* synthesize *)
module mkTestbench();

    FIFO#(Bit#(32)) myFIFO <- mkSizedFIFO(9);

    rule fill;
        let x <- bsv_rand32;
        myFIFO.enq(x);
    endrule

    rule empty;
        myFIFO.deq();
        $display(myFIFO.first);
        $finish;
    endrule

endmodule


