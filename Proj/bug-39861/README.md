Bug 39861
=========

This file explores how [bug 39861](https://bugs.llvm.org/show_bug.cgi?id=39861#c0)

interacts and how Alive2 came to find it.

Bug Report
----------

The report filed can be found at the above link and my notes are described as follows:

```
; Two 1 byte values:
;   x = 62, y = 0
define i1 @src(i8 %x, i8 %y) {
  ; %y = 0, tmp0 = 255 (all 1's)
  %tmp0 = lshr i8 255, %y
  ; x = 62, %tmp1 = 62
  %tmp1 = and i8 %tmp0, %x
  ; sge : signed greater or equal (<op1> >= <op2>)
  ; x = 62, tmp1 = 62
  ; ret = 1 :)
  %ret = icmp sge i8 %tmp1, %x
  ret i1 %ret
}

define i1 @tgt(i8 %x, i8 %y) {
  ; y = 0, tmp0 = 255
  %tmp0 = lshr i8 255, %y
  ; x = 62
  ; tmp0 = 255 (signed -127)
  ; l = 0
  %1 = icmp sge i8 %tmp0, %x
  ret i1 %1
}
```

CPP-tests
---------

There are several files with LLVM IR code that can be run with `clang <file>`.
These files test all values for `%x` and `%y` in the interval `[0, 254]` and compare
the results. The LLVM IR was initially generated using `clang -S -emit-llvm main.cpp`
then to get the separate files I personally modified the `src` and `tgt` functions to 
replicate the functionality of those in the bug report. While these `.ll` files are largely
the same, the one that is most recent is `main.ll`.

Using the cpp test `main.ll` we can see that there are exactly 255 cases where this transormation fails.
Namely, for any `%x` value paired with a `%y` value of 0:

There was a test for this in the original Alive release, this test can be found
[here](https://rise4fun.com/Alive/I3O). The failing test slipped past because `%y = 0` is
not a power of two and therefore caused the test in  
*canonicalize-constant-low-bit-mask-and-icmp-slt-to-icmp-sgt.ll* to fail.

Z3 encoding
-----------

In the folder `z3-examples` there are several files, some which contain some practice SMT2 code,
however, the file `bug.smt2` is specifically an evolution of my encoding of this particular
bug.

*todo*

