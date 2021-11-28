;; Examples taken from:
;; LISP I
;; PROGRAMMER's MANUAL
;; March 1, 1960
;; by Phyllis Fox
;;
((LAMBDA (FF SUBST NOT OR AND EQUAL NULL APPEND COLLAPSE)
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
 ; (subst x y z) --renamed parameters--> (subst new old list)
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
 ; Helper functions for equal below
 ;
 ; logical NOT
 (QUOTE (LAMBDA (A)
                (COND
		  ((EQ A (QUOTE T)) NIL)
		  ((QUOTE T) (QUOTE T)))
		))
 ; logical OR
 (QUOTE (LAMBDA (A B)
                (COND
		  ((EQ A (QUOTE T)) (QUOTE T))
                  ((EQ B (QUOTE T)) (QUOTE T))
                  ((QUOTE T) NIL))
		))
 ; logical AND
 (QUOTE (LAMBDA (A B)
                (COND
		  ((EQ A NIL) NIL)
                  ((EQ B NIL) NIL)
                  ((QUOTE T) (QUOTE T)))
		))
 ;
 ; Page 15
 ; (equal x y) this is a predicate that has the value T is x and y are the
 ; same s-expression and has the value NIL otherwise.
 ;
 ; NOTE: original didn't use COND, but I found it easier to parse
 ;
 (QUOTE (LAMBDA (X Y)
                (COND ((AND (ATOM X) (ATOM Y)) (EQ X Y))
                      ((OR (ATOM X) (ATOM Y)) NIL)
                      ((QUOTE T) (AND (EQUAL (CAR X) (CAR Y))
                                      (EQUAL (CDR X) (CDR Y)))))
                ))
 ;
 ; Page 15
 ; (null x) this predicate is useful for dealing with lists
 ;
 (QUOTE (LAMBDA (X)
                (AND (ATOM X) (EQ X NIL))
                ))
 ;
 ; Page 15
 ; (append x y) useful when S-expressions are regarded as lists
 ;
 (QUOTE (LAMBDA (X Y)
                (COND ((NULL X) Y)
                      ((QUOTE T) (CONS (CAR X) (APPEND (CDR X) Y)))
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
