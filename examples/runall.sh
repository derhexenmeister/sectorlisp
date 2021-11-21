#!/bin/sh
clear
echo "======================================================================"
echo "Running ff"
awk -f process.awk \
	-v TEMPLISPFMT="preprocessed/ff/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/ff/program_meta%d.lisp" \
	< ff.txt

echo "----------------------------------------------------------------------"
echo "Running ff embedded in metacircular evaluator"
awk -f process.awk \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/ff/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/ff/program_meta%d.lisp" \
	< ff.txt

echo "======================================================================"
echo "Running ff preembedded in metacircular evaluator"
awk -f process.awk \
	-v TEMPLISPFMT="preprocessed/ff/program_premeta%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/ff/program_premetameta%d.lisp" \
	< ff_meta.txt

echo "----------------------------------------------------------------------"
echo "Running ff preembedded in metacircular evaluator once again embedded in metacircular evaluator"
awk -f process.awk \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/ff/program_premeta%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/ff/program_premetameta%d.lisp" \
	< ff_meta.txt

echo "======================================================================"
echo "Running standalone_tests"
awk -f process.awk \
	-v TEMPLISPFMT="preprocessed/standalone/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/standalone/program_meta%d.lisp" \
	< standalone_tests.txt

echo "----------------------------------------------------------------------"
echo "Running standalone_tests embedded in metacircular evaluator"
awk -f process.awk \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/standalone/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/standalone/program_meta%d.lisp" \
	< standalone_tests.txt

echo "======================================================================"
echo "Running tls_tests"
awk -f process.awk \
	-v TEMPLISPFMT="preprocessed/tls/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/tls/program_meta%d.lisp" \
       	< tls_tests.txt

echo "----------------------------------------------------------------------"
echo "Running tls_tests embedded in metacircular evaluator"
awk -f process.awk \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/tls/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/tls/program_meta%d.lisp" \
	< tls_tests.txt

echo "======================================================================"
echo "Running meta_tests (cannot run embedded in metacircular evaluator here)"
awk -f process.awk \
	-v TEMPLISPFMT="preprocessed/meta/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/meta/program_meta%d.lisp" \
	< meta_tests.txt

echo "======================================================================"
