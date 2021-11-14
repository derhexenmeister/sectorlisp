; Insert atom new to the right of the first instance of atom old
; in the list of atoms lat (insertR new old lat)
;
((LAMBDA (INSERTR NEW OLD LAT) (INSERTR NEW OLD LAT))
 (QUOTE (LAMBDA (NEW OLD LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) OLD) (CONS OLD (CONS NEW (CDR LAT))))
                      ((QUOTE T) (CONS (CAR LAT) (INSERTR NEW OLD (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 )
