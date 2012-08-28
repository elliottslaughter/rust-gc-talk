template = template.tex

all: talk.pdf

%.pdf: %.md $(template)
	pandoc --latex-engine xelatex --template template.tex --to beamer $< -o $@
