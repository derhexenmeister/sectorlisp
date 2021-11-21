# Awk script to run lisp testcases
# Usage: awk -f process.awk < tls_tests.txt
#
BEGIN {
	# A slightly customized version of the project's
	# metacircular evaluatior (only formatting changes)
	#
	METACIRCULAR = "metacircular/lisp.lisp"

	INPUT_LABEL = "INSERT_TEST_DATA_HERE"

	LISPCMD = "../lisp"

	ERRORSTR = "ERROR:"
	TESTCNT = 0
	ERRORCNT = 0

	# Set this on the command line
	# e.g. -v RUNMETACIRCULAR=1
	#RUNMETACIRCULAR = 1

	# Set this on the command line
	# e.g. -v DEBUG=1
	#DEBUG = 1

	# The following parameters can be set on the command line or
	# can use default values
	#
	if (!MAXERRS) {
		MAXERRS = 100
	}

	if (!TEMPLISPFMT) {
		TEMPLISPFMT = "preprocessed/program%d.lisp"
	}
	if (!TEMPLISPMETAFMT) {
		TEMPLISPMETAFMT = "preprocessed/program_meta%d.lisp"
	}
}

END {
	if (!DEBUG) {
		print "" # Newline after progress dots
	}
	if (ERRORCNT == 0) {
		print "PASSED: Ran " TESTCNT " test case(s) with no errors"
	}
	else {
		print "FAILED: Ran " TESTCNT " test case(s) with " ERRORCNT " error(s)"
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
	templisp = sprintf(TEMPLISPFMT, TESTCNT)
	first = 1
	if (DEBUG) {
		print "=========="
		print "process: test # = " TESTCNT
		print "process: file = " file
		print "process: input = " input
		print "process: output = " output
		if (RUNMETACIRCULAR) {
			print "process: embedding in metacircular evaluator"
		}
	}
	else {
		printf(".") # Show progress
	}

	# Create an input file for piping into lisp
	while ((getline line < file) > 0) {
		# Drop comments
		sub(/;.*$/, "", line)

		# Replace tag with desired input data
		gsub(INPUT_LABEL, input, line)
		if (line != "") {
			if (first) {
				print line > templisp
				first = 0
			}
			else {
				print line >> templisp
			}
		}
	}
	close(file)
	close(templisp)

	# Now we can optionally insert the test program into the
	# metacircular evaluator
	templispmeta = sprintf(TEMPLISPMETAFMT, TESTCNT)
	first = 1
	if (RUNMETACIRCULAR) {
		cmd = LISPCMD " < " templispmeta
		while ((getline line < METACIRCULAR) > 0) {
			# Drop comments
			sub(/;.*$/, "", line)

			# Embed the preprocessed program into
			# the metacircular evaluator
			# (This should never be the first line)
			if (index(line, INPUT_LABEL)) {
				# Wrap the program in an EVAL
				print "(EVAL (QUOTE" >> templispmeta
				while ((getline line < templisp) > 0) {
					print line >> templispmeta
				}
				close(templisp)
				# End of wrapping the program in an EVAL
				print ")())" >> templispmeta
			}
			else if (line != "") {
				if (first) {
					print line > templispmeta
					first = 0
				}
				else {
					print line >> templispmeta
				}
			}
		}
		close(METACIRCULAR)
		close(templispmeta)
	}
	else {
		cmd = LISPCMD " < " templisp
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
		print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		print ERRORSTR "Processing input file = " file
		print ERRORSTR "Command = " cmd
		print ERRORSTR "input data = " input
		print ERRORSTR "expected output = " output
		print ERRORSTR "actual output = " actual
		if (ERRORCNT == MAXERRS) {
			print ERRORSTR "error count reached MAXERRS"
			exit
		}
	}

}
