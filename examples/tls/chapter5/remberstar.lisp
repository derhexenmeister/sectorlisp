; See "The Little Schemer", Fourth Edition, page 81
;
; rember*
;
((LAMBDA (REMBER* A L) (REMBER* A L))
 (QUOTE (LAMBDA (A L)
                (COND ((EQ NIL L) (QUOTE NIL))
                      ((ATOM (CAR L)) (COND ((EQ (CAR L) A) (REMBER* A (CDR L)))
                                            ((QUOTE T) (CONS (CAR L) (REMBER* A (CDR L))))))
                      ((QUOTE T) (CONS (REMBER* A (CAR L)) (REMBER* A (CDR L)))))))
INSERT_TEST_DATA_HERE
)
