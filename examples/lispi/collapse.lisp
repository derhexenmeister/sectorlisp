;; Based on "Function to Collapse a List of Elements"
;; LISP I
;; PROGRAMMER's MANUAL
;; March 1, 1960
;; by Phyllis Fox
;;
((LAMBDA (COLLAPSE L) (COLLAPSE L))
 (QUOTE (LAMBDA (L)
                (COND ((ATOM L) (CONS L NIL))
                      ((EQ NIL (CDR L)) (COND ((ATOM (CAR L)) L)
                                              ((QUOTE T) (COLLAPSE (CAR L)))))
                      ((QUOTE T) (APPEND (COLLAPSE (CAR L)) (COLLAPSE (CDR L)))))))
INSERT_TEST_DATA_HERE
)
