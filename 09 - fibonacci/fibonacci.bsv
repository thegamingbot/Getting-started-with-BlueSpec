import FIFO::*;
import GetPut::*;
import ClientServer::*;
import Vector::*;

// specialisation of Server interface for Fib
typedef Server#(UInt#(width), UInt#(TMul#(width,4))) FibServerT#(numeric type width);

module mkFibServer(FibServerT#(width))
    provisos (Add#(a__, width, TMul#(width, 4)));

    Reg#(UInt#(TMul#(width,4))) a <- mkRegU;
    Reg#(UInt#(TMul#(width,4))) b <- mkRegU;
    Reg#(UInt#(TMul#(width,4))) j <- mkRegU;
    Reg#(Bool) active <- mkReg(False);
    FIFO#(UInt#(TMul#(width,4))) result_fifo <- mkLFIFO;
    
    rule loop (active && (j>1));
        a <= a+b;
        b <= a;
        j <= j-1;
    endrule
    
    rule the_end (active && (j==1));
        result_fifo.enq(a);
        active <= False;
    endrule
    
    rule n_is_zero (active && (j==0));
        result_fifo.enq(0);
        active <= False;
    endrule
    
    interface Put request;
        method Action put(n) if (!active);
        j <= extend(n);
        a <= 1;
        b <= 0;
        active <= True;
        endmethod
    endinterface
    
    interface response = toGet(result_fifo);

endmodule
