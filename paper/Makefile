.PHONY : clean

pdf:
	./knit pdf
	pandoc -s -S --biblio paper.bib paper.md --template=xelatex-template.tex --latex-engine=xelatex -o paper.tex --natbib --number-sections --listings
	latexmk -pdf paper
	open -a /Applications/Skim.app paper.pdf


github:
	./knit github
	pandoc -s -S --biblio paper.bib paper.md -o paper_github.md

md:
	pandoc -s -S --biblio paper.bib paper.md -o paper.md

odt:
	./knit docx
	pandoc -s -S --biblio paper.bib paper.md --reference-odt=reference.odt -o paper.odt


docx:
	./knit docx
	pandoc -s -S --biblio paper.bib paper.md --reference-docx=reference.docx -o paper.docx



epub:
	./knit epub
	pandoc -s -S --biblio paper.bib paper.md -o paper.epub


clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md *.pdf *.docx paper.tex *.epub
