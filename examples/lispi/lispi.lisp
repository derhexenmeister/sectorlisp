;; Examples taken from:
;; LISP I
;; PROGRAMMER's MANUAL
;; March 1, 1960
;; by Phyllis Fox
;;
((LAMBDA (FF SUBST NOT OR AND EQUAL NULL APPEND AMONG LIST PAIR CAAR CADAR ASSOC COLLAPSE)
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
 ; NOTE: original didn't use COND
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
 ; Page 16
 ; (append x y) useful when S-expressions are regarded as lists
 ;
 (QUOTE (LAMBDA (X Y)
                (COND ((NULL X) Y)
                      ((QUOTE T) (CONS (CAR X) (APPEND (CDR X) Y)))
                      )
                ))
 ;
 ; Page 16
 ; (among x y) - this predicate is true if  the S-expression X
 ; occurs among the elements of list y
 ; Note: rewrote with cond
 ;
 (QUOTE (LAMBDA (X Y)
                (COND ((NULL Y) NIL)
                      ((QUOTE T) (OR (EQUAL X (CAR Y))
                                     (AMONG X (CDR Y))))
                      )))
 ;
 ; Helper function - list
 ; X must be an atom, y can be an atom or a list
 (QUOTE (LAMBDA (X Y)
        (COND ((ATOM Y) (CONS X Y))
              ((QUOTE T) (CONS X (CONS Y NIL))))
        ))
 ;
 ; Page 16
 ; (pair x y) this function gives the list of pairs of corresponding
 ; elements of the lists x and y
 ;
 (QUOTE (LAMBDA (X Y)
                (COND ((OR (NULL X) (NULL Y)) NIL)
                      ((QUOTE T) (CONS (LIST (CAR X) (CAR Y))
                                       (PAIR (CDR X) (CDR Y))))
                      )))
 ;
 ; Helper functions
 ;
 (QUOTE (LAMBDA (X) (CAR (CAR X))))       ; caar
 (QUOTE (LAMBDA (X) (CAR (CDR (CAR X))))) ; cadar
 ;
 ; Page 16
 ; (assoc x y) If y is a list of the form ((u1 v1) .. (un vn)) and x
 ; is one of the u's then (assoc x y) is the corresponing v
 ;
 (QUOTE (LAMBDA (X Y)
                (COND ((EQUAL X (CAAR Y)) (CADAR Y))
                      ((QUOTE T) (ASSOC X (CDR Y))))
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
