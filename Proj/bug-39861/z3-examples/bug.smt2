(declare-fun %x () (_ BitVec 8))
(declare-fun %y () (_ BitVec 8))
; (assert (not (= %y #x00))) ; 0
(assert
 (let ((a!1 (bvlshr #xff %y)))
  (not (= ; assert the opposite
        (bvsge ; source function
         (bvand a!1 %x) 
         %x)
        (bvsge ; target function
         a!1 %x)))))
(check-sat)
(get-model)

