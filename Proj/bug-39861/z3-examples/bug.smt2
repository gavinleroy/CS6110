(declare-fun %x () (_ BitVec 8))
(declare-fun %y () (_ BitVec 8))

(assert
 (not (= 
       (bvsge ; source function
        (bvand 
         (bvlshr #xFF %y) 
         %x) 
        %x)
       (bvsge ; target function
        (bvlshr #xFF %y)
        %x)
      )))

; (assert (not (= %y #x00))) ; 0

(check-sat)
(get-model)

