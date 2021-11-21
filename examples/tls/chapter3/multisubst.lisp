; See "The Little Schemer", Fourth Edition, page 57
;
; multisubst - replace the first instance of atom old with atom new in the list of atoms lat
;
; (QUOTE fudge) (QUOTE topping) (QUOTE (topping ice cream with topping for dessert)) -> (FUDGE ICE CREAM WITH FUDGE FOR DESSERT∙NIL)
;
((LAMBDA (MULTISUBST NEW OLD LAT) (MULTISUBST NEW OLD LAT))
 (QUOTE (LAMBDA (NEW OLD LAT)
                (COND ((EQ NIL LAT) (QUOTE NIL))
                      ((EQ (CAR LAT) OLD) (CONS NEW (MULTISUBST NEW OLD (CDR LAT))))
                      ((QUOTE T) (CONS (CAR LAT) (MULTISUBST NEW OLD (CDR LAT)))))))
INSERT_TEST_DATA_HERE
 )
