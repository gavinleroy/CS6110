// Each phil’s algorithm is below
proctype phil(chan lfp, lfv, rfp, rfv)
{ do
  :: lfp!0 -> rfp!0 -> printf("Eating") -> lfv!0 -> rfv!0
  od
}
// This is a mutex with the P and V operations
// https://en.wikipedia.org/wiki/Semaphore_(programming)
//
proctype fork(chan p, v)
{ do
  :: p?0 // Fork taken!
  -> v?0 // Fork returned!
od
}
init {
  chan p0 = [0] of { bit };
  chan v0 = [0] of { bit };
  chan p1 = [0] of { bit };
  chan v1 = [0] of { bit };
  chan p2 = [0] of { bit };
  chan v2 = [0] of { bit };
  atomic {
    // Connect and run Phil P0 to grab
    // fork 0 on left, then
    // fork 2 on right
    run phil(p0, v0, p2, v2);
    // Connect and run Phil P1 to grab
    // fork 1 on left
    // fork 0 on right
    run phil(p1, v1, p0, v0);
    // Connect and run Phil P2 to grab
    // fork 2 on left
    // fork 1 on right
    run phil(p2, v2, p1, v1);
  }
}
