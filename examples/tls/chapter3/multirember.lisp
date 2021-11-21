; See "The Little Schemer", Fourth Edition, page 53
;
; multirember - remove all occurances of a from lat
;
((LAMBDA (MULTIREMBER A LAT) (MULTIREMBER A LAT))
 (QUOTE (LAMBDA (A LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) A) (MULTIREMBER A (CDR LAT)))
                      ((QUOTE T) (CONS (CAR LAT)
                                       (MULTIREMBER A (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 )
