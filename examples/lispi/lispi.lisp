;; Examples taken from:
;; LISP I
;; PROGRAMMER's MANUAL
;; March 1, 1960
;; by Phyllis Fox
;;
((LAMBDA (FF SUBST COLLAPSE)
INSERT_TEST_DATA_HERE
)
 ;
 ; Page 14
 ; The value of (ff x) is the first atomic symbol of the S-expression x
 ; with the parenthesis ignored.
 (QUOTE (LAMBDA (X)
                (COND ((ATOM X) X)
                      ((QUOTE T) (FF (CAR X))))))
 ;
 ; Page 15
 ; (subst x y z) -rename parameters (subst new old list)
 ; this function gives the result of substituting the S-expression
 ; new for all occurances of the atomic symbol old in the S-expression lisp.
 ;
 (QUOTE (LAMBDA (NEW OLD LIST)
                (COND ((ATOM LIST) (COND ((EQ LIST OLD) NEW)
                                         ((QUOTE T) LIST)
                                         )
                                   )
                      ((QUOTE T) (CONS (SUBST NEW OLD (CAR LIST))
                                       (SUBST NEW OLD (CDR LIST))))
                      )
                ))
 ;
 ; Page xx
 ; Based on "Function to Collapse a List of Elements"
 ;
 (QUOTE (LAMBDA (L)
                (COND ((ATOM L) (CONS L NIL))
                      ((EQ NIL (CDR L)) (COND ((ATOM (CAR L)) L)
                                              ((QUOTE T) (COLLAPSE (CAR L)))))
                      ((QUOTE T) (APPEND (COLLAPSE (CAR L)) (COLLAPSE (CDR L)))))))
 )
