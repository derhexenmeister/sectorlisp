; See "The Little Schemer", Fourth Edition, page 16
;
; List of atoms? (lat? l)
; Returns
;  T if the list l is a composed only of atoms
;  NIL otherwise
;
((LAMBDA (LAT? L) (LAT? L))
 (QUOTE (LAMBDA (L)
                (COND ((EQ NIL L) (QUOTE T))
		      ((ATOM L) NIL)
                      ((ATOM (CAR L)) (LAT? (CDR L)))
                      ((QUOTE T) NIL))))
INSERT_TEST_DATA_HERE
 )
