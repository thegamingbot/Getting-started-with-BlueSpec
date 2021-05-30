package Shifter;

   import FIFOF::*;
   import GetPut::*;
   import ClientServer::*;

   import Shifter_Ifc::*;

   module mkShifter (Shifter_Ifc #(n));
      
      FIFOF#(Tuple2#(Bit#(n), Bit#(TLog#(n)))) in <- mkFIFOF;
      FIFOF#(Bit#(n)) out <- mkFIFOF;

      Reg#(Bit#(n)) regX <- mkRegU;
      Reg#(Bit#(TLog#(n))) regY <- mkRegU;
      Reg#(Bit#(TLog#(TLog#(n)))) it <- mkReg(0);

      Integer itMax = valueOf (TLog#(n)) - 1;

      rule r0 (it == 0);
         match {.x, .y} = in.first;
         in.deq;
         regX <= ((y[0] == 0) ? x : (x << 1));
         regY <= y;
         it <= 1;
      endrule

      for (Integer j = 1; j < itMax; j = j + 1)
         rule r1 (it == fromInteger (j));
            regX <= ((regY[j] == 0) ? regX : (regX << (2 ** j)));
            it <= it + 1;
         endrule

      rule r2 (it == fromInteger(itMax));
         let x = ((regY[itMax] == 0) ? regX : (regX << (2 ** itMax)));
         out.enq (x);
         it <= 0;
      endrule

      return toGPServer (in, out);

   endmodule

endpackage: Shifter
