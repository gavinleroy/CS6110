; SMT QUERY
(declare-fun isundef_%y () (_ BitVec 1)) ; if y is undef
(declare-fun isundef_%x () (_ BitVec 1)) ; if x is undef
(declare-fun undef!4 () (_ BitVec 8))
(declare-fun %x () (_ BitVec 8)) ; the value to the actual function
(declare-fun np_%x () Bool)
(declare-fun np_%y () Bool)
(declare-fun undef!3 () (_ BitVec 8))
(declare-fun %y () (_ BitVec 8)) ; second value to the actual function

(assert 
 ; one of the next and blocks must be true
 (or ; BEGIN OR 1

  ; CASE x is undef, y is def
  (and ; BEGIN AND 1
   (forall ((undef!0 (_ BitVec 8))
            (undef!1 (_ BitVec 8))
            (undef!2 (_ BitVec 8)))
    (! ; wrapper expression for adding attributes 
     (let (
           (a!1 (not (and np_%y (= ((_ extract 7 3) %y) #b00000) np_%x)))
           (a!2 (bvnot (bvor (bvnot undef!0) (bvnot (bvlshr #xff %y)))))
          )
      (let (
            (a!3 (or a!1
                  (= (bvsle undef!2 a!2)
                   (bvsle undef!3 (bvlshr #xff %y)))))
           )
       (not a!3)))
     :weight 0) ; :weight is an attribute here with a term value of 0
   )
   (= isundef_%x #b1) ; <- !
   (= #b0 isundef_%y) ; <- !
  ) ; END AND 1

  ; ---------------------------- ;
  ; FAILING CASE FOR BELOW MODEL ;
  ; ---------------------------- ;
  ; CASE x is def, y is def
  (and ; BEGIN AND 2
   (forall ((undef!0 (_ BitVec 8))
            (undef!1 (_ BitVec 8))
            (undef!2 (_ BitVec 8)))
    (! 
     (let (
           (a!1 ; !( np_%y && np_%x && (5 msb are 0) )
            ;                      XXXXXXXX ** (_ extract 7 3 b)
            ;                      ^___^    
            (not (and np_%y (= ((_ extract 7 3) %y) #b00000) np_%x)))
           (a!2 ; ~( ~x  |  ~(255 >> %y) )
            (bvnot (bvor (bvnot %x) (bvnot (bvlshr #xff %y))))))
      (let (
            (a!3 ; a1 || ()
             (or a!1 (= (bvsle %x a!2) (bvsle %x (bvlshr #xff %y))))))
         ; !a3
         (not a!3)))
     :weight 0))
   (= #b0 isundef_%x) ; <- !
   (= #b0 isundef_%y) ; <- !
  ) ; END AND 2

  ; CASE  x is undef, y is undef
  (and ; BEGIN AND 3
   (forall ((undef!0 (_ BitVec 8))
            (undef!1 (_ BitVec 8))
            (undef!2 (_ BitVec 8)))
    (! (let ((a!1 (not (and np_%y
                        (= ((_ extract 7 3) undef!1) #b00000)
                        np_%x
                        (= ((_ extract 7 3) undef!4) #b00000))))
             (a!2 (bvnot (bvor (bvnot undef!0)
                          (bvnot (bvlshr #xff undef!1))))))
        (let ((a!3 (or a!1
                    (= (bvsle undef!2 a!2)
                     (bvsle undef!3 (bvlshr #xff undef!4))))))
         (not a!3)))
     :weight 0))
   (= isundef_%x #b1)
   (= isundef_%y #b1)) ; END AND 3

  ; CASE x is def and y is undef
  (and ; BEGIN AND 4
   (forall ((undef!0 (_ BitVec 8))
            (undef!1 (_ BitVec 8))
            (undef!2 (_ BitVec 8)))
    (! (let ((a!1 (not (and np_%y
                        (= ((_ extract 7 3) undef!1) #b00000)
                        np_%x
                        (= ((_ extract 7 3) undef!4) #b00000))))
             (a!2 (bvnot (bvor (bvnot %x) (bvnot (bvlshr #xff undef!1))))))
        (let ((a!3 (or a!1
                    (= (bvsle %x a!2) (bvsle %x (bvlshr #xff undef!4))))))
         (not a!3)))
     :weight 0))
   (= #b0 isundef_%x) ; <- !
   (= isundef_%y #b1) ; <- !
  ) ; END AND 4
 ) ; END OR 1
) ; END ASSERT

; (assert (not (= %y #x00))) ; 0

(check-sat)
(get-model)

; sat                                                                                                               
; (                                                                                                                 
;   (define-fun isundef_%x () (_ BitVec 1)                                                                          
;     #b0)                                                                                                          
;   (define-fun isundef_%y () (_ BitVec 1)                                                                          
;     #b0)                                                                                                          
;   (define-fun %x () (_ BitVec 8)                                                                                  
;     #x01)                                                                                                         
;   (define-fun %y () (_ BitVec 8)                                                                                  
;     #x00)                                                                                                         
;   (define-fun np_%y () Bool                                                                                       
;     true)                                                                                                         
;   (define-fun np_%x () Bool                                                                                       
;     true)                                                                                                         
;   (define-fun undef!3 () (_ BitVec 8)                                                                             
;     #x00)                                                                                                         
;   (define-fun undef!4 () (_ BitVec 8)                                                                             
;     #x00)                                                                                                         
; )  
