; SMT QUERY
(declare-fun isundef_%y () (_ BitVec 1))
(declare-fun np_%x () Bool)
(declare-fun undef!4 () (_ BitVec 8))
(declare-fun np_%y () Bool)
(assert (and (forall ((undef!0 (_ BitVec 8))
              (undef!1 (_ BitVec 8))
              (undef!2 (_ BitVec 8)))
       (! (let ((a!1 (not (and np_%y
                               (= ((_ extract 7 3) undef!1) #b00000)
                               np_%x))))
          (let ((a!2 (or a!1
                         (and np_%y (= ((_ extract 7 3) undef!4) #b00000) np_%x))))
            (not a!2)))
          :weight 0))
     (= isundef_%y #b1)))
(check-sat)

