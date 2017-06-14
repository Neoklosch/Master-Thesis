FILENAME = thesis

all: createpdf movethesis clean

fast:
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape $(FILENAME).tex

createpdf:
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape $(FILENAME).tex
	biber $(FILENAME)
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape $(FILENAME).tex
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode -shell-escape $(FILENAME).tex

movethesis:
	mv thesis.pdf Master_Thesis_-_Markus_Paeschke.pdf

creatertf:
	latex $(FILENAME)
	biber $(FILENAME)
	latex2rtf $(FILENAME)

clean:
	rm -f texput.log $(FILENAME).out $(FILENAME).toc $(FILENAME).ind $(FILENAME).ilg $(FILENAME).idx $(FILENAME).aux $(FILENAME).log $(FILENAME).bbl $(FILENAME).blg $(FILENAME).synctex.gz $(FILENAME).lof $(FILENAME).lol $(FILENAME).lot $(FILENAME).thm sections/*.aux thesis.pdf *.mtc* *.maf thesis.bcf thesis.run.xml

spellcheck:
	aspell -c -t sections/001_abstract.tex -d en
	aspell -c -t sections/001_acknowledgments.tex -d en
	aspell -c -t sections/001_deposition.tex -d en
	aspell -c -t sections/001_zusammenfassung.tex -d de
	aspell -c -t sections/002_introduction.tex -d en
	aspell -c -t sections/003_state_of_the_art.tex -d en
	aspell -c -t sections/004_requirements_analysis.tex -d en
	aspell -c -t sections/005_design.tex -d en
	aspell -c -t sections/006_implementation.tex -d en
	aspell -c -t sections/007_evaluation.tex -d en
	aspell -c -t sections/008_summary.tex -d en

rebuild: clean all
