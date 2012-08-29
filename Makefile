.PHONY: all
all: talk.pdf

.PHONY: clean
clean:
	rm -f *.pdf *.aux *.log *.nav *.out *.snm *.toc *.vrb

%.pdf: %.tex
	lualatex $<
