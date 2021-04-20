; SMT QUERY
(declare-fun isundef_%y () (_ BitVec 1))
(declare-fun isundef_%x () (_ BitVec 1))
(declare-fun undef!4 () (_ BitVec 8))
(declare-fun undef!3 () (_ BitVec 8))
(declare-fun np_%x () Bool)
(declare-fun np_%y () Bool)
(declare-fun %x () (_ BitVec 8))
(declare-fun %y () (_ BitVec 8))
(assert (let ((a!1 (forall ((undef!0 (_ BitVec 8))
                    (undef!1 (_ BitVec 8))
                    (undef!2 (_ BitVec 8)))
             (! (let ((a!1 (bvnot (bvor (bvnot undef!0)
                                        (bvnot (bvlshr #xff %y)))))
                      (a!2 (bvsle #x03
                                  (concat #b000000
                                          ((_ extract 1 0) (bvlshr #xff %y)))))
                      (a!3 (= (not (bvsle undef!3 (bvlshr #xff %y)))
                              (bvsle #x03 (bvlshr #xff %y)))))
                  (and np_%y
                       (= ((_ extract 7 3) %y) #b00000)
                       np_%x
                       (= (bvsle undef!2 a!1) a!2)
                       a!3))
                :weight 0)))
      (a!2 (forall ((undef!0 (_ BitVec 8))
                    (undef!1 (_ BitVec 8))
                    (undef!2 (_ BitVec 8)))
             (! (let ((a!1 (bvnot (bvor (bvnot %x)
                                        (bvnot (bvlshr #xff undef!1)))))
                      (a!3 (= (not (bvsle %x (bvlshr #xff undef!4)))
                              (bvsle %x #x1f))))
                (let ((a!2 (= (bvsle %x a!1)
                              (bvsle %x (concat #b000 ((_ extract 4 0) %x))))))
                  (and np_%y
                       (= ((_ extract 7 3) undef!1) #b00000)
                       np_%x
                       a!2
                       a!3)))
                :weight 0)))
      (a!3 (forall ((undef!0 (_ BitVec 8))
                    (undef!1 (_ BitVec 8))
                    (undef!2 (_ BitVec 8)))
             (! (let ((a!1 (bvnot (bvor (bvnot undef!0)
                                        (bvnot (bvlshr #xff undef!1))))))
                  (and np_%y
                       (= ((_ extract 7 3) undef!1) #b00000)
                       np_%x
                       (bvsle undef!2 a!1)
                       (not (bvsle undef!3 (bvlshr #xff undef!4)))))
                :weight 0))))
  (or (and a!1 (= isundef_%x #b1) (= #b0 isundef_%y))
      (and a!2 (= #b0 isundef_%x) (= isundef_%y #b1))
      (and a!3 (= isundef_%x #b1) (= isundef_%y #b1)))))
(check-sat)

