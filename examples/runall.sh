#!/bin/sh
clear
echo "======================================================================"
echo "Running ff"
awk -f process.awk < ff.txt 
echo "Running ff embedded in metacircular evaluator"
awk -f process.awk RUNMETACIRCULAR=1 < ff.txt 
echo "======================================================================"
echo "Running standalone_tests"
awk -f process.awk < standalone_tests.txt 
echo "Running standalone_tests embedded in metacircular evaluator"
awk -f process.awk RUNMETACIRCULAR=1 < standalone_tests.txt 
echo "======================================================================"
echo "Running tls_tests"
awk -f process.awk < tls_tests.txt 
echo "Running tls_tests embedded in metacircular evaluator"
awk -f process.awk -v RUNMETACIRCULAR=1 < tls_tests.txt 
echo "======================================================================"
echo "Running meta_tests"
awk -f process.awk < meta_tests.txt 
echo "======================================================================"
