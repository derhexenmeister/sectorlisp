;; FF embedded in the metacircular evaluator, and we can
;; embed it yet again. See ff.lisp for more info.
;;
;; Generate from preprocessed/ff/program_meta1.lisp
;;
((LAMBDA (ASSOC EVCON PAIRLIS EVLIS APPLY EVAL)
(EVAL (QUOTE
((LAMBDA (FF X) (FF X))
 (QUOTE (LAMBDA (X)
          (COND ((ATOM X) X)
                ((QUOTE T) (FF (CAR X))))))
INSERT_TEST_DATA_HERE
 )
)())
   )
 
 (QUOTE (LAMBDA (X Y)
          (COND ((EQ Y ()) ())
                ((EQ X (CAR (CAR Y)))
                       (CDR (CAR Y)))
                ((QUOTE T)
                 (ASSOC X (CDR Y))))))
 
 (QUOTE (LAMBDA (C A)
          (COND ((EVAL (CAR (CAR C)) A)
                 (EVAL (CAR (CDR (CAR C))) A))
                ((QUOTE T) (EVCON (CDR C) A)))))
 
 (QUOTE (LAMBDA (X Y A)
          (COND ((EQ X ()) A)
                ((QUOTE T) (CONS (CONS (CAR X) (CAR Y))
                                 (PAIRLIS (CDR X) (CDR Y) A))))))
 
 (QUOTE (LAMBDA (M A)
          (COND ((EQ M ()) ())
                ((QUOTE T) (CONS (EVAL (CAR M) A)
                                 (EVLIS (CDR M) A))))))
 
 (QUOTE (LAMBDA (FN X A)
          (COND
            ((ATOM FN)
             (COND ((EQ FN (QUOTE CAR))  (CAR  (CAR X)))
                   ((EQ FN (QUOTE CDR))  (CDR  (CAR X)))
                   ((EQ FN (QUOTE ATOM)) (ATOM (CAR X)))
                   ((EQ FN (QUOTE CONS)) (CONS (CAR X) (CAR (CDR X))))
                   ((EQ FN (QUOTE EQ))   (EQ   (CAR X) (CAR (CDR X))))
                   ((QUOTE T)            (APPLY (EVAL FN A) X A))))
            ((EQ (CAR FN) (QUOTE LAMBDA))
             (EVAL (CAR (CDR (CDR FN)))
                   (PAIRLIS (CAR (CDR FN)) X A))))))
 
 (QUOTE (LAMBDA (E A)
          (COND
            ((ATOM E) (ASSOC E A))
            ((ATOM (CAR E))
             (COND ((EQ (CAR E) (QUOTE QUOTE)) (CAR (CDR E)))
                   ((EQ (CAR E) (QUOTE COND)) (EVCON (CDR E) A))
                   ((QUOTE T) (APPLY (CAR E) (EVLIS (CDR E) A) A))))
            ((QUOTE T) (APPLY (CAR E) (EVLIS (CDR E) A) A))))))
