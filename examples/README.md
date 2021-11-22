# Examples for sectorlisp

Hopefully these examples show that it is possible to write some interesting examples in the rather constrained sectorlisp environment. It could also test sectorlisp when new features are added such as garbage collection.

Note: Some of these examples require more memory than sectorlisp has allocated by default. (Maybe garbage collection will fix it.)

## Files

- runall.sh	: runs all of the provided examples and reports the results
- cleanup.sh : cleans up generated files
- process.awk : awk script used to process test lists

- standalone/	: test cases which could be run at the REPL with no setup
  - standalone_tests.txt
  - empty.lisp : allows generation of standalone tests (test data insertion)

- metacircular/ : metacircular evaluator tests
  - meta_tests.txt : tests/exploration related to the metacircular evaluator

  - ff.txt : tests for the sector lisp find first test case
  - ff.lisp : find first lisp code

  - ff_meta.txt : additional level of testing (another layer of metacircular eval)
  - ff_meta.lisp : find first lisp code preembedded in the metacircular evaluator

  - lisp.lisp : metacircular code edited to enable testing

- tls/ : lisp source for The Little Schemer examples
  - tls_tests.txt : tests of examples based on "The Little Schemer" book
  - chapter2/ : examples separated by chapter
  - chapter3/
  - chapter4/

- aoi/ : for examples from "The Art of the Interpreter"

- preprocessed/ : holds generated lisp code with embedded test data

## Notes

The Little Schemer is an interesting book for those without experience with recursion. It works through the examples using a Socratic dialog.
