; Make a list consisting of the first element of each sublist (firsts l)
; Returns
;  A list consisting of the first element of each sublist
;
((LAMBDA (FIRSTS L) (FIRSTS L))
 (QUOTE (LAMBDA (L)
                (COND ((EQ NIL L) (QUOTE NIL))
                      ((EQ (CAR LAT) A) (CDR LAT))
                      ((QUOTE T) (CONS (CAR (CAR L))
                                       (FIRSTS (CDR L)))))))
INSERT_TEST_DATA_HERE
 )
