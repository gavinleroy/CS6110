; (declare-fun np_%x () Bool)
; (declare-fun %y () (_ BitVec 8))
; (declare-fun np_%y () Bool)
; (assert (let ((a!1 
;                (not (and ; npx && vv
;                      (and np_%y ; npy && npx && y <= 7
;                       (bvule %y #x07) 
;                       np_%x) 
;                      np_%x))))
;   (not (or a!1 (and np_%y (bvule %y #x07) np_%x)))))

(declare-fun %y () (_ BitVec 8))
(declare-fun %x () (_ BitVec 8))
(declare-fun np_%x () Bool)
(declare-fun np_%y () Bool)
(assert (let ((a!1 (not (and np_%y (bvule %y #x07) np_%x)))
              (a!2 (= (bvsle %x (bvand %x (bvlshr #xff %y)))
                    (bvsle %x (bvlshr #xff %y)))))
  (not (or a!1 a!2))))

(check-sat)
(get-model)
