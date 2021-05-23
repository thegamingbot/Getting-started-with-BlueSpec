// Copyright (c) 2013-2016 Bluespec, Inc.  All Rights Reserved.

package Testbench;

// ================================================================
// Testbench to drive the sorting module.
// Feed n unsorted inputs to sorter,
// drain n sorted outputs and print
// ================================================================
// BSV lib imports

import LFSR   :: *;
import Vector :: *;

// ================================================================
// Project imports

import BubbleSort :: *;

// ================================================================
// Size of array to be sorted

typedef 20 N_t;
typedef UInt #(24)  MyT;

MyT n = fromInteger (valueOf (N_t));

// ================================================================
// Testbench module

(* synthesize *)
module mkTestbench (Empty);
   Reg #(MyT) rg_j1 <- mkReg (0);
   Reg #(MyT) rg_j2 <- mkReg (0);

   // Instantiate an 8-bit random number generator from BSV lib
   LFSR #(Bit #(8)) lfsr <- mkLFSR_8;

   // Instantiate the parallel sorter
   BubbleSort_IFC #(N_t, MyT) sorter <- mkBubbleSort_nt_UInt20;

   rule rl_feed_inputs (rg_j1 < n);
      lfsr.next ();
      MyT x = unpack (zeroExtend (lfsr.value ()));
      sorter.put (x);
      rg_j1 <= rg_j1 + 1;
      $display ("%0d", x);
   endrule

   rule rl_drain_outputs (rg_j2 < n);
      let y <- sorter.get ();
      rg_j2 <= rg_j2 + 1;
      $display ("%0d", y);
      if (rg_j2 == n-1) $finish;
   endrule
endmodule

// ================================================================
// Instantiate and separately synthesize a Bubblesort module for size 'N_t'
// and type 'MyT'

(*synthesize*)
module mkBubbleSort_nt_UInt20 (BubbleSort_IFC #(N_t,MyT));
   BubbleSort_IFC #(N_t, MyT) m <- mkBubbleSort;
   return m;
endmodule

// ================================================================

endpackage
