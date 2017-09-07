#! /bin/bash
cp main.tex test.tex
cp main.bib test.bib
pdflatex test.tex
bibtex test
cp test.bbl main.bbl
rm test.*