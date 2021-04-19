import StmtFSM::*;
import LFSR::*;
import gcd::*;

(* synthesize *)
module mkTestBench();
    // LFSR#(Bit#(32)) lfsr <- mkLFSR_32;
    GCD gcdVariable <- mkGCD();
    
    Reg#(Bit#(32)) x <- mkReg(342);
    Reg#(Bit#(32)) y <- mkReg(4314);

    Stmt test = seq
        /*
        lfsr.seed('b10001010);
        x <= lfsr.value;
        lfsr.next;
        lfsr.seed('b110110010);
        y <= lfsr.value;
        */
        gcdVariable.compute(x, y);
        $display("GCD(%0d, %0d) = %0d", x, y, gcdVariable.getGCD());
    endseq;
    mkAutoFSM(test);

endmodule : mkTestBench
