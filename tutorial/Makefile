.PHONY: all dvi ps gz html

DOCS = book

CHAPTERS = \
	FFI.tex \
	RTTI.tex \
	arrays.tex \
	compiling-programs.tex \
	debugging.tex \
	declarative-vs-imperative.tex \
	defs.tex \
	exceptions.tex \
	functions.tex \
	hello-world.tex \
	higher-order.tex \
	impure-code.tex \
	introduction.tex \
	io.tex \
	lists.tex \
	logic.tex \
	maps.tex \
	modes.tex \
	modules.tex \
	optimization.tex \
	pragmas.tex \
	predicates.tex \
	stores.tex \
	syntax-and-terminology.tex \
	type-classes.tex \
	types.tex

all:  dvi
dvi:  $(addsuffix .dvi,${DOCS})
ps:   $(addsuffix .ps,${DOCS})
gz:   $(addsuffix .ps.gz,${DOCS})
html: $(addsuffix .html,${DOCS})

book.dvi: book.tex $(CHAPTERS)

%.dvi: %.tex
	latex $*.tex

%.ps: %.dvi
	dvips $*.dvi

%.ps.gz: %.ps
	gzip $*.ps

%.html: %.tex
	expandshortverb $*.tex > $*.exp
	latex2html -split 0 $*.exp
