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

all: decl_prog.pdf

decl_prog.pdf: decl_prog.tex $(TEXS)
	pdflatex decl_prog.tex
	pdflatex decl_prog.tex

clean:
	rm -f *.aux *.log *.out *.pdf *.toc
