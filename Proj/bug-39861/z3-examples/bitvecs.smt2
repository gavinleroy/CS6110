(display #b0100)
(display (_ bv20 8))
(display (_ bv20 7))
(display #x0a) 
(set-option :pp.bv-literals false)
(display #b0100)
(display (_ bv20 8))
(display (_ bv20 7))
(display #x0a) 

(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(assert (not (= (bvand (bvnot x) (bvnot y)) (bvnot (bvor x y)))))
(check-sat)
