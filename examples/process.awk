# Awk script to run lisp testcases
# Usage: awk -f process.awk < tls_tests.txt
#
BEGIN {
	# Set this on the command line
	# e.g. -v RUNMETACIRCULAR=1
	#RUNMETACIRCULAR = 1

	# Set this on the command line
	# e.g. -v DEBUG=1
	#DEBUG = 1

	MAXERRS = 10

	METACIRCULAR = "metacircular/lisp.lisp"
	TEMPLISP = "program.lisp"
	TEMPLISPMETA = "program_meta.lisp"

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
		print "process: test # = " TESTCNT
		print "process: file = " file
		print "process: input = " input
		print "process: output = " output
		if (RUNMETACIRCULAR) {
			print "process: embedding in metacircular interpreter"
		}
	}

	# Create an input file for piping into lisp
	while ((getline line < file) > 0) {
		# Drop comments
		sub(/;.*$/, "", line)

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

	# Now we can optionally insert the test program into the
	# metacircular interpreter
	first = 1
	if (RUNMETACIRCULAR) {
		cmd = LISPCMD "< " TEMPLISPMETA
		while ((getline line < METACIRCULAR) > 0) {
			# Drop comments
			sub(/;.*$/, "", line)

			# Embed the preprocessed program into
			# the metacircular interpreter
			# (This should never be the first line)
			if (index(line, INPUT_LABEL)) {
				# Wrap the program in an EVAL
				print "(EVAL (QUOTE" >> TEMPLISPMETA
				while ((getline line < TEMPLISP) > 0) {
					print line >> TEMPLISPMETA
				}
				close(TEMPLISP)
				# End of wrapping the program in an EVAL
				print ")())" >> TEMPLISPMETA
			}
			else if (line != "") {
				if (first) {
					print line > TEMPLISPMETA
					first = 0
				}
				else {
					print line >> TEMPLISPMETA
				}
			}
		}
		close(METACIRCULAR)
		close(TEMPLISPMETA)
	}
	else {
		cmd = LISPCMD "< " TEMPLISP
	}

	# Run lisp and capture the last line of output
	if (DEBUG) {
		print "process: cmd = " cmd
	}
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
		if (ERRORCNT == MAXERRS) {
			print ERRORSTR "error count reached MAXERRS"
			exit
		}
	}

}
