; See "The Little Schemer", Fourth Edition, page 56
;
; multiinsertL - insert atom new to the left of atom old in the list of atoms lat
;
((LAMBDA (MULTIINSERTL NEW OLD LAT) (MULTIINSERTL NEW OLD LAT))
 (QUOTE (LAMBDA (NEW OLD LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) OLD) (CONS NEW (CONS OLD (MULTIINSERTL NEW OLD (CDR LAT)))))
                      ((QUOTE T) (CONS (CAR LAT) (MULTIINSERTL NEW OLD (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 );
