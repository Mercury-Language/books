.PHONY: all dvi ps gz html

DOCS = book

CHAPTERS = $(wildcard *.tex)

all:  pdf gz
pdf:  $(addsuffix .pdf,${DOCS})
dvi:  $(addsuffix .dvi,${DOCS})
ps:   $(addsuffix .ps,${DOCS})
gz:   $(addsuffix .ps.gz,${DOCS})
html: $(addsuffix .html,${DOCS})

book.dvi: book.tex $(CHAPTERS)

%.pdf: %.ps
	ps2pdf $*.ps

%.ps: %.dvi
	dvips $*.dvi
	cat $*.ps | duplex > $*.duplex.ps

%.dvi: %.tex
	latex $*.tex

%.ps.gz: %.ps
	gzip --force $*.ps

%.html: %.tex
	expandshortverb *.tex > *.exp
	latex2html -split 0 $*.exp
