#!/bin/sh
clear
echo "======================================================================"
echo "Running standalone_tests"
awk -f process.awk < standalone_tests.txt 
echo "======================================================================"
echo "Running tls_tests"
awk -f process.awk < tls_tests.txt 
echo "======================================================================"
echo "Running meta_tests"
awk -f process.awk < meta_tests.txt 
echo "======================================================================"
