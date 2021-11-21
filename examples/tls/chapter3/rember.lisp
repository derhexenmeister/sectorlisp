; See "The Little Schemer", Fourth Edition, page 33
;
; Remove member (rember a lat)
; Returns
;  The list of atoms lat with the first instance of atom a removed
;
((LAMBDA (REMBER A LAT) (REMBER A LAT))
 (QUOTE (LAMBDA (A LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) A) (CDR LAT))
                      ((QUOTE T) (CONS (CAR LAT) (REMBER A (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 )
