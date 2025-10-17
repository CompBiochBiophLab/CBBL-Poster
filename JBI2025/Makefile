# Makefile for compiling main.tex with figures in FIGDIR folder and .sty files in STYDIR folder

MAIN=JBI2025_FEEC

FIGDIR=figures
STYDIR=./

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(wildcard $(FIGDIR)/*) $(wildcard $(STYDIR)/*.sty)
	export TEXINPUTS=.//:
	latexmk -pdf $(MAIN).tex

clean:
	latexmk -C
	rm -f $(MAIN).pdf

.PHONY: all clean
