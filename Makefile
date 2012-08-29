code_listings=example1.rs example2.rs example3.rs

.PHONY: all
all: talk.pdf

.PHONY: clean
clean:
	rm -f *.pdf *.aux *.log *.nav *.out *.snm *.toc *.vrb

%.pdf: %.tex $(code_listings)
	lualatex $<
