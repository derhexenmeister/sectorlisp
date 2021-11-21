; See "The Little Schemer", Fourth Edition, page 22
;
; Is the atom a in the list of atoms lat (member? a lat)
; Returns
;  T if the atom a is in the list l
;  NIL otherwise
((LAMBDA (MEMBER? A LAT) (MEMBER? A LAT))
 (QUOTE (LAMBDA (A LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) A) (QUOTE T))
                      ((QUOTE T) (MEMBER? A (CDR LAT))))))
INSERT_TEST_DATA_HERE
 )
