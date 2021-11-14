; Chapter 4 - representing numbers with simple lists which can be
; evaluated by bc (once NIL is filtered out by a script)
;
; Note:
;  This only handles unsigned numbers (non-negative integers)
;  Some numbers ZERO, ONE, ..., FIVE are defined for convenienve
;
;  TBD - Can't (ADDTUP (ONE TWO))??? or similar with quotes
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
 ; ADD1
 (QUOTE (LAMBDA (N) (CONS (QUOTE 1+) N)))
 ; SUB1
 (QUOTE (LAMBDA (N) (CDR N)))
 ; +
 (QUOTE (LAMBDA (N M)
                (COND
                 ((ZERO? M) N)
                 ((QUOTE T) (ADD1 (+ N (SUB1 M))))
                 )))
 ; -
 (QUOTE (LAMBDA (N M)
                (COND
                 ((ZERO? M) N)
                 ((QUOTE T) (SUB1 (- N (SUB1 M))))
                 )))
 ; *
 (QUOTE (LAMBDA (N M)
                (COND
                 ((ZERO? M) ZERO)
                 ((QUOTE T) (+ N (* N (SUB1 M))))
                 )))
 ; ADDTUP
 (QUOTE (LAMBDA (TUP)
                (COND
                 ((EQ NIL TUP) ZERO)
                 ((QUOTE T) (+ (CAR TUP) (ADDTUP (CDR TUP))))
                 )))
 ; ZERO?
 (QUOTE (LAMBDA (N) (EQ (CAR N) (QUOTE 0))))
 )
