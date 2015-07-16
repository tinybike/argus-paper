TEX=xelatex -shell-escape
BIB=qa.bib
BBL=$(BIB:%.bib=%.bbl)

all: argus-working.pdf

$(BBL): $(BIB)
	rm -f $(BBL)
	$(TEX) argus-working
	bibtex argus-working || :
	$(TEX) argus-working

argus-working.pdf: argus-working.tex $(BBL)
	$(TEX) argus-working

clean:
	rm -f argus-working.pdf argus-working.aux argus-working.log argus-working.blg $(BBL)
