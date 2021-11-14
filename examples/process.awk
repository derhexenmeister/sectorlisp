# Awk script to run lisp testcases
# Usage: awk -f process.awk < testlist.txt
#
BEGIN {
	DEBUG = 1
	TEMPLISP = "program.lisp"
	INPUT_LABEL = "INSERT_TEST_DATA_HERE"
	LISPCMD = "../lisp"
	ERRORSTR = "ERROR:"
	TESTCNT = 0
	ERRORCNT = 0
}

END {
	if (ERRORCNT == 0) {
		print "PASSED: Ran " TESTCNT " test cases with no errors"
	}
	else {
		print "FAILED: Ran " TESTCNT " test cases with " ERRORCNT " errors"
	}
}

/^file:/ {
	# Remove label and leading whitespace
	$1 = ""
	sub(/^[ \t]+/, "")
	file = $0
}

/^input:/ {
	$1 = ""
	sub(/^[ \t]+/, "")
	input = $0
}

/^output:/ {
	$1 = ""
	sub(/^[ \t]+/, "")
	output = $0
	process(file, input, output)
}

function process(file, input, output,    first, line, actual) {
	TESTCNT = TESTCNT + 1
	first = 1
	if (DEBUG) {
		print "=========="
		print "process: file = " file
		print "process: input = " input
		print "process: output = " output
	}

	# Create an input file for piping into lisp
	while ((getline line < file) > 0) {
		# Drop comments
		sub(/;.+$/, "", line)

		# Replace tag with desired input data
		gsub(INPUT_LABEL, input, line)
		if (line != "") {
			if (first) {
				print line > TEMPLISP
				first = 0
			}
			else {
				print line >> TEMPLISP
			}
		}
	}
	close(file)
	close(TEMPLISP)

	# Run lisp and capture the last line of output
	cmd = LISPCMD "< " TEMPLISP
	actual = ""
	while ((cmd | getline line) > 0) {
		if (line != "") {
			actual = line
			if (DEBUG) {
				print "Captured actual = " actual
			}
		}
	}
	close(cmd)
	if (actual != output) {
		ERRORCNT = ERRORCNT + 1
		print ERRORSTR "processing file = " file
		print ERRORSTR "input data = " input
		print ERRORSTR "expected output = " output
		print ERRORSTR "actual output = " actual
	}

}
