# Makefile for compiling main.tex with figures in figures/ folder and .sty files in common/ folder

MAIN=JBI2025_FEEC

FIGDIR=figures
STYDIR=common

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(wildcard $(FIGDIR)/*) $(wildcard $(STYDIR)/*.sty)
	latexmk -pdf $(MAIN).tex

clean:
	latexmk -C
	rm -f $(MAIN).pdf

.PHONY: all clean
