import ServerFarm::*;
import fibonacci::*;
import FIFO::*;
import ClientServer::*;
import GetPut::*;

(* synthesize *)
module testbench();
   
    FibServerT#(8)  fib    <- mkServerFarm(10, mkFibServer);
    Reg#(UInt#(8))  n      <- mkReg(0);
    FIFO#(UInt#(8)) inputs <- mkSizedFIFO(4);

    rule loop (n <= 20);
        n <= n+1;
        fib.request.put(n);
        inputs.enq(n);
    endrule
    
    rule display_results;
        let r <- fib.response.get();
        inputs.deq;
        $display("fib(%2d)=%6d", inputs.first, r);
        if (inputs.first == 20)
            $finish;
    endrule
    
endmodule : testbench
