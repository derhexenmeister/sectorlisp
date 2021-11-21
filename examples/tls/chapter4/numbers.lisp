; See "The Little Schemer", Fourth Edition, Chapter 4, page 59
;
; Representing numbers with simple lists which can be
; evaluated by bc. This representation is not used in TLS.
;
; Note:
;  This only handles unsigned numbers (non-negative integers)
;  Some numbers ZERO, ONE, ..., FIVE are defined for convenienve
;
; TBD/TODO
;  Can't (ADDTUP (ONE TWO))??? or similar with quotes
;
((LAMBDA (ZERO ONE TWO THREE FOUR FIVE ADD1 SUB1 + - * ADDTUP ZERO?)
INSERT_TEST_DATA_HERE
	 )
 ; ZERO
 (QUOTE (0))
 ; ONE
 (QUOTE (1+ 0))
 ; TWO
 (QUOTE (1+ 1+ 0))
 ; THREE
 (QUOTE (1+ 1+ 1+ 0))
 ; FOUR
 (QUOTE (1+ 1+ 1+ 1+ 0))
 ; FIVE
 (QUOTE (1+ 1+ 1+ 1+ 1+ 0))
 ; ADD1 page 59
 (QUOTE (LAMBDA (N) (CONS (QUOTE 1+) N)))
 ; SUB1 page 59
 (QUOTE (LAMBDA (N) (CDR N)))
 ; + page 60
 (QUOTE (LAMBDA (N M)
                (COND
                 ((ZERO? M) N)
                 ((QUOTE T) (ADD1 (+ N (SUB1 M))))
                 )))
 ; - page 61
 (QUOTE (LAMBDA (N M)
                (COND
                 ((ZERO? M) N)
                 ((QUOTE T) (SUB1 (- N (SUB1 M))))
                 )))
 ; * page 65
 (QUOTE (LAMBDA (N M)
                (COND
                 ((ZERO? M) ZERO)
                 ((QUOTE T) (+ N (* N (SUB1 M))))
                 )))
 ; ADDTUP page 64
 (QUOTE (LAMBDA (TUP)
                (COND
                 ((EQ NIL TUP) ZERO)
                 ((QUOTE T) (+ (CAR TUP) (ADDTUP (CDR TUP))))
                 )))
 ; ZERO? page 60
 (QUOTE (LAMBDA (N) (EQ (CAR N) (QUOTE 0))))
 )
