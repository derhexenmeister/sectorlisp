; See "The Little Schemer", Fourth Edition, page 52
;
; Replace the first instance of atom o1 or o2 with new in the list
; of atoms lat (subst new old lat)
; Returns
;  Modified list
;
; Notes: here we show how we can make use of another function OR
; (even though it's not really needed here.) Also we show a different
; place to insert the test data.
;
((LAMBDA (OR SUBST2)
INSERT_TEST_DATA_HERE
	 )
 ; OR
 (QUOTE (LAMBDA (A B)
                (COND ((EQ A (QUOTE T)) (QUOTE T))
                      ((EQ B (QUOTE T)) (QUOTE T))
                      ((QUOTE T) (QUOTE NIL))))
        )
 ; SUBST2
 (QUOTE (LAMBDA (NEW O1 O2 LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((OR (EQ (CAR LAT) O1)
                           (EQ (CAR LAT) O2))
                       (CONS NEW (CDR LAT)))
                      ((QUOTE T) (CONS (CAR LAT)
                                       (SUBST2 NEW O1 O2 (CDR LAT))))))
        )
 )
