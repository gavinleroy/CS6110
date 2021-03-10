# Notes

This file will contain a typed version of my notes regarding 
the file in the `README.md` for learning resources.

:warning: _I have not properly cited anything and most of the time these
notes are quoting the author directly. All of the ideas and content
in this file are attributed to the authors of the respective articles._

1. [Undefined Behavior in LLVM](#undefined-behavior-in-llvm)
2. [Alive2 Part 1](#alive2-part-1)
3. [Alive2 Part 2](#alive2-part-2)

## [Undefined Behavior in LLVM](https://www.cs.utah.edu/~regehr/llvm-ub.pdf)

Undefined behavior (UB) is a design choice when designers can't 
commit (or simply don't want to) to other semantic choices.
With it, anything can happen next:

> *"Permissible	undefined	behavior	ranges	from	ignoring	the	situaLon	completely	with	
> unpredictable	results,	to	having	demons	fly	out	of	your	nose."*

LLVM has three different kinds of UB:

1. Undef
  * Explicit value in the IR
  * Acts like a free floating hardware register
    - Takes all possible bit patterns at the specified width
    - Can take a different value every time it is used
  * Comes from uninitialized variables

2. Poison
  * Ephemeral affect of math instructions that violate
    - nsw - no signed wrap for add,sub,mul,shl
    - nuw - no unsigned wrap for add,sub,mul,shl
    - exact - no remainder for sdiv,udiv,lshr,ashr
  * Designed to support speculative execution of operations that might overflow
  * Poison propagates via instruction results
  * If poison reaches a side-effecting instruction, the result is true UB

3. True UB
  * Triggered by
    - Divide by zero
    - Illegal memory access
  * Anything can happen as a result

## [Alive2 Part 1](https://blog.regehr.org/archives/1722)

Alive2 concerns itself with *refinement* rather than equivalence. 
Many compilers will change the meaning of code but in allowed ways.
Take for example the following: 
```
define i16 @src(i16 %x, i16 %y) {
    %r = sdiv i16 %x, %y
    ret i16 %r
}

define i16 @tgt(i16 %x, i16 %y) {
    %z = icmp eq i16 %y, 0
    br i1 %z, label %zero, label %nonzero
zero:
    ret i16 8888
nonzero:
    %q = sdiv i16 %x, %y
    ret i16 %q
}
```
In the above code, `tgt` is a refinement of `src`. In `src` the quotient of 
`x` and `y` is simply returned, however, division by 0 is undefined. In `tgt`
we say that a division by 0 will return 8888, that is, it took what was previously
*undefined* and gave meaning to it. However, we _could not go the other way_, i.e. turn 
something with meaning into an undefined operation. Said in a different way, we can only add
definition when going from `src` to `tgt` as long as it follows the same rules.

Refinement failing means that one of the following conditions holds:

1. the source and target return different concrete answers

2. the source function returns a concrete answer but the target function is undefined

3. there is a failure of refinement in the memory locations touched by the function

A few things are unsupported (as of March 12, 2020) or have limited support:

* Loops, Alive2 only unrolls loops once and as a result errors may go undedected
  if they are manifested only after 1 iteration.

* Interprocedural optimization, Alive2 does not look across functions.

* Code that makies Z3 (the underlying SMT solver) take too long. Common examples are
  Floating-point operations, wide integer division, and complex memory operations.
  
## [Alive2 Part 2](https://blog.regehr.org/archives/1737)


A large portion of the current verifications done with Alive2 were on the LLVM
unit test suite. 

A site to track the bugs over time [Project Zero LLVM Bugs](https://web.ist.utl.pt/nuno.lopes/alive2/).

Examples of open bugs in LLVM (as of June, 2020):

* Introduction of branch on poison/undef: optimization that hoist branches or combine
  multiple branches can introduce branches on values unobserved in the original program. 
  An example program of this may be
  ```
  if (x) {
    if (y) {
      S1
    }
  }

  = OPTIMIZED TO =>

  if (x & y) {
    S1
  }
  ```
