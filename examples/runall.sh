#!/bin/sh
# This will run all of the examples/tests for sectorlisp within this
# subdirectory.
#
# Options:
#
# If you are debugging an issue related to this script, then you can use:
# ./runall.sh -v DEBUG=1
#
# If you want to exit a test phase early upon an error:
# ./runall.sh -v MAXERRS=1
#
clear
echo "======================================================================"
echo "Running lispi tests"
awk -f process.awk \
	"$@" \
	-v TEMPLISPFMT="preprocessed/lispi/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/lispi/program_meta%d.lisp" \
	< lispi/lispi.txt

echo "----------------------------------------------------------------------"
echo "Running lispi metacircular tests embedded in metacircular evaluator"
awk -f process.awk \
	"$@" \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/lispi/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/lispi/program_meta%d.lisp" \
	< lispi/lispi.txt

echo "======================================================================"
echo "Running ff preembedded in metacircular evaluator"
awk -f process.awk \
	"$@" \
	-v TEMPLISPFMT="preprocessed/meta/program_premeta%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/meta/program_premetameta%d.lisp" \
	< metacircular/ff_meta.txt

echo "----------------------------------------------------------------------"
echo "Running ff preembedded in metacircular evaluator once again embedded in metacircular evaluator"
awk -f process.awk \
	"$@" \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/meta/program_premeta%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/meta/program_premetameta%d.lisp" \
	< metacircular/ff_meta.txt

echo "======================================================================"
echo "Running standalone_tests"
awk -f process.awk \
	"$@" \
	-v TEMPLISPFMT="preprocessed/standalone/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/standalone/program_meta%d.lisp" \
	< standalone/standalone_tests.txt

echo "----------------------------------------------------------------------"
echo "Running standalone_tests embedded in metacircular evaluator"
awk -f process.awk \
	"$@" \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/standalone/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/standalone/program_meta%d.lisp" \
	< standalone/standalone_tests.txt

echo "======================================================================"
echo "Running tls_tests"
awk -f process.awk \
	"$@" \
	-v TEMPLISPFMT="preprocessed/tls/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/tls/program_meta%d.lisp" \
       	< tls/tls_tests.txt

echo "----------------------------------------------------------------------"
echo "Running tls_tests embedded in metacircular evaluator"
awk -f process.awk \
	"$@" \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/tls/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/tls/program_meta%d.lisp" \
	< tls/tls_tests.txt

echo "======================================================================"
echo "Running aoi_tests"
awk -f process.awk \
	"$@" \
	-v TEMPLISPFMT="preprocessed/aoi/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/aoi/program_meta%d.lisp" \
       	< aoi/aoi_tests.txt

echo "----------------------------------------------------------------------"
echo "Running aoi_tests embedded in metacircular evaluator"
awk -f process.awk \
	"$@" \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/aoi/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/aoi/program_meta%d.lisp" \
	< aoi/aoi_tests.txt

echo "======================================================================"
echo "Running meta_tests (cannot run embedded in metacircular evaluator here)"
awk -f process.awk \
	"$@" \
	-v TEMPLISPFMT="preprocessed/meta/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/meta/program_meta%d.lisp" \
	< metacircular/meta_tests.txt

echo "======================================================================"
echo "Running purelisp_tests"
awk -f process.awk \
	"$@" \
	-v TEMPLISPFMT="preprocessed/purelisp/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/purelisp/program_meta%d.lisp" \
       	< purelisp/purelisp_tests.txt

echo "----------------------------------------------------------------------"
echo "Running purelisp_tests embedded in metacircular evaluator"
awk -f process.awk \
	"$@" \
	-v RUNMETACIRCULAR=1 \
	-v TEMPLISPFMT="preprocessed/purelisp/program%d.lisp" \
       	-v TEMPLISPMETAFMT="preprocessed/purelisp/program_meta%d.lisp" \
	< purelisp/purelisp_tests.txt
echo "======================================================================"
