template = template.tex

all: talk.pdf

%.pdf: %.md $(template)
	pandoc --latex-engine lualatex --template template.tex --to beamer $< -o $@
