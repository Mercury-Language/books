.PHONY: book.dvi book.ps book.pdf



book.dvi:
	for i in *.polytex; do echo "$$(ls -l $$i | gawk '{print "Last edited", $$6, $$7, $$8}')" > $$i.date; done
	./create-diffs-if-necessary
	./polytex book.polytex

book.ps: book.dvi
	dvips book.dvi
	gzip -c book.ps > book.ps.gz

book.pdf: book.ps
	pdflatex book.tex

all: book.dvi book.ps book.pdf
