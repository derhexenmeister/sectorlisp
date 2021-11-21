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
;  Can't (ADDTUP (ONE TWO))??? or similar with quotes. User error?
;
((LAMBDA (NOT OR AND ZERO ONE TWO THREE FOUR FIVE ADD1 SUB1 + - * / ^ > < = ADDTUP TUP+ ZERO? LENGTH PICK REMPICK)
INSERT_TEST_DATA_HERE
	 )
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
 ; If numbers are well formed then this can just be:
 ; (QUOTE (LAMBDA (N) (EQ (CAR N) (QUOTE 0))))
 ; but we'll make it more strict so we can use it
 ; for NUMBER?
 ;
 (QUOTE (LAMBDA (N) (EQ (CAR N) (QUOTE 0))))
 ;(QUOTE (LAMBDA (N)
;		(COND
;		  ((EQ NIL N) NIL)
;		  ((ATOM N) NIL)
;		  ((QUOTE T) (AND (EQ (CAR N) (QUOTE 0))
;				  (EQ (CDR N NIL))))
;		  )))
		  
 ; LENGTH page 76
 (QUOTE (LAMBDA (LAT)
                (COND
		  ((EQ NIL LAT) ZERO)
		  ((QUOTE T) (ADD1 (LENGTH (CDR LAT))))
		  )))
 ; PICK page 76
 (QUOTE (LAMBDA (N LAT)
                (COND
		  ((ZERO? N) (QUOTE *UNDEFINED))
		  ((EQ NIL LAT) (QUOTE *UNDEFINED))
		  ((ZERO? (SUB1 N)) (CAR LAT))
		  ((QUOTE T) (PICK (SUB1 N) (CDR LAT)))
		  )))
 ; REMPICK page 76
 (QUOTE (LAMBDA (N LAT)
                (COND
		  ((ZERO? N) (QUOTE *UNDEFINED))
		  ((EQ NIL LAT) (QUOTE *UNDEFINED))
		  ((> N (LENGTH LAT)) (QUOTE *UNDEFINED))
		  ((ZERO? (SUB1 N)) (CDR LAT))
		  ((QUOTE T) (CONS (CAR LAT)
				   (REMPICK (SUB1 N) (CDR LAT))))
		  )))
 ;; This closes out the test
 )
