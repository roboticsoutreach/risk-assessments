
# Use with make FILE=<filename>
all:
	pdflatex -interaction nonstopmode -file-line-error ${FILE}

clean:
	rm *.aux *.log *.out
