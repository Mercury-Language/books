.PHONY: all

all: book.dvi book.ps book.pdf

book.dvi: *.polytex
	for i in *.polytex; do echo "$$(ls -l $$i | gawk '{print "Last edited", $$6, $$7}')" > $$i.date; done
	./create-diffs-if-necessary
	./polytex book.polytex

book.ps: book.dvi
	dvips book

book.ps.gz: book.ps
	gzip -c book.ps > book.ps.gz

book.pdf: book.dvi
	pdflatex book
	pdflatex book
	pdflatex book
