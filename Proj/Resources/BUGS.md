Bugs
===

This file contains a list of possible bugs that could be studied. 

A master list of all bugs can be found on 
[GitHub](https://github.com/AliveToolkit/alive2/blob/master/BugList.md)
and potential bugs for me to study will be listed specifically here.

B1
--

[B1](https://bugs.llvm.org/show_bug.cgi?id=39861#c0)

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

B2
--

[B2](https://alive2.llvm.org/ce/z/2DK77z)

*TODO insert description of bug*

