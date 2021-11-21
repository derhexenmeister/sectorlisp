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
((LAMBDA (ZERO ONE TWO THREE FOUR FIVE ADD1 SUB1 + - * / ^ > < = ADDTUP TUP+ ZERO?)
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
 ; / page 75
 (QUOTE (LAMBDA (N M)
                (COND
		  ((ZERO? M) (QUOTE *UNDEFINED))
		  ((< N M) ZERO)
		  ((QUOTE T) (ADD1 (/ (- N M) M)))
		  )))
 ; ^ page 74
 (QUOTE (LAMBDA (N M)
                (COND
                 ((ZERO? M) ONE)
		 ((QUOTE T) (* N (^ N (SUB1 M))))
		 )))
 ; > page 71
 (QUOTE (LAMBDA (N M)
		(COND
		  ((ZERO? N) NIL)
		  ((ZERO? M) (QUOTE T))
		  ((QUOTE T) (> (SUB1 N) (SUB1 M)))
		  )))
 ; < page 73
 (QUOTE (LAMBDA (N M)
		(COND
		  ((ZERO? M) NIL)
		  ((ZERO? N) (QUOTE T))
		  ((QUOTE T) (< (SUB1 N) (SUB1 M)))
		  )))
 ; = page 74
 (QUOTE (LAMBDA (N M)
		(COND
		  ((> N M) NIL)
		  ((< N M) NIL)
		  ((QUOTE T) (QUOTE T))
		  )))
 ; ADDTUP page 62
 (QUOTE (LAMBDA (TUP)
                (COND
                 ((EQ NIL TUP) ZERO)
                 ((QUOTE T) (+ (CAR TUP) (ADDTUP (CDR TUP))))
                 )))
 ; TUP+ page 67
 (QUOTE (LAMBDA (TUP1 TUP2)
                (COND
                 ((EQ NIL TUP1) TUP2)
                 ((EQ NIL TUP2) TUP1)
                 ((QUOTE T) (CONS (+ (CAR TUP1) (CAR TUP2))
                                  (TUP+ (CDR TUP1) (CDR TUP2))))
                 )))
 ; ZERO? page 60
 (QUOTE (LAMBDA (N) (EQ (CAR N) (QUOTE 0))))
 )
