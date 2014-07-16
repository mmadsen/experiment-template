.PHONY : clean

pdf:
	latexmk -pdf outline 
	open -a /Applications/Skim.app outline.pdf

clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md *.pdf *.docx paper.tex *.epub
