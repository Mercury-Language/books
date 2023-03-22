#-----------------------------------------------------------------------------#
# vim: ts=8 sw=8 noexpandtab
#-----------------------------------------------------------------------------#

TEXS = \
	preface.tex \
	introduction.tex \
	by-example.tex \
	fopc.tex \
	operational.tex \
	execution.tex \
	extensions.tex \
	nonclassical.tex \
	glossary.tex

MS = \
	code/dpm_queue.m

all: decl_prog.pdf

decl_prog.pdf: decl_prog.tex $(TEXS) $(MS)
	pdflatex decl_prog.tex
	pdflatex decl_prog.tex

clean:
	rm -f *.aux *.log *.out *.pdf *.toc
