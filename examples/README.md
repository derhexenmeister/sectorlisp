Hopefully these examples show that it is possible to write some interesting examples in the rather constrained sectorlisp environment. Hopefully it also helps test sectorlisp, and makes it easier to write additional examples.

Note: Some of these examples require more memory than sectorlisp has allocated by default.

runall.sh		- runs all of the provided examples and reports the results
cleanup.sh		- cleans up generated files
process.awk		- awk script used to process test lists

standalone_tests.txt	- test cases which could be run at the REPL with no setup
empty.lisp

meta_tests.txt		- tests/exploration related to the metacircular evaluator
ff.txt			- tests for the sector lisp find first test case
ff_meta.txt		- additional level of testing (another layer of metacircular eval)
metacircular/		- lisp source for metacircular evaluator tests


tls_tests.txt		- tests of examples based on "The Little Schemer" book
tls/			- lisp source for The Little Schemer examples

preprocessed/		- holds generated lisp code with embedded test data

Notes:

The Little Schemer is an interesting book for those without experience with recursion. It works through the examples using a Socratic dialog.
