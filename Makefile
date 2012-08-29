.PHONY: all
all: talk.pdf

.PHONY: clean
clean:
	rm talk.pdf

%.pdf: %.tex
	lualatex $<
