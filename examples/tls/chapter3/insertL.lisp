; Insert atom new to the left of the first instance of atom old
; in the list of atoms lat (insertL new old lat)
;
((LAMBDA (INSERTL NEW OLD LAT) (INSERTL NEW OLD LAT))
 (QUOTE (LAMBDA (NEW OLD LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) OLD) (CONS NEW LAT))
                      ((QUOTE T) (CONS (CAR LAT) (INSERTL NEW OLD (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 )

