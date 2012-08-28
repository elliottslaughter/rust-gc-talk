all: talk.pdf

%.pdf: %.md template.tex
	pandoc --template template.tex --to beamer $< -o $@
