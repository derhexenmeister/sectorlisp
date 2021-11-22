; Examples based on:
;  AI Memo No. 453
;  May 1978
; The Art of the Interpreter
; or, The Modularity Complex
; (Parts Zero, One, and Two)
; by
; Guy Steele Jr. and Gerald Jay Sussman
; Page 57
;
((LAMBDA (REVERSE REVERSEI)
INSERT_TEST_DATA_HERE
	 )
 ; REVERSE
 (QUOTE (LAMBDA (L)
		(COND ((EQ NIL L) NIL)
		      ((ATOM L) (QUOTE *UNDEFINED))
		      ((QUOTE T) (REVERSEI L (QUOTE ()))))))
 ; REVERSEI
 (QUOTE (LAMBDA (OLD NEW)
                (COND ((EQ NIL OLD) NEW)
		      ((QUOTE T) (REVERSEI (CDR OLD) (CONS (CAR OLD) NEW))))
		))
 )
