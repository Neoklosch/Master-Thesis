FILENAME = thesis

all: createpdf movethesis clean

createpdf:
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape $(FILENAME).tex
	bibtex $(FILENAME)
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape $(FILENAME).tex
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape $(FILENAME).tex

movethesis:
	mv thesis.pdf Master_Thesis_-_Markus_Paeschke.pdf

clean:
	rm -f texput.log $(FILENAME).out $(FILENAME).toc $(FILENAME).ind $(FILENAME).ilg $(FILENAME).idx $(FILENAME).aux $(FILENAME).log $(FILENAME).bbl $(FILENAME).blg $(FILENAME).synctex.gz $(FILENAME).lof $(FILENAME).lol $(FILENAME).lot $(FILENAME).thm sections/*.aux thesis.pdf *.mtc* *.maf

rebuild: clean all
