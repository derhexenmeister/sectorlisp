; Replace the first instance of atom old with new in the list of atoms lat (subst new old lat)
; Returns
;  Modified list
((LAMBDA (SUBST NEW OLD LAT) (SUBST NEW OLD LAT))
 (QUOTE (LAMBDA (NEW OLD LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) OLD) (CONS NEW (CDR LAT)))
                      ((QUOTE T) (CONS (CAR LAT) (SUBST NEW OLD (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 )
