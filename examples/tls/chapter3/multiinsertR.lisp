; See "The Little Schemer", Fourth Edition, page 56
;
; multiinsertR - insert atom new to the right of atom old in the list of atoms lat
;
((LAMBDA (MULTIINSERTR NEW OLD LAT) (MULTIINSERTR NEW OLD LAT))
 (QUOTE (LAMBDA (NEW OLD LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) OLD) (CONS (CAR LAT)
                                                (CONS NEW (MULTIINSERTR NEW OLD (CDR LAT)))))
                      ((QUOTE T) (CONS (CAR LAT)
                                       (MULTIINSERTR NEW OLD (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 )
