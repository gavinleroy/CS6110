(declare-fun isundef_%y () (_ BitVec 1))
(declare-fun isundef_%x () (_ BitVec 1))
(declare-fun undef!4 () (_ BitVec 8))
(declare-fun undef!3 () (_ BitVec 8))
(declare-fun %x () (_ BitVec 8))
(declare-fun %y () (_ BitVec 8))
; (assert (not (= %y #x00)))
(assert (or (and (forall ((undef!0 (_ BitVec 8))
                  (undef!1 (_ BitVec 8))
                  (undef!2 (_ BitVec 8)))
           (! (let ((a!1 (bvnot (bvor (bvnot %x) (bvnot (bvlshr #xff %y))))))
              (let ((a!2 (or (not (= ((_ extract 7 3) %y) #b00000))
                             (= (bvsle %x a!1) (bvsle %x (bvlshr #xff %y))))))
                (not a!2)))
              :weight 0))
         (= #b0 isundef_%x)
         (= #b0 isundef_%y))
    (and (forall ((undef!0 (_ BitVec 8))
                  (undef!1 (_ BitVec 8))
                  (undef!2 (_ BitVec 8)))
           (! (let ((a!1 (bvnot (bvor (bvnot undef!0) (bvnot (bvlshr #xff %y))))))
              (let ((a!2 (or (not (= ((_ extract 7 3) %y) #b00000))
                             (= (bvsle undef!2 a!1)
                                (bvsle undef!3 (bvlshr #xff %y))))))
                (not a!2)))
              :weight 0))
         (= isundef_%x #b1)
         (= #b0 isundef_%y))
    (and (forall ((undef!0 (_ BitVec 8))
                  (undef!1 (_ BitVec 8))
                  (undef!2 (_ BitVec 8)))
          ; %y is undef
           (! 
            (let 
             (
              (a!1 (not (and ; 0 0 0 0 0 -- 0 0 0
                         ; undf!1 is le 7
                         (= ((_ extract 7 3) undef!1) #b00000)
                         ; undf!4 is le 7
                         (= ((_ extract 7 3) undef!4) #b00000))))
              (a!2 (bvnot (bvor (bvnot %x) (bvnot (bvlshr #xff undef!1))))))
             (let 
              (
               (a!3 (or 
                     a!1
                     (= (bvsle %x a!2) (bvsle %x (bvlshr #xff undef!4))))))
              (not a!3)))
            :weight 0))

         (= #b0 isundef_%x)
         (= isundef_%y #b1))

  ; undef!0 : %x from src for BVAND
  ; undef!1 : %y from src
  ; undef!2 : %x from src (second read)
  ; undef!3 : %x from tgt
  ; undef!4 : %y from tgt
  (and (forall ((undef!0 (_ BitVec 8))
                (undef!1 (_ BitVec 8))
                (undef!2 (_ BitVec 8)))
        (! (let ((a!1 ; a!1 = ! ( undef!1 <= 7  &&  undef!4 <= 7 )
                  (not (and (= ((_ extract 7 3) undef!1) #b00000)
                        (= ((_ extract 7 3) undef!4) #b00000))))
                 (a!2 
                  ; a!2 = ~( ~undef!0 | ~( 255 >> undef!1 ) )
                  ; a!2 = ( undef!0 & ( 255 >> undef!1 ) )
                  (bvnot (bvor (bvnot undef!0)
                          (bvnot (bvlshr #xff undef!1))))))
            (let ((a!3 
                   (or a!1 ; creating a poison value
                    (=
                     (bvsle undef!2 a!2) ; undef!2 is %x from src
                     (bvsle undef!3 (bvlshr #xff undef!4))))))
             (not a!3)))
         :weight 0))
   (= isundef_%x #b1)
   (= isundef_%y #b1))))

(check-sat)
(get-model)
