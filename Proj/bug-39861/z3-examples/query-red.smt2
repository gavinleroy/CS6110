(declare-fun %y () (_ BitVec 8))
(declare-fun %x () (_ BitVec 8))
(assert 
 (let ((a!1 
        (= 
         (bvsle %x (bvand %x (bvlshr #xff %y)))
         (bvsle %x (bvlshr #xff %y)))))
  (not (or 
        (not (bvule %y #x07)) ; ??
        a!1))))

(check-sat)
(get-model)
